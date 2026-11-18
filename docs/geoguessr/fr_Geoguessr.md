# Geoguessr

## Où est la page d'options

Pour le moment, la meilleure manière de configurer ses options de jeu est de télécharger l'extension (voir [guide de setup](./setup_fr.md)) et utiliser le Générateur YAML (disponible en bas de l'écran principal de l'extension).

## Que fait la randomisation dans ce jeu ?

Au moment de la génération de la partie, un certain nombre de pays sont tirés aléatoirement parmi les zones couvertes par Geoguessr.
Chaque pays est déblocable derrière sa région Continent: débloquer la map Continent associée permettra à toutes les maps Pays contenues et débloquées d'être jouables.

Les locations sont collectées en récupérant des médailles sur toutes ces maps. Il y a 4 médailles : Bronze, Argent, Or, Platine. Il y a aussi une location pour le premier 5k effectué sur chaque map.

Chaque map aura possiblement des seuils d'atteinte de médailles différents, pour l'équilibrage.

## Quel est l'objectif dans Geoguessr en mode randomisé

L'objectif peut être un des suivants, en fonction du choix du joueur :
- Obtenir un certain nombre de médailles
- Obtenir un certain nombre de médailles de platine

## Quels items peuvent être dans le jeu d'un autre joueur ?

Tous les items sont randomisés à travers tous les jeux. Ces items peuvent être chacune des maps (pays ou continent), ou des modes de jeux pour chaque map.

Par exemple, des items déblocables sont `Europe`, `Monaco`, `Move (Europe)`, `Pan (Monaco)`, etc.

## A quoi ressemble un item d'un autre jeu dans Geoguessr ?

Il n'y a pas de logo particulier pour les items dans Geoguessr. Récupérer les locations (visibles sur l'onglet de jeu) collectera les différents items.

Récupérer une location jouera un son *ding*.

## Que se passe-t-il quand un joueur reçoit un item ?

Quand un joueur reçoit un item, un son *pop* sera joué chez lui. La map ou le mode de jeu débloqué lui sera directement accessible **en commençant une nouvelle seed**.

On recommande d'utiliser l'historique des messages de la partie, en dessous des informations de connexion, pour suivre quel item a été envoyé à qui.
