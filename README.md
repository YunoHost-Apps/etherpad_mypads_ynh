<!--
N.B.: This README was automatically generated by <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
It shall NOT be edited by hand.
-->

# Etherpad MyPads for YunoHost

[![Integration level](https://dash.yunohost.org/integration/etherpad_mypads.svg)](https://ci-apps.yunohost.org/ci/apps/etherpad_mypads/) ![Working status](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.maintain.svg)

[![Install Etherpad MyPads with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=etherpad_mypads)

*[Read this README in other languages.](./ALL_README.md)*

> *This package allows you to install Etherpad MyPads quickly and simply on a YunoHost server.*  
> *If you don't have YunoHost, please consult [the guide](https://yunohost.org/install) to learn how to install it.*

## Overview

Etherpad is a real-time collaborative editor scalable to thousands of simultaneous real time users. It provides full data export capabilities, and runs on your server, under your control.

This version of Etherpad is preconfigured with a collection of plugins: 

- [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groups and private pads for etherpad*
- [ep_align](https://www.npmjs.com/package/ep_align) - *Add Left/Center/Right/Justify alignment*
- [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Display author names when hovereing text*
- [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Delete pads which were never edited*
- [ep_font_size](https://www.npmjs.com/package/ep_font_size) - *Be able to change font size*
- [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Be able to set text as headers*



**Shipped version:** 2.2.2~ynh1

**Demo:** <https://video.etherpad.com>

## Screenshots

![Screenshot of Etherpad MyPads](./doc/screenshots/etherpad_demo.gif)

## Documentation and resources

- Official app website: <http://etherpad.org>
- Official admin documentation: <http://etherpad.org/doc/v1.9.0>
- Upstream app code repository: <https://github.com/ether/etherpad-lite>
- YunoHost Store: <https://apps.yunohost.org/app/etherpad_mypads>
- Report a bug: <https://github.com/YunoHost-Apps/etherpad_mypads_ynh/issues>

## Developer info

Please send your pull request to the [`testing` branch](https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing).

To try the `testing` branch, please proceed like that:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
or
sudo yunohost app upgrade etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
