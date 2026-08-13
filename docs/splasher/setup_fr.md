# Guide d'installation pour Splasher

## Logiciels requis

- Une copie légale de Splasher
- `BepInEx`, installée pour Splasher. Celle-ci est expliquée ici
- Un client Archipelago (0.6.7 ou plus)
- [Splasher Archipelago](https://github.com/Frisk202020/SplasherArchipelago/releases/)

*L'implémentation n'a actuellement été testée que sur Windows (11), même si il ne devrait pas y avoir de problème puisque `BepInEx` est multi-plateforme. De plus, puisque ce jeu n'est publié que sur Steam (et sur console), nous assumerons ici que le jeu est installé via Steam*.

## Étapes d'installation

- Tout d'abord, téléchargez `BepInEx` [dernière version (v.5.4.23)](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.5) (winx64 pour windows). Il permet de charger des mods, dont en l'occurrence `Splasher Archipelago`.
- Extrayez le contenu obtenu dans le dossier racine de Splasher (par défaut : `C:\Program Files (x86)\Steam\steamapps\common\Splasher`)
- Lancez le jeu une première fois : cela initialisera `BepInEx`, en particulier, un dossier `plugins` devrait être créé dans `BepInEx`

### Mise en place du patch

- Téléchargez la dernière version de [Splasher Archipelago](https://github.com/Frisk202020/SplasherArchipelago/releases/). Extrayez le contenu, et déplacez tout le contenu à l'intérieur de `plugins` dans le dossier `plugins` de `BepInEx`
- Déplacez `connection.yaml` et `Proxy.exe` à la racine de Splasher, puis modifiez `connexion.yaml` pour inscrire vos propres informations de connexion. En ce qui concerne le proxy, il est utile lorsque vous jouez sur un serveur distant, plus de détails [ci-dessous]().
- Lancez le jeu et sonnez la clochette de la secrétaire : cela doit initier une connexion au serveur et, si cela réussi, lancer le patch !
*.

### Mise en place additionnelle

Archipelago modifie certains sprites et textes, qu'il est nécessaire d'installer. Tout est inclut dans l'archive du client, il faut juste placer les fichiers au bon endroit :

- Déplacez tout le contenu du dossier `assets` dans `\BepInEx\assets` (créez un dossier si nécessaire)
- Déplacez tout le contenu du dossier `languages` dans `<Splasher>\Splasher_Data\StreamingAssets\Languages`

Enfin, vous pouvez vous lancer le jeu et sonner la cloche de la Secrétaire pour vous connecter à Archipelago et lancer le mod. Vous pouvez vous assurer que tout c'est bien passé en sonnant la cloche de nouveau, la Secrétaire vous confirmera qu'Archipelago est lancé.

## Gestion de la session Archipelago

- Même si le jeu de base ne dispose pas de plusieurs sauvegardes, Archipelago utilisera de nouveaux fichiers dès son activation. Vos sauvegardes vanilla n'ont rien à craindre, de plus vous ne recevrez pas de succès Steam et ne n'enverrez pas vos records en Contre-la-montre tant qu'Archipelago est actif.
- Dès qu'une session Archipelago est établie avec succès, vous n'avez plus à gérer la connexion avec le server. En particulier les reconnections sont gérées automatiquement.

## Lancer une partie

### Jouer sur archipelago.gg

Pour jouer sur *archipelago.gg* (ou la plupart des serveurs sur internet), vous devrez activer l'option `proxy` (changer la valeur *false* en *true*) dans votre `connexion.yaml`. Cela active le client à utiliser (automatiquement) `Proxy.exe` (fournit dans un client v0.0.3 ou plus) lors de la connexion à Archipelago. Ne pas activer cette passerelle empêche le jeu de lancer une connexion sécurisée vers Archipelago, ce qui résultera en un `connexion timeout`. Des explications plus avancées sur le but de ce proxy peuvent être lues [ici](https://github.com/Frisk202020/SplasherArchipelago/blob/tls-compatibility/Proxy/README.md).

> L'implémentation du proxy est multi-plateforme. Si vous rencontrez un problème, n'hésitez pas à le [signaler](./feedback_fr.md) !

### Hébergement local

Pour héberger cet Archipelago, installez le [apworld](https://github.com/Frisk202020/Archipelago/releases/) (double-cliquez simplement, ou installez via le client Archipelago).

### Outils externes

Ce jeu n'implémente pas pour le moment des messages en-jeu d'Archipelago. Pour cette raison je recommande l'utilisation d'outils pour guider votre partie.

- Pour le tracker, le [PopTracker](https://github.com/Ung-W/Splasher-AP-Poptracker/releases/) d'*Evoker* est la meilleure option. Ce monde n'est pas tout à fait compatible avec le tracker universel (des problèmes ont été observés, notamment concernant les pouvoirs progressifs).
- Pour le client, vous pouvez partir sur le client natif mais je recommanderais personnellement ce [client web](https://drawesome4333.github.io/ap-tracker/).

## Retours

Ce monde étant en développement précoce, des retours sur votre expérience seraient appréciés (surtout si vous rencontrez des problèmes) ! Vous pouvez me contacter :
- de préférence par Discord : @frisk2892
- par mail : clementhemesecond@gmail.com

Lorsque vous devez signaler un problème, merci de suivre les [instructions de signalement](./feedback_fr.md).