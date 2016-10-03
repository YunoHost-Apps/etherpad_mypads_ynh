Etherpad with mypads plugin for YunoHost
==================

[Yunohost project](https://yunohost.org/#/)

Éditeur de texte collaboratif en ligne avec gestion utilisateurs et groupes.  
Ce package etherpad utilise les mêmes plugins que [Framapad](https://framapad.org/).

http://etherpad.org/  
https://git.framasoft.org/framasoft/ep_mypads

Le script installe les paquets *npm* et *nodejs-legacy*, ainsi que *abiword* si l'option est selectionnée.

**En raison du plugin mypads, cette version d'etherpad doit être installée à la racine d'un domaine ou d'un sous-domaine dédié. Autrement, mypads sera inaccessible.**

**Mise à jour du package:**  
sudo yunohost app upgrade --verbose etherpad_mypads -u https://github.com/YunoHost-Apps/etherpad_mypads_ynh

**Multi-utilisateur:** Oui, sans support ldap.

Ce package etherpad intègre les plugins suivant:

- ep_align - *Add Left/Center/Right/Justify to lines of text in a pad*
- ep_author_hover - *Adds author names to span titles*
- ep_automatic_logut - *Automatically disconnects user after some period of time (Prevent server overload)*
- ep_comments_page - *Adds comments on sidebar and link it to the text.*
- ep_countable - *Displays paragraphs, sentences, words and characters counts.*
- ep_delete_empty_pads - *Delete pads which were never edited*
- ep_font_color - *Apply colors to fonts*
- ep_headings2 - *Adds heading support to Etherpad Lite.*
- ep_markdown - *Edit and Export as Markdown in Etherpad*
- ep_mypads - *Groups and private pads for etherpad*
- ep_page_view - *Add support to do 'page view', with a toggle on/off option in Settings, also Page Breaks with Control Enter*
- ep_spellcheck - *Add support to do 'Spell checking'*
- ep_subscript_and_superscript - *Add support for Subscript and Superscript*
- ep_table_of_contents - *View a table of contents for your pad*
- ep_user_font_size - *User Pad Contents font size can be set in settings, this does not effect other peoples views*
