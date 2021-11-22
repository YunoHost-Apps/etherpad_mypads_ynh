# Etherpad MyPads pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/etherpad_mypads.svg)](https://dash.yunohost.org/appci/app/etherpad_mypads) ![](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.maintain.svg)  
[![Installer Etherpad MyPads avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=etherpad_mypads)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Etherpad MyPads rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Etherpad est un éditeur collaboratif en temps réel évolutif pour des milliers d'utilisateurs simultanés en temps réel. Il fournit des capacités complètes d'exportation de données et s'exécute sur votre serveur, sous votre contrôle.


**Version incluse :** 1.8.15~ynh1

**Démo :** https://video.etherpad.com

## Captures d'écran

![](./doc/screenshots/etherpad_demo.gif)

## Avertissements / informations importantes

## Configuration

Vous pouvez accéder à deux panneaux d'administration différents, pour Etherpad en accédant à `domain.tld/admin` et pour MyPads par `domain.tld/mypads/?/admin`. Vous pouvez également trouver le fichier de configuration pour Etherpad à `/var/www/etherpad_mypads/settings.json`.

*Skin Builder* (accessible à cette adresse `domain.tld/pad/p/test#skinvariantsbuilder`) vous permet de personnaliser l'apparence de votre pad. Il vous donnera un paramètre à copier dans votre fichier de configuration `/var/www/etherpad_mypads/settings.json`.

## Fonctionnalités spécifiques à YunoHost

#### Support multi-utilisateurs

 * L'authentification LDAP est-elle prise en charge (pour l'accès MyPads uniquement) ? **Oui**
 * L'application peut-elle être utilisée par plusieurs utilisateurs ? **Oui**

## Limitations

## Informations additionnelles

* Ce paquet installera les plugins suivants :

  * [ep_align](https://www.npmjs.com/package/ep_align) - *Ajoute Gauche/Centre/Droite/Justifier à des lignes de texte dans un pad*
  * [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Ajoute des noms d'auteurs*
  * [ep_comments_page](https://www.npmjs.com/package/ep_comments_page) - *Ajoute des commentaires sur la sidebar et le lie au texte.*
  * [ep_countable](https://www.npmjs.com/package/ep_countable) - *Ajoute l'afficher le nombre de paragraphes, de mots et de caractères*
  * [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Supprimer les pads qui n'ont jamais été édités*
  * [ep_font_color](https://www.npmjs.com/package/ep_font_color) - *Appliquer les couleurs aux polices de caractères*
  * [ep_font_size](https://www.npmjs.com/package/ep_font_size) - *Permet de définir la taille de la police*.
  * [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Ajoute le support de titre à Etherpad Lite.*
  * [ep_markdown](https://www.npmjs.com/package/ep_markdown) - *Modifier et exporter en tant que Markdown dans Etherpad*
  * [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groupes et pads privés pour etherpad*
  * [ep_spellcheck](https://www.npmjs.com/package/ep_spellcheck) - *Ajouter le support pour faire de la vérification orthographique*
  * [ep_subscript_and_superscript](https://www.npmjs.com/package/ep_subscript_and_superscript) - *Ajouter la prise en charge de Subscript et Superscript*.
  * [ep_table_of_contents](https://www.npmjs.com/package/ep_table_of_contents) - *Voir une table des matières pour votre pad*

## Documentations et ressources

* Site officiel de l'app : http://etherpad.org
* Documentation officielle de l'admin : http://etherpad.org/doc/v1.8.15
* Dépôt de code officiel de l'app : https://github.com/ether/etherpad-lite
* Documentation YunoHost pour cette app : https://yunohost.org/app_etherpad_mypads
* Signaler un bug : https://github.com/YunoHost-Apps/etherpad_mypads_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
ou
sudo yunohost app upgrade etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps