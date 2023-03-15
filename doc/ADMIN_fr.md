## Configuration

Vous pouvez accéder à deux panneaux d'administration différents, pour Etherpad en accédant à `__DOMAIN____PATH__/admin` et pour MyPads par `domain.tld/mypads/?/admin`. Vous pouvez également trouver le fichier de configuration pour Etherpad à `__INSTALL_DIR__/settings.json`.

*Skin Builder* (accessible à cette adresse `https://__DOMAIN____PATH__/pad/p/test#skinvariantsbuilder`) vous permet de personnaliser l'apparence de votre pad. Il vous donnera un paramètre à copier dans votre fichier de configuration `__INSTALL_DIR__/settings.json`.

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
