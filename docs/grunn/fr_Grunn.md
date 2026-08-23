# Grunn

## Qu'est-ce que ce jeu ?

Grunn (Sokpop Collective, 2024) est une aventure de jardinage à la première personne, inquiétante,
enfermée dans une semaine qui recommence sans cesse. Vous entretenez un jardin, mettez au jour un
village plein de secrets dérangeants, et tentez d'atteindre l'une de ses 11 fins.

## Que change la randomisation ?

Les objets-clés - outils, clés, idoles, instruments, fragments d'âme et tout le reste - sont
mélangés dans le multimonde. Au lieu de les trouver à leur emplacement d'origine, chaque obtention
envoie un check, et vos propres objets vous arrivent du multimonde.

Beaucoup d'autres choses deviennent des checks, la plupart actives par défaut : les 32 polaroïds
disséminés dans le monde, les 7 fantômes que l'on peut apaiser, 7 bonnes actions (rendre la main
coupée, remettre la médaille à l'escargot, reconstituer la fanfare de l'école…), 6 tâches
d'entretien, les fins que vous atteignez, et - si vous activez `coinsanity` - les 15 pièces posées
dans le monde.

Les objets et la progression traversent les cycles : quand la semaine recommence, tout ce que le
multimonde vous a donné vous est automatiquement restitué.

## Quel est l'objectif ?

Défini par l'option `goal` :

- **good_ending** - vaincre le Démon final avec l'Épée magique et la Pierre purifiée, puis sortir
  par le portail principal.
- **true_ending** (défaut) - la bonne fin, après avoir restauré l'âme du propriétaire à l'aide des
  3 fragments d'âme.
- **all_endings** - voir les 11 fins (celle de la démo est exclue).

## Bonus et pièges

En plus des objets du jeu, le pool contient des choses que Grunn n'a jamais eues.

Les **bonus** sont progressifs : chaque exemplaire se cumule aux précédents, et ils sont
réappliqués automatiquement après une remise à zéro de cycle ou une reconnexion. `buff_count`
détermine combien d'exemplaires de chacun entrent dans le pool.

| Bonus | Effet par exemplaire |
|---|---|
| Move Speed Boost | +15 % de vitesse de déplacement |
| Cutter Range Boost | +25 % de portée du sécateur |
| Cutting Rate Boost | +25 % de vitesse de coupe |

Les **pièges** se divisent en deux familles. Les trois premiers sont temporaires : ils durent
**2 heures de jeu** et expirent aussi au changement de jour ou à la remise à zéro du cycle.

| Piège | Effet |
|---|---|
| Speed Trap | Réduit de moitié votre vitesse de déplacement |
| Size Trap | Vous rapetisse |
| Inverted Controls Trap | Inverse à la fois la caméra et les déplacements |

Les cinq autres ne frappent qu'une fois, mais leurs conséquences vous survivent :

| Piège | Effet |
|---|---|
| Garden Reset Trap | Remet le jardin de départ à 0 % - tout l'entretien est à refaire |
| Church Reset Trap | Idem, pour le terrain de l'église |
| Park Reset Trap | Idem, pour le parc |
| Night Trap | Propulse l'horloge à 03h00, en pleine fenêtre de la fin Darkness - être dehors à cette heure-là est une fin mortelle |
| Sacred Flower Trap | Coupe 4 fleurs sacrées à votre place. La cinquième déclenche la fin Sacred Flowers : vous voilà à une coupe d'inattention de la mort - ou mort sur le coup si vous en aviez déjà coupé une |

`trap_percentage` détermine la proportion de filler remplacée par des pièges.

## Options à connaître

La liste complète, avec toutes les descriptions, se trouve sur la page des options ; voici celles
qui pèsent le plus sur une partie.

**Actives par défaut**

- `exclude_bridge_key` - la Bridge Key reste à son emplacement d'origine. C'est *la* première clé
  du jeu : elle ouvre le passage du point de départ vers le jardin, et le bus bloque toutes les
  autres sorties. La mélanger réduit la sphère 1 à un unique check, ce qui est déconseillé en
  partie asynchrone.
- `lock_player_hut` - la cabane du joueur est verrouillée par l'Abandoned Key, un objet qui
  n'ouvre rien dans le jeu d'origine. Cela va bien au-delà de la cabane : le seul lit utilisable
  s'y trouve, donc la clé conditionne aussi le **sommeil**, et avec lui le jour 2 et les suivants.
  Elle devient un objet de progression précoce et très convoité - surtout en multimonde, où elle
  peut se trouver chez quelqu'un d'autre.
- `polaroid_checks`, `ghost_checks`, `chore_checks` - les polaroïds, les fantômes et les tâches
  d'entretien envoient des checks. Les cinq tâches du jardin rapportent normalement 2 pièces la
  première fois ; avec les checks activés, cet argent revient sous forme d'objets Golden Gulden
  mélangés dans le multimonde : l'économie reste inchangée.
- `exclude_bad_endings` - retire les checks des 8 fins qui vous tuent, pour ne jamais devoir
  mourir (et, sous DeathLink, tuer tous les autres) juste pour récupérer un check. Les fins
  restent atteignables, elles cessent simplement d'être des emplacements. Ignorée lorsque
  l'objectif est `all_endings`.

**Inactives par défaut**

- `keep_vanilla_shears` - laisse le sécateur dans la cabane du joueur pour un début plus doux.
  Attention : avec `lock_player_hut` activé, il reste malgré tout derrière l'Abandoned Key.
- `coinsanity` - les 15 pièces posées deviennent des checks, et acheter quelque chose suppose de
  recevoir des objets Gulden du multimonde au lieu de tondre l'herbe pour gagner de l'argent.
- `persistent_shortcuts` - les raccourcis de confort restent débloqués d'un cycle à l'autre. Aucun
  impact sur la logique.
- `mask_items` - chaque emplacement affiche un modèle Archipelago coloré selon la classe de son
  contenu (progression, utile, remplissage) au lieu de l'objet lui-même, y compris pour les objets
  de Grunn : vous savez ce que vaut un check, jamais ce qu'il contient. Les pièges empruntent l'un
  des trois modèles, toujours le même pour un emplacement donné, afin qu'un relancement ne les
  trahisse jamais. Purement cosmétique - rien ne bouge dans la logique, et le message de ramassage
  nomme toujours ce que vous avez réellement obtenu.
- `death_link` - chaque fin mortelle atteinte (tout sauf Bus, Picnic et la bonne fin / true
  ending) envoie un DeathLink. En recevoir un déclenche un jumpscare de cauchemar et remet votre
  semaine à zéro : aucune fin n'est déclenchée et aucun check n'est accordé, personne ne peut donc
  moissonner vos fins à votre place.

**Réglages**

- `buff_count` (défaut 3) - nombre d'exemplaires de chaque bonus progressif dans le pool.
- `trap_percentage` (défaut 20) - part du filler remplacée par des pièges.
