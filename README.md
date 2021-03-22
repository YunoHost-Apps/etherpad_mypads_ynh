# Etherpad with MyPads plugin for YunoHost

[![Integration level](https://dash.yunohost.org/integration/etherpad_mypads.svg)](https://dash.yunohost.org/appci/app/etherpad_mypads) ![](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.status.svg) [![](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.maintain.svg)](https://github.com/YunoHost/Apps/#what-to-do-if-i-cant-maintain-my-app-anymore-)  
[![Install Etherpad with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=etherpad_mypads)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install Etherpad quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview
Etherpad is a highly customizable Open Source online editor providing collaborative editing in really real-time.  
This package will install the same plugins than [Framapad](https://framapad.org/).

**Shipped version:** 1.8.12

## Screenshots

![](https://github.com/ether/etherpad-lite/blob/develop/doc/images/etherpad_demo.gif)

## Demo

* [Official demo](https://video.etherpad.com/)

## Configuration

You can access two different admin panels, for Etherpad by accessing `domain.tld/admin` and for MyPads by `domain.tld/mypads/?/admin`. 
You can also find a configuration file for Etherpad at this path `/var/www/etherpad_mypads/settings.json`.

*Skin Builder* (accessible at this address `domain.tld/pad/p/test#skinvariantsbuilder`) allows you to customize the skin of your pad. It will give you a parameter to copy into your configuration file `/var/www/etherpad_mypads/settings.json`.

## Documentation

 * Official documentation: http://etherpad.org/doc/v1.8.4
 * YunoHost documentation: https://yunohost.org/#/app_etherpad_mypads

## YunoHost specific features

#### Multi-users support

 * Is LDAP auth supported (for MyPads access only)? **Yes**
 * Can the app be used by multiple users? **Yes**

#### Supported architectures

* x86-64 - [![](https://ci-apps.yunohost.org/ci/logs/etherpad_mypads%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/etherpad_mypads/)
* ARMv8-A - [![](https://ci-apps-arm.yunohost.org/ci/logs/etherpad_mypads%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/etherpad_mypads/)

## Limitations

## Additionnal informations

* This package will install the following plugins:

  * [ep_align](https://www.npmjs.com/package/ep_align) - *Add Left/Center/Right/Justify to lines of text in a pad*
  * [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Adds author names to span titles*
  * [ep_automatic_logut](https://www.npmjs.com/package/ep_automatic_logut) - *Automatically disconnects user after some period of time (Prevent server overload)*
  * [ep_comments_page](https://www.npmjs.com/package/ep_comments_page) - *Adds comments on sidebar and link it to the text.*
  * [ep_countable](https://www.npmjs.com/package/ep_countable) - *Adds paragraphs, words and characters count*
  * [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Delete pads which were never edited*
  * [ep_font_color](https://www.npmjs.com/package/ep_font_color) - *Apply colors to fonts*
  * [ep_font_size](https://www.npmjs.com/package/ep_font_size) - *Add support for Font Sizes*
  * [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Adds heading support to Etherpad Lite.*
  * [ep_markdown](https://www.npmjs.com/package/ep_markdown) - *Edit and Export as Markdown in Etherpad*
  * [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groups and private pads for etherpad*
  * [ep_spellcheck](https://www.npmjs.com/package/ep_spellcheck) - *Add support to do 'Spell checking'*
  * [ep_subscript_and_superscript](https://www.npmjs.com/package/ep_subscript_and_superscript) - *Add support for Subscript and Superscript*
  * [ep_table_of_contents](https://www.npmjs.com/package/ep_table_of_contents) - *View a table of contents for your pad*

## Links

 * Report a bug: https://github.com/YunoHost-Apps/etherpad_mypads_ynh/issues
 * Etherpad website: http://etherpad.org/
 * MyPads plugin website: https://git.framasoft.org/framasoft/ep_mypads
 * Upstream app repository: https://github.com/ether/etherpad-lite
 * YunoHost website: https://yunohost.org/

---

## Developers infos

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
or
sudo yunohost app upgrade etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
```
