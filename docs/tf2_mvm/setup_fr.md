# Guide d'installation pour Team Fortress 2 Mann vs Machine

## Logiciel requis

Un joueur a seulement besoin de Team Fortress 2. Le randomizer reste sur le
serveur.

L'hébergeur a besoin de :

- Docker avec le plugin compose.
- Environ 20 Go d'espace disque. Le serveur de jeu télécharge environ 14 Go au
  premier démarrage.
- Une machine capable d'héberger un serveur dédié Team Fortress 2 et un
  serveur Archipelago en même temps. Deux cœurs et 4 Go de mémoire suffisent
  pour six joueurs.

Le fichier compose de ce projet contient les autres parties : le serveur
Archipelago, le serveur dédié, le plugin SourceMod et le bridge.

## Configurez votre YAML

Les options se trouvent sous `Team Fortress 2 Mann vs Machine` :

- `mission_count` : combien de missions la partie utilise. Huit missions
  prennent environ une soirée.
- `difficulty_pool` : le palier le plus facile que la partie peut tirer. La
  partie tire aussi dans tous les paliers au-dessus. `normal` les autorise
  tous. `expert` n'autorise qu'Expert et Haunted.
- `goal` : `final_boss` ou `missionsanity`.
- `missionsanity_percentage` : quelle part de la partie Missionsanity demande.
- `mission_ticket_importance`, `class_unlock_importance`,
  `weapon_slot_importance` et `weapon_buff_importance` : choisissez
  indépendamment `useful` ou `progression`. Par défaut, les tickets, classes
  et emplacements sont requis pour la progression ; les améliorations sont
  utiles.
- `cash_rewards` : autorise l'argent dans les emplacements libres. Désactivé
  par défaut, afin que chaque emplacement libre donne une amélioration.
- `weapon_buff_percentage` : lorsque l'argent est activé, quelle part des
  emplacements libres devient une amélioration plutôt que de l'argent. La
  valeur par défaut est 75.
- `weapon_buff_stack_chance` : la fréquence à laquelle un niveau numérique
  supplémentaire d'une amélioration déjà tirée apparaît. Les effets activés ou
  désactivés ne se répètent jamais. La valeur par défaut est 25.
- `death_link` : désactivé par défaut. Ici une mort est une vague perdue :
  en perdre une tue tous les joueurs liés, et l'une de leurs morts anéantit
  votre équipe, ce qui fait perdre la vague.

## Rejoindre une partie

1. Copiez `deploy/.env.example` vers `.env`.
2. Réglez `SRCDS_RCONPW` et `SRCDS_HOSTNAME` dans `.env`.
3. Démarrez la stack avec `make up`.
4. Attendez. Le premier démarrage génère une seed puis l'héberge. Chaque
   démarrage suivant réutilise la seed dans `output/`.
5. Ouvrez la console Team Fortress 2 et connectez-vous à l'adresse du serveur.
6. Tapez `password <SRCDS_PW>` d'abord si l'hébergeur a mis un mot de passe.

Le serveur choisit la mission. Il n'y a ni vote de carte ni sélecteur de
mission : la partie décide de la mission que vous jouez.

## Où vit l'état

Le bridge garde la session Archipelago et l'ensemble des déblocages. Il écrit
les deux sur le disque, dans le volume compose.

L'état survit à un redémarrage du serveur, un changement de carte et un crash
au milieu d'une vague. Le bridge écrit chaque check sur le disque avant de
répondre au serveur de jeu. Il renvoie la check après une reconnexion.

La partie continue quand le serveur Archipelago est injoignable. Les checks
arrivent quand ce serveur revient.
