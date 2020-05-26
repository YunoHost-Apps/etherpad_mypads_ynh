# Etherpad avec plugin mypads pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/etherpad_mypads.svg)](https://dash.yunohost.org/appci/app/etherpad_mypads) ![](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.status.svg) [![](https://ci-apps.yunohost.org/ci/badges/etherpad_mypads.maintain.svg)](https://github.com/YunoHost/Apps/#what-to-do-if-i-cant-maintain-my-app-anymore-)  
[![Installer Etherpad avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=etherpad_mypads)

*[Read this readme in english.](./README.md)*

> *Ce package vous permet d'installer etherpad rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, merci de regarder [ici](https://yunohost.org/#/install_fr) pour savoir comment l'installer et en profiter.*

## Résumé
Etherpad est un éditeur en ligne Open Source hautement personnalisable qui permet l'édition collaborative en temps réel.  
Ce paquet installera les mêmes plugins que [Framapad](https://framapad.org/).

**Version embarquée:** 1.8.4

## Captures d'écran

![](http://etherpad.org/img/screenshot.png)

## Démo

* [Démo officielle](https://oasis.sandstorm.io/appdemo/h37dm17aa89yrd8zuqpdn36p6zntumtv08fjpu8a8zrte7q1cn60)

## Configuration

Vous pouvez accéder à 2 panneaux d'administration différents, pour etherpad en accédant à `domain.tld/admin` et pour mypads par `domain.tld/mypads/?/admin`.  
Ou, vous pouvez trouver un fichier de configuration pour etherpad à `/var/www/etherpad_mypads/settings.json`.

## Documentation

 * Documentation officielle: http://etherpad.org/doc/v1.7.0
 * Documentation YunoHost: Il n'y a pas d'autre documentation, n'hésitez pas à contribuer.

## Fonctionnalités spécifiques à YunoHost

#### Support multi-utilisateurs

Supportée, avec LDAP.

#### Architectures supportées.

* x86-64b - [![](https://ci-apps.yunohost.org/ci/logs/etherpad_mypads%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/etherpad_mypads/)
* ARMv8-A - [![](https://ci-apps-arm.yunohost.org/ci/logs/etherpad_mypads%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/etherpad_mypads/)
* Buster x86-64b - [![](https://ci-buster.nohost.me/ci/logs/etherpad_mypads%20%28Apps%29.svg)](https://ci-buster.nohost.me/ci/apps/etherpad_mypads/)

## Limitations

## Informations additionnelles

* Ce paquet installera les plugins suivants:

  * [ep_align](https://www.npmjs.com/package/ep_align) - *Ajoute Gauche/Centre/Droite/Justifier à des lignes de texte dans un pad*
  * [ep_author_hover](https://www.npmjs.com/package/ep_author_hover) - *Ajoute des noms d'auteurs*
  * [ep_automatic_logut](https://www.npmjs.com/package/ep_automatic_logut) - *Déconnecte automatiquement l'utilisateur après une certaine période de temps (Prévient la surcharge du serveur)*
  * [ep_comments_page](https://www.npmjs.com/package/ep_comments_page) - *Ajoute des commentaires sur la sidebar et le lie au texte.*
  * [ep_countable](https://www.npmjs.com/package/ep_countable) - *Affiche les paragraphes, phrases, mots et nombres de caractères.*
  * [ep_delete_empty_pads](https://www.npmjs.com/package/ep_delete_empty_pads) - *Supprimer les pads qui n'ont jamais été édités*
  * [ep_font_color](https://www.npmjs.com/package/ep_font_color) - *Appliquer les couleurs aux polices de caractères*
  * [ep_headings2](https://www.npmjs.com/package/ep_headings2) - *Ajoute le support de titre à Etherpad Lite.*
  * [ep_markdown](https://www.npmjs.com/package/ep_markdown) - *Modifier et exporter en tant que Markdown dans Etherpad*
  * [ep_mypads](https://www.npmjs.com/package/ep_mypads) - *Groupes et pads privés pour etherpad*
  * [ep_page_view](https://www.npmjs.com/package/ep_page_view) - *Ajouter la prise en charge de 'page view', avec une option d'activation/désactivation dans Paramètres, ainsi que 'Page Breaks' avec Control + Entrée*
  * [ep_spellcheck](https://www.npmjs.com/package/ep_spellcheck) - *Ajouter le support pour faire de la vérification orthographique*
  * [ep_subscript_and_superscript](https://www.npmjs.com/package/ep_subscript_and_superscript) - *Ajouter la prise en charge de Subscript et Superscript*.
  * [ep_table_of_contents](https://www.npmjs.com/package/ep_table_of_contents) - *Voir une table des matières pour votre pad*
  * [ep_user_font_size](https://www.npmjs.com/package/ep_user_font_size)- *Permet de définir taille de la police dans les paramètres, cela n'affecte pas les vues des autres personnes*.

## Liens

 * Reporter un bug: https://github.com/YunoHost-Apps/etherpad_mypads_ynh/issues
 * Site de etherpad: http://etherpad.org/
 * Site du plugin mypads: https://git.framasoft.org/framasoft/ep_mypads
 * Dépôt git de l'app: https://github.com/ether/etherpad-lite
 * Site de YunoHost: https://yunohost.org/

---

Informations à l'intention des développeurs
----------------

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing).

Pour tester la branche testing, merci de procéder ainsi.
```
sudo yunohost app install https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
ou
sudo yunohost app upgrade etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh/tree/testing --debug
```
