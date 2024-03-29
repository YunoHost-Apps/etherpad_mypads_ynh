<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# Etherpad MyPads per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/etherpad_mypads.svg)](https://dash.yunohost.org/appci/app/etherpad_mypads) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.maintain.svg)

[![Installa Etherpad MyPads con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=etherpad_mypads)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare Etherpad MyPads su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

Etherpad is a real-time collaborative editor scalable to thousands of simultaneous real time users. It provides full data export capabilities, and runs on your server, under your control.

This version of Etherpad is preconfigured with a collection of plugins: 

- [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groups and private pads for etherpad*
- [ep_align](https://www.npmjs.com/package/ep_align) - *Add Left/Center/Right/Justify alignment*
- [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Display author names when hovereing text*
- [ep_comments_page](https://www.npmjs.com/package/ep_comments_page) - *Add comments on sidebar and link it to the text.*
- [ep_countable](https://www.npmjs.com/package/ep_countable) - *Add paragraphs, words and characters count*
- [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Delete pads which were never edited*
- [ep_font_color](https://www.npmjs.com/package/ep_font_color) - *Be able to change font color*
- [ep_font_size](https://www.npmjs.com/package/ep_font_size) - *Be able to change font size*
- [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Be able to set text as headers*
- [ep_markdown](https://www.npmjs.com/package/ep_markdown) - *Edit and export as Markdown*
- [ep_spellcheck](https://www.npmjs.com/package/ep_spellcheck) - *Add spell checking*
- [ep_subscript_and_superscript](https://www.npmjs.com/package/ep_subscript_and_superscript) - *Support for subscript and superscript*


**Versione pubblicata:** 1.9.1~ynh3

**Prova:** <https://video.etherpad.com>

## Screenshot

![Screenshot di Etherpad MyPads](./doc/screenshots/etherpad_demo.gif)

## Documentazione e risorse

- Sito web ufficiale dell’app: <http://etherpad.org>
- Documentazione ufficiale per gli amministratori: <http://etherpad.org/doc/v1.9.0>
- Repository upstream del codice dell’app: <https://github.com/ether/etherpad-lite>
- Store di YunoHost: <https://apps.yunohost.org/app/etherpad_mypads>
- Segnala un problema: <https://github.com/YunoHost-Apps/etherpad_mypads_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
o
sudo yunohost app upgrade etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
