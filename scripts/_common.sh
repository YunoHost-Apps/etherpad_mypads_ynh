#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# NodeJS version
nodejs_version=18

# MyPads version
# This variable is mostly used to force an upgrade of the package in case of new versions of MyPads.
mypads_version=1.7.24

# Plugin versions
ep_align_version=0.3.53
ep_author_hover_version=0.3.37
ep_comments_page_version=1.0.5
ep_countable_version=0.0.13
ep_delete_empty_pads_version=0.0.10
ep_font_color_version=0.0.63
ep_headings2_version=0.2.44
ep_markdown_version=0.1.50
ep_spellcheck_version=0.0.43
ep_subscript_and_superscript_version=0.2.47
ep_font_size_version=0.4.44

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

ynh_maintenance_mode_ON () {
	# Load value of $path and $domain from the config if their not set
	if [ -z $path ]; then
		path=$(ynh_app_setting_get $app path)
	fi
	if [ -z $domain ]; then
		domain=$(ynh_app_setting_get $app domain)
	fi

	mkdir -p /var/www/html/
	
	# Create an html to serve as maintenance notice
	echo "<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="3">
<title>Your app $app is currently under maintenance!</title>
<style>
	body {
		width: 70em;
		margin: 0 auto;
	}
</style>
</head>
<body>
<h1>Your app $app is currently under maintenance!</h1>
<p>This app has been put under maintenance by your administrator at $(date)</p>
<p>Please wait until the maintenance operation is done. This page will be reloaded as soon as your app will be back.</p>

</body>
</html>" > "/var/www/html/maintenance.$app.html"

	# Create a new nginx config file to redirect all access to the app to the maintenance notice instead.
	echo "# All request to the app will be redirected to ${path}_maintenance and fall on the maintenance notice
rewrite ^${path}/(.*)$ ${path}_maintenance/? redirect;
# Use another location, to not be in conflict with the original config file
location ${path}_maintenance/ {
alias /var/www/html/ ;

try_files maintenance.$app.html =503;

# Include SSOWAT user panel.
include conf.d/yunohost_panel.conf.inc;
}" > "/etc/nginx/conf.d/$domain.d/maintenance.$app.conf"

	# The current config file will redirect all requests to the root of the app.
	# To keep the full path, we can use the following rewrite rule:
	# 	rewrite ^${path}/(.*)$ ${path}_maintenance/\$1? redirect;
	# The difference will be in the $1 at the end, which keep the following queries.
	# But, if it works perfectly for a html request, there's an issue with any php files.
	# This files are treated as simple files, and will be downloaded by the browser.
	# Would be really be nice to be able to fix that issue. So that, when the page is reloaded after the maintenance, the user will be redirected to the real page he was.

	systemctl reload nginx
}

ynh_maintenance_mode_OFF () {
	# Load value of $path and $domain from the config if their not set
	if [ -z $path ]; then
		path=$(ynh_app_setting_get $app path)
	fi
	if [ -z $domain ]; then
		domain=$(ynh_app_setting_get $app domain)
	fi

	# Rewrite the nginx config file to redirect from ${path}_maintenance to the real url of the app.
	echo "rewrite ^${path}_maintenance/(.*)$ ${path}/\$1 redirect;" > "/etc/nginx/conf.d/$domain.d/maintenance.$app.conf"
	systemctl reload nginx

	# Sleep 4 seconds to let the browser reload the pages and redirect the user to the app.
	sleep 4

	# Then remove the temporary files used for the maintenance.
	rm "/var/www/html/maintenance.$app.html"
	rm "/etc/nginx/conf.d/$domain.d/maintenance.$app.conf"

	systemctl reload nginx
}

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
