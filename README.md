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
