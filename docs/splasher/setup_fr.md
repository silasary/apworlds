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

## Mise en place du patch

- Téléchargez la dernière version de [Splasher Archipelago](https://github.com/Frisk202020/SplasherArchipelago/releases/). Extrayez le contenu, et déplacez tout le contenu à l'intérieur de `plugins` dans le dossier `plugins` de `BepInEx`
- Déplacez `connection.yaml` et `Proxy.exe` à la racine de Splasher, puis modifiez `connexion.yaml` pour inscrire vos propres informations de connexion. En ce qui concerne le proxy, il est utile lorsque vous jouez sur un serveur distant, plus de détails [ci-dessous]().
- Lancez le jeu et sonnez la clochette de la secrétaire : cela doit initier une connexion au serveur et, si cela réussi, lancer le patch !
*Vous pouvez vous assurer de la bonne mise en place si vous ne pouvez désormais plus tirer d'eau / de peinture (si vous n'avez pas reçu les items d'Archipelago).

## Gestion de la session Archipelago

Lorsque le patch est activé, les sauvegardes sont désactivés afin d'éviter de corrompre votre sauvegarde originelle. Cela ne change en rien votre expérience, sauf si **la connection est perdue**. Si cela se produit :
- vous le saurez au moment de votre prochain check : le jeu sera figé le temps de tenter quelques reconnexions automatiques (une dizaine de secondes)
- si le jeu ne parvient pas à se reconnecter, vous pouvez continuer votre partie **tant que vous ne fermez pas le jeu** (sinon, la progression depuis la déconnexion sera perdue). Vous pourrez vous reconnecter manuellement en sonnant à nouveau la clochette lors de votre prochaine visite à l’accueil.

## Lancer une partie

### Jouer sur archipelago.gg

Pour jouer sur *archipelago.gg* (ou la plupart des serveurs sur internet), vous devrez activer l'option `proxy` (changer la valeur *false* en *true*) dans votre `connexion.yaml`. Cela active le client à utiliser (automatiquement) `Proxy.exe` (fournit dans un client v0.0.3 ou plus) lors de la connexion à Archipelago. Ne pas activer cette passerelle empêche le jeu de lancer une connexion sécurisée vers Archipelago, ce qui résultera en un `connexion timeout`. Des explications plus avancées sur le but de ce proxy peuvent être lues [ici](https://github.com/Frisk202020/SplasherArchipelago/blob/tls-compatibility/Proxy/README.md).

> L'implémentation du proxy n'est pour le moment stable que sur Windows. Les futures versions apporteront de la compatibilité multi-plateforme.

### Hébergement local

Pour héberger cet Archipelago, installez le [apworld](https://github.com/Frisk202020/Archipelago/releases/) (double-cliquez simplement, ou installez via le client Archipelago).

## Retours

Ce monde étant en développement précoce, des retours sur votre expérience seraient appréciés (surtout si vous rencontrez des problèmes) ! Vous pouvez me contacter :
- de préférence par Discord : @frisk2892
- par mail : clementhemesecond@gmail.com