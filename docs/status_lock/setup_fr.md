# Status Lock

## Installation
 - Mettre le package `status_lock.apworld` dans le répertoire `custom_worlds/` de votre installation Archipelago. Vous pouvez également l'exécuter avec Archipelago pour une installation automatique.


## Génération:
- Placer le yaml dans les dossiers des joueurs et générer comme vous le feriez pour n'importe quel autre monde.
- Confirmation du générateur: par défaut, le générateur vous demandera une confirmation avant de finaliser; vous pouvez désactiver cette option avec l'option de monde `Ignore Generation Confirmation` ou en exécutant sur un serveur sans interface.

## Jouer
- Utilisation du client: le client Status Lock fournit les commandes suivantes:
	- `/set_password` — Définir le mot de passe administrateur pour la connexion actuelle. Les mots de passe sont stockés de manière chiffrée et remplaceront les précédents pour les graines avec la même liste de joueurs.
	- `/load_keys` — Charger les mots de passe stockés (chiffrés) dans le client.
	- `/save` — Sauvegarder les mots de passe chiffrés actuels (et leurs suppressions) dans un stockage persistant.
	- `/tray` — Envoyer la fenêtre du client dans la zone de notification afin qu'il puisse s'exécuter en arrière-plan (dépendant du système d'exploitation).
	- `/copy_lines` — (Aide du client) Copier les lignes d'enregistrement du client pour les coller dans la console de l'hôte (utile lorsque le client ne transmet pas automatiquement ou que l'on ne souhaite pas mettre le mot de passe administrateur).
