# Etherpad with mypads plugin for YunoHost

[![Integration level](https://dash.yunohost.org/integration/etherpad_mypads.svg)](https://dash.yunohost.org/appci/app/etherpad_mypads)  
[![Install Etherpad with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=etherpad_mypads)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install etherpad quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview
Etherpad is a highly customizable Open Source online editor providing collaborative editing in really real-time.  
This package will install the same plugins than [Framapad](https://framapad.org/).

**Shipped version:** 1.7.5

## Screenshots

![](http://etherpad.org/img/screenshot.png)

## Demo

* [Official demo](https://oasis.sandstorm.io/appdemo/h37dm17aa89yrd8zuqpdn36p6zntumtv08fjpu8a8zrte7q1cn60)

## Configuration

You can access to 2 different admin panels, for etherpad by accessing `domain.tld/admin` and for mypads by `domain.tld/mypads/?/admin`.  
Or, you can find a config file for etherpad at this path `/var/www/etherpad_mypads/settings.json`.

## Documentation

 * Official documentation: http://etherpad.org/doc/v1.7.0
 * YunoHost documentation: There no other documentations, feel free to contribute.

## YunoHost specific features

#### Multi-users support

Supported, with LDAP.

#### Supported architectures

* x86-64b - [![](https://ci-apps.yunohost.org/ci/logs/etherpad_mypads%20%28Official%29.svg)](https://ci-apps.yunohost.org/ci/apps/etherpad_mypads/)
* ARMv8-A - [![](https://ci-apps-arm.yunohost.org/ci/logs/etherpad_mypads%20%28Official%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/etherpad_mypads/)
* Jessie x86-64b - [![](https://ci-stretch.nohost.me/ci/logs/etherpad_mypads%20%28Official%29.svg)](https://ci-stretch.nohost.me/ci/apps/etherpad_mypads/)

## Limitations

## Additionnal informations

* This package will install the following plugins:

  * [ep_align](https://www.npmjs.com/package/ep_align) - *Add Left/Center/Right/Justify to lines of text in a pad*
  * [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Adds author names to span titles*
  * [ep_automatic_logut](https://www.npmjs.com/package/ep_automatic_logut) - *Automatically disconnects user after some period of time (Prevent server overload)*
  * [ep_comments_page](https://www.npmjs.com/package/ep_comments_page) - *Adds comments on sidebar and link it to the text.*
  * [ep_countable](https://www.npmjs.com/package/ep_countable) - *Displays paragraphs, sentences, words and characters counts.*
  * [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Delete pads which were never edited*
  * [ep_font_color](https://www.npmjs.com/package/ep_font_color) - *Apply colors to fonts*
  * [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Adds heading support to Etherpad Lite.*
  * [ep_markdown](https://www.npmjs.com/package/ep_markdown) - *Edit and Export as Markdown in Etherpad*
  * [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groups and private pads for etherpad*
  * [ep_page_view](https://www.npmjs.com/package/ep_page_view) - *Add support to do 'page view', with a toggle on/off option in Settings, also Page Breaks with Control Enter*
  * [ep_spellcheck](https://www.npmjs.com/package/ep_spellcheck) - *Add support to do 'Spell checking'*
  * [ep_subscript_and_superscript](https://www.npmjs.com/package/ep_subscript_and_superscript) - *Add support for Subscript and Superscript*
  * [ep_table_of_contents](https://www.npmjs.com/package/ep_table_of_contents) - *View a table of contents for your pad*
  * [ep_user_font_size](https://www.npmjs.com/package/ep_user_font_size) - *User Pad Contents font size can be set in settings, this does not effect other peoples views*

## Links

 * Report a bug: https://github.com/YunoHost-Apps/etherpad_mypads_ynh/issues
 * Etherpad website: http://etherpad.org/
 * Mypads plugin website: https://git.framasoft.org/framasoft/ep_mypads
 * YunoHost website: https://yunohost.org/

---

Developers infos
----------------

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
or
sudo yunohost app upgrade etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
```
