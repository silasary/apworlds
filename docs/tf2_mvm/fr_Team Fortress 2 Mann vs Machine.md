# Team Fortress 2 Mann vs Machine

## Que fait la randomisation à ce jeu ?

Mann vs Machine est le mode coopératif de Team Fortress 2. Six joueurs
défendent une trappe contre des vagues de robots. Entre les vagues, les
joueurs achètent des améliorations.

Une partie utilise une partie des missions. Chaque vague que l'équipe réussit
est un check. Chaque mission que l'équipe réussit est un check. Le premier
tank et le premier géant de chaque mission sont aussi des checks.

Vous ne commencez pas avec le jeu complet :

- Les neuf classes sont des objets.
- Les trois emplacements d'arme sont des objets. Un emplacement verrouillé
  est vide.
- Le ticket qui ouvre une mission est un objet.
- Les bonus d'arme, les paquets de crédits et les pièges remplissent le reste.

Chaque palier de difficulté demande plus de classes et d'emplacements que le
palier en dessous.

## Quel est l'objectif ?

La seed fixe un des deux objectifs :

- **Final Boss** : la partie marque la mission la plus dure qu'elle a
  piochée. Réussissez-la pour gagner.
- **Missionsanity** : réussissez une part des missions, dans n'importe quel
  ordre.

`medal_on_clear` met une Australium Medal sur chaque mission réussie.
L'objectif compte alors les médailles que vous avez, donc un `!collect` d'un
autre joueur ne peut pas terminer votre partie à votre place.

## Quels objets peuvent être dans le monde d'un autre joueur ?

Tous : les tickets de mission, les classes, les emplacements d'arme, les bonus
d'arme, les paquets de crédits et les pièges. Seules les Australium Medals
restent dans votre propre monde.

Un piège a un mauvais effet. `trap_percentage` décide combien la partie en
contient, un pour cent par défaut. Le seul piège pour l'instant couvre toute
l'équipe de Jarate pendant dix secondes. Un piège qui arrive entre deux
vagues attend la suivante.

## À quoi ressemble l'objet d'un autre monde dans Mann vs Machine ?

Le serveur écrit l'objet dans le chat. Il n'a pas de modèle, et le plugin
n'arrête jamais une vague pour en montrer un.

## Dois-je installer quelque chose ?

Non. Le randomizer reste sur le serveur. Connectez-vous avec un client Team
Fortress 2 normal.

L'hébergeur installe le serveur. Lisez le guide d'installation.

## Un slot pour tout le serveur

Un seul slot Archipelago couvre tout le serveur. Tout le monde dessus partage
les mêmes classes, emplacements et missions.

Valve calibre Mann vs Machine pour une équipe de six. Avec un slot par joueur,
un joueur n'a pas d'arme primaire et un autre n'a pas d'arme de mêlée.
