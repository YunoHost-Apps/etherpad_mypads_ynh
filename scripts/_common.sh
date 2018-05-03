#!/bin/bash

#=================================================
# BACKUP
#=================================================

HUMAN_SIZE () {	# Transforme une taille en Ko en une taille lisible pour un humain
	human=$(numfmt --to=iec --from-unit=1K $1)
	echo $human
}

CHECK_SIZE () {	# Vérifie avant chaque backup que l'espace est suffisant
	file_to_analyse=$1
	backup_size=$(du --summarize "$file_to_analyse" | cut -f1)
	free_space=$(df --output=avail "/home/yunohost.backup" | sed 1d)

	if [ $free_space -le $backup_size ]
	then
		ynh_print_err "Espace insuffisant pour sauvegarder $file_to_analyse."
		ynh_print_err "Espace disponible: $(HUMAN_SIZE $free_space)"
		ynh_die "Espace nécessaire: $(HUMAN_SIZE $backup_size)"
	fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

n_install_dir="/opt/node_n"
node_version_path="$n_install_dir/n/versions/node"
# N_PREFIX is the directory of n, it needs to be loaded as a environment variable.
export N_PREFIX="$n_install_dir"

# Install Node version management
#
# [internal]
#
# usage: ynh_install_n
ynh_install_n () {
	echo "Installation of N - Node.js version management" >&2
	# Build an app.src for n
	mkdir -p "../conf"
	echo "SOURCE_URL=https://github.com/tj/n/archive/v2.1.7.tar.gz
SOURCE_SUM=2ba3c9d4dd3c7e38885b37e02337906a1ee91febe6d5c9159d89a9050f2eea8f" > "../conf/n.src"
	# Download and extract n
	ynh_setup_source "$n_install_dir/git" n
	# Install n
	(cd "$n_install_dir/git"
	PREFIX=$N_PREFIX make install 2>&1)
}

# Load the version of node for an app, and set variables.
#
# ynh_use_nodejs has to be used in any app scripts before using node for the first time.
#
# 2 variables are available:
#   - $nodejs_path: The absolute path of node for the chosen version.
#   - $nodejs_version: Just the version number of node for this app. Stored as 'nodejs_version' in settings.yml.
# And 2 alias stored in variables:
#   - $nodejs_use_version: An old variable, not used anymore. Keep here to not break old apps
#     NB: $PATH will contain the path to node, it has to be propagated to any other shell which needs to use it.
#     That's means it has to be added to any systemd script.
#
# usage: ynh_use_nodejs
ynh_use_nodejs () {
	nodejs_version=$(ynh_app_setting_get $app nodejs_version)

	nodejs_use_version="echo \"Deprecated command, should be removed\""

	# Get the absolute path of this version of node
	nodejs_path="$node_version_path/$nodejs_version/bin"

	# Load the path of this version of node in $PATH
	[[ :$PATH: == *":$nodejs_path"* ]] || PATH="$nodejs_path:$PATH"
}

# Install a specific version of nodejs
#
# n (Node version management) uses the PATH variable to store the path of the version of node it is going to use.
# That's how it changes the version
#
# ynh_install_nodejs will install the version of node provided as argument by using n.
#
# usage: ynh_install_nodejs [nodejs_version]
# | arg: nodejs_version - Version of node to install.
#        If possible, prefer to use major version number (e.g. 8 instead of 8.10.0).
#        The crontab will handle the update of minor versions when needed.
ynh_install_nodejs () {
	# Use n, https://github.com/tj/n to manage the nodejs versions
	nodejs_version="$1"

	# Create $n_install_dir
	mkdir -p "$n_install_dir"

	# Load n path in PATH
	CLEAR_PATH="$n_install_dir/bin:$PATH"
	# Remove /usr/local/bin in PATH in case of node prior installation
	PATH=$(echo $CLEAR_PATH | sed 's@/usr/local/bin:@@')

	# Move an existing node binary, to avoid to block n.
	test -x /usr/bin/node && mv /usr/bin/node /usr/bin/node_n
	test -x /usr/bin/npm && mv /usr/bin/npm /usr/bin/npm_n

	# If n is not previously setup, install it
	if ! test $(n --version > /dev/null 2>&1)
	then
		ynh_install_n
	fi

	# Modify the default N_PREFIX in n script
	ynh_replace_string "^N_PREFIX=\${N_PREFIX-.*}$" "N_PREFIX=\${N_PREFIX-$N_PREFIX}" "$n_install_dir/bin/n"

	# Restore /usr/local/bin in PATH
	PATH=$CLEAR_PATH

	# And replace the old node binary.
	test -x /usr/bin/node_n && mv /usr/bin/node_n /usr/bin/node
	test -x /usr/bin/npm_n && mv /usr/bin/npm_n /usr/bin/npm

	# Install the requested version of nodejs
	n $nodejs_version

	# Find the last "real" version for this major version of node.
	real_nodejs_version=$(find $node_version_path/$nodejs_version* -maxdepth 0 | sort --version-sort | tail --lines=1)
	real_nodejs_version=$(basename $real_nodejs_version)

	# Create a symbolic link for this major version if the file doesn't already exist
	if [ ! -e "$node_version_path/$nodejs_version" ]
	then
		ln --symbolic --force --no-target-directory $node_version_path/$real_nodejs_version $node_version_path/$nodejs_version
	fi

	# Store the ID of this app and the version of node requested for it
	echo "$YNH_APP_ID:$nodejs_version" | tee --append "$n_install_dir/ynh_app_version"

	# Store nodejs_version into the config of this app
	ynh_app_setting_set $app nodejs_version $nodejs_version

	# Build the update script and set the cronjob
	ynh_cron_upgrade_node

	ynh_use_nodejs
}

# Remove the version of node used by the app.
#
# This helper will check if another app uses the same version of node,
# if not, this version of node will be removed.
# If no other app uses node, n will be also removed.
#
# usage: ynh_remove_nodejs
ynh_remove_nodejs () {
	nodejs_version=$(ynh_app_setting_get $app nodejs_version)

	# Remove the line for this app
	sed --in-place "/$YNH_APP_ID:$nodejs_version/d" "$n_install_dir/ynh_app_version"

	# If no other app uses this version of nodejs, remove it.
	if ! grep --quiet "$nodejs_version" "$n_install_dir/ynh_app_version"
	then
		$n_install_dir/bin/n rm $nodejs_version
	fi

	# If no other app uses n, remove n
	if [ ! -s "$n_install_dir/ynh_app_version" ]
	then
		ynh_secure_remove "$n_install_dir"
		ynh_secure_remove "/usr/local/n"
	fi
}

# Set a cron design to update your node versions
#
# [internal]
#
# This cron will check and update all minor node versions used by your apps.
#
# usage: ynh_cron_upgrade_node
ynh_cron_upgrade_node () {
	# Build the update script
	cat > "$n_install_dir/node_update.sh" << EOF
#!/bin/bash

version_path="$node_version_path"
n_install_dir="$n_install_dir"

# Log the date
date

# List all real installed version of node
all_real_version="\$(find \$version_path/* -maxdepth 0 -type d | sed "s@\$version_path/@@g")"

# Keep only the major version number of each line
all_real_version=\$(echo "\$all_real_version" | sed 's/\..*\$//')

# Remove double entries
all_real_version=\$(echo "\$all_real_version" | sort --unique)

# Read each major version
while read version
do
	echo "Update of the version \$version"
	sudo \$n_install_dir/bin/n \$version

	# Find the last "real" version for this major version of node.
	real_nodejs_version=\$(find \$version_path/\$version* -maxdepth 0 | sort --version-sort | tail --lines=1)
	real_nodejs_version=\$(basename \$real_nodejs_version)

	# Update the symbolic link for this version
	sudo ln --symbolic --force --no-target-directory \$version_path/\$real_nodejs_version \$version_path/\$version
done <<< "\$(echo "\$all_real_version")"
EOF

	chmod +x "$n_install_dir/node_update.sh"

	# Build the cronjob
	cat > "/etc/cron.daily/node_update" << EOF
#!/bin/bash

$n_install_dir/node_update.sh >> $n_install_dir/node_update.log
EOF

	chmod +x "/etc/cron.daily/node_update"
}

#=================================================

# Start or restart a service and follow its booting
#
# usage: ynh_check_starting "Line to match" [Log file] [Timeout] [Service name]
#
# | arg: Line to match - The line to find in the log to attest the service have finished to boot.
# | arg: Log file - The log file to watch
# | arg: Service name
# /var/log/$app/$app.log will be used if no other log is defined.
# | arg: Timeout - The maximum time to wait before ending the watching. Defaut 300 seconds.
ynh_check_starting () {
	local line_to_match="$1"
	local service_name="${4:-$app}"
	local app_log="${2:-/var/log/$service_name/$service_name.log}"
	local timeout=${3:-300}

	ynh_clean_check_starting () {
		# Stop the execution of tail.
		kill -s 15 $pid_tail 2>&1
		ynh_secure_remove "$templog" 2>&1
	}

	echo "Starting of $service_name" >&2
	systemctl stop $service_name
	local templog="$(mktemp)"
	# Following the starting of the app in its log
	tail -F -n0 "$app_log" > "$templog" &
	# Get the PID of the tail command
	local pid_tail=$!
	systemctl start $service_name

	local i=0
	for i in `seq 1 $timeout`
	do
		# Read the log until the sentence is found, that means the app finished to start. Or run until the timeout
		if grep --quiet "$line_to_match" "$templog"
		then
			echo "The service $service_name has correctly started." >&2
			break
		fi
		echo -n "." >&2
		sleep 1
	done
	if [ $i -eq $timeout ]
	then
		echo "The service $service_name didn't fully started before the timeout." >&2
	fi

	echo ""
	ynh_clean_check_starting
}

#=================================================

ynh_print_log () {
  echo "${1}"
}

# Print an info on stdout
#
# usage: ynh_print_info "Text to print"
# | arg: text - The text to print
ynh_print_info () {
  ynh_print_log "[INFO] ${1}"
}

# Print a error on stderr
#
# usage: ynh_print_err "Text to print"
# | arg: text - The text to print
ynh_print_err () {
  ynh_print_log "[ERR] ${1}" >&2
}

# Execute a command and force the result to be printed on stdout
#
# usage: ynh_exec_warn_less command to execute
# usage: ynh_exec_warn_less "command to execute | following command"
# In case of use of pipes, you have to use double quotes. Otherwise, this helper will be executed with the first command, then be send to the next pipe.
#
# | arg: command - command to execute
ynh_exec_warn_less () {
	eval $@ 2>&1
}

# Remove any logs for all the following commands.
#
# usage: ynh_print_OFF
# WARNING: You should be careful with this helper, and never forgot to use ynh_print_ON as soon as possible to restore the logging.
ynh_print_OFF () {
	set +x
}

# Restore the logging after ynh_print_OFF
#
# usage: ynh_print_ON
ynh_print_ON () {
	set -x
	# Print an echo only for the log, to be able to know that ynh_print_ON has been called.
	echo ynh_print_ON > /dev/null
}

#=================================================

# Create a dedicated fail2ban config (jail and filter conf files)
#
# usage: ynh_add_fail2ban_config log_file filter [max_retry [ports]]
# | arg: log_file - Log file to be checked by fail2ban
# | arg: failregex - Failregex to be looked for by fail2ban
# | arg: max_retry - Maximum number of retries allowed before banning IP address - default: 3
# | arg: ports - Ports blocked for a banned IP address - default: http,https
ynh_add_fail2ban_config () {
   # Process parameters
   logpath=$1
   failregex=$2
   max_retry=${3:-3}
   ports=${4:-http,https}
   
  test -n "$logpath" || ynh_die "ynh_add_fail2ban_config expects a logfile path as first argument and received nothing."
  test -n "$failregex" || ynh_die "ynh_add_fail2ban_config expects a failure regex as second argument and received nothing."
  
  finalfail2banjailconf="/etc/fail2ban/jail.d/$app.conf"
  finalfail2banfilterconf="/etc/fail2ban/filter.d/$app.conf"
  ynh_backup_if_checksum_is_different "$finalfail2banjailconf" 1
  ynh_backup_if_checksum_is_different "$finalfail2banfilterconf" 1
  
  sudo tee $finalfail2banjailconf <<EOF
[$app]
enabled = true
port = $ports
filter = $app
logpath = $logpath
maxretry = $max_retry
EOF

  sudo tee $finalfail2banfilterconf <<EOF
[INCLUDES]
before = common.conf
[Definition]
failregex = $failregex
ignoreregex =
EOF

  ynh_store_file_checksum "$finalfail2banjailconf"
  ynh_store_file_checksum "$finalfail2banfilterconf"
  
  systemctl restart fail2ban
  local fail2ban_error="$(journalctl -u fail2ban | tail -n50 | grep "WARNING.*$app.*")"
  if [ -n "$fail2ban_error" ]
  then
    echo "[ERR] Fail2ban failed to load the jail for $app" >&2
    echo "WARNING${fail2ban_error#*WARNING}" >&2
  fi
}

# Remove the dedicated fail2ban config (jail and filter conf files)
#
# usage: ynh_remove_fail2ban_config
ynh_remove_fail2ban_config () {
  ynh_secure_remove "/etc/fail2ban/jail.d/$app.conf"
  ynh_secure_remove "/etc/fail2ban/filter.d/$app.conf"
  sudo systemctl restart fail2ban
}

#=================================================

# Read the value of a key in a ynh manifest file
#
# usage: ynh_read_manifest manifest key
# | arg: manifest - Path of the manifest to read
# | arg: key - Name of the key to find
ynh_read_manifest () {
	manifest="$1"
	key="$2"
	python3 -c "import sys, json;print(json.load(open('$manifest'))['$key'])"
}

# Exit without error if the package is up to date
#
# This helper should be used to avoid an upgrade of a package
# when it's not needed.
#
# To force an upgrade, even if the package is up to date,
# you have to set the variable YNH_FORCE_UPGRADE before.
# example: sudo YNH_FORCE_UPGRADE=1 yunohost app upgrade MyApp
#
# usage: ynh_abort_if_up_to_date
ynh_abort_if_up_to_date () {
	local force_upgrade=${YNH_FORCE_UPGRADE:-0}
	local package_check=${PACKAGE_CHECK_EXEC:-0}

	local version=$(ynh_read_manifest "/etc/yunohost/apps/$YNH_APP_INSTANCE_NAME/manifest.json" "version" || echo 1.0)
	local last_version=$(ynh_read_manifest "../manifest.json" "version" || echo 1.0)
	if [ "$version" = "$last_version" ]
	then
		if [ "$force_upgrade" != "0" ]
		then
			echo "Upgrade forced by YNH_FORCE_UPGRADE." >&2
			unset YNH_FORCE_UPGRADE
		elif [ "$package_check" != "0" ]
		then
			echo "Upgrade forced for package check." >&2
		else
			ynh_die "Up-to-date, nothing to do" 0
		fi
	fi
}

#=================================================

# Send an email to inform the administrator
#
# usage: ynh_send_readme_to_admin app_message [recipients]
# | arg: app_message - The message to send to the administrator.
# | arg: recipients - The recipients of this email. Use spaces to separate multiples recipients. - default: root
#	example: "root admin@domain"
#	If you give the name of a YunoHost user, ynh_send_readme_to_admin will find its email adress for you
#	example: "root admin@domain user1 user2"
ynh_send_readme_to_admin() {
	local app_message="${1:-...No specific information...}"
	local recipients="${2:-root}"

	# Retrieve the email of users
	find_mails () {
		local list_mails="$1"
		local mail
		local recipients=" "
		# Read each mail in argument
		for mail in $list_mails
		do
			# Keep root or a real email address as it is
			if [ "$mail" = "root" ] || echo "$mail" | grep --quiet "@"
			then
				recipients="$recipients $mail"
			else
				# But replace an user name without a domain after by its email
				if mail=$(ynh_user_get_info "$mail" "mail" 2> /dev/null)
				then
					recipients="$recipients $mail"
				fi
			fi
		done
		echo "$recipients"
	}
	recipients=$(find_mails "$recipients")

	local mail_subject="☁️🆈🅽🅷☁️: \`$app\` was just installed!"

	local mail_message="This is an automated message from your beloved YunoHost server.

Specific information for the application $app.

$app_message

---
Automatic diagnosis data from YunoHost

$(yunohost tools diagnosis | grep -B 100 "services:" | sed '/services:/d')"

	# Define binary to use for mail command
	if [ -e /usr/bin/bsd-mailx ]
	then
		local mail_bin=/usr/bin/bsd-mailx
	else
		local mail_bin=/usr/bin/mail.mailutils
	fi

	# Send the email to the recipients
	echo "$mail_message" | $mail_bin -a "Content-Type: text/plain; charset=UTF-8" -s "$mail_subject" "$recipients"
}

#=================================================
#============= FUTURE YUNOHOST HELPER ============
#=================================================

# Delete a file checksum from the app settings
#
# $app should be defined when calling this helper
#
# usage: ynh_remove_file_checksum file
# | arg: file - The file for which the checksum will be deleted
ynh_delete_file_checksum () {
	local checksum_setting_name=checksum_${1//[\/ ]/_}	# Replace all '/' and ' ' by '_'
	ynh_app_setting_delete $app $checksum_setting_name
}
