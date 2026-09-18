# Guide d'installation pour Team Fortress 2 Mann vs Machine

## Logiciels requis

Un joueur a besoin de Team Fortress 2 et de rien d'autre. Le randomizer reste
sur le serveur.

L'hébergeur a besoin de :

- `tf2ap.exe` sur Windows, ou `tf2ap-linux-amd64` sur Linux, depuis la
  [dernière version](https://github.com/m-this/tf2-archipelago/releases/latest).
  Docker marche aussi.
- Environ 20 Go d'espace disque. Le serveur télécharge environ 14 Go au
  premier démarrage.
- L'application Archipelago, pour générer la seed.

Le guide complet est le livre sur
[m-this.github.io/tf2-archipelago](https://m-this.github.io/tf2-archipelago/).

## Configurer votre YAML

Le lanceur écrit le YAML pour vous : **Settings**, puis **Player options**,
puis **Generate seed**. Pour l'écrire à la main, les options sont sous
`Team Fortress 2 Mann vs Machine` :

- `mission_count` : combien de missions la partie utilise. Huit font environ
  une soirée.
- `difficulty_pool` : le palier le plus facile où la partie pioche. La partie
  pioche aussi dans chaque palier au-dessus.
- `goal` : `final_boss` ou `missionsanity`.
- `missionsanity_percentage` : la part des missions que Missionsanity
  demande.
- `excluded_missions` : les missions que la partie ne pioche jamais.
- `start_mission` et `start_class` : où la partie commence. `random` par
  défaut.
- `class_weapon_slots` : `off`, `progressive` ou `any_order`. Chaque classe
  gagne ses propres emplacements.
- `mission_ticket_importance`, `class_unlock_importance`,
  `weapon_slot_importance`, `weapon_buff_importance` : `progression` ou
  `useful`. Les tickets, les classes et les emplacements sont en progression
  par défaut, les bonus en useful.
- `cash_rewards` : si les checks libres paient des crédits. Désactivé par
  défaut, donc chaque check libre paie un bonus d'arme.
- `weapon_buff_percentage` : avec les crédits activés, la part des checks
  libres qui paient un bonus. La valeur par défaut est 75.
- `weapon_buff_stack_chance` : la fréquence à laquelle un bonus ajoute un
  niveau à un bonus déjà dans la seed. La valeur par défaut est 25.
- `trap_percentage` : la part des checks libres qui contiennent un piège. La
  valeur par défaut est 1.
- `victory_caches`, `milestone_checks`, `giantsanity`, `tanksanity` : plus
  de checks. Désactivés par défaut.
- `death_link` : désactivé par défaut. Une vague perdue tue chaque joueur
  lié, et une de leurs morts efface votre équipe.

## Rejoindre une partie

1. Installez le serveur avec le lanceur. Appuyez sur **Start** et attendez le
   téléchargement.
2. Générez la seed, envoyez-la sur `archipelago.gg/uploads`, et créez une
   room.
3. Collez l'adresse de la room dans le lanceur et appuyez sur **Restart**.
4. Donnez à vos amis la ligne de connexion de la ligne **Join**. Ils la
   tapent dans la console de Team Fortress 2, après
   `password <le mot de passe du serveur>` si vous en avez mis un.

Le serveur choisit la mission. Il n'y a pas de vote de carte : la partie
décide quelle mission vous jouez.

## Où vit l'état

Le bridge garde la session Archipelago et les déblocages, et écrit les deux
sur le disque. L'état survit à un redémarrage, à un changement de carte et à
un plantage en pleine vague. Le jeu continue quand la room est injoignable.
Les checks arrivent quand la room revient.
