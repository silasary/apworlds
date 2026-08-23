# Guide de configuration Multimonde pour Grunn

## Logiciels nécessaires

- **Grunn** (Sokpop Collective) sur Steam.
- **BepInEx 5** (x64) - <https://github.com/BepInEx/BepInEx/releases>.
  Prenez une version `BepInEx_x64_5.4.x`, et **non** BepInEx 6.
- Le **mod client Grunnchipelago** (`Grunnchipelago.Client.dll` et ses dépendances).
- L'**apworld Grunn** (`grunn.apworld`), utile uniquement à la personne qui génère la seed.

## Installer BepInEx

1. Localisez le dossier du jeu : dans Steam, clic droit sur **Grunn** → *Gérer* →
   *Parcourir les fichiers locaux*. Vous devez arriver sur un dossier contenant `Grunn.exe`.
2. Décompressez l'archive BepInEx **dans ce dossier**, de sorte que `BepInEx/` se retrouve à
   côté de `Grunn.exe`.
3. Lancez le jeu une fois, puis fermez-le. BepInEx crée ses dossiers à ce premier
   démarrage : `BepInEx/plugins/` doit maintenant exister.

Si `BepInEx/plugins/` n'a pas été créé, c'est que BepInEx ne s'est pas chargé : vérifiez que
vous avez bien décompressé dans le dossier contenant `Grunn.exe`, et que vous avez pris la
version **x64**.

## Installer le mod

1. Créez le dossier `BepInEx/plugins/Grunnchipelago/`.
2. Placez-y `Grunnchipelago.Client.dll` ainsi que les DLL fournies avec.
3. Lancez le jeu une fois, puis fermez-le : le mod écrit son fichier de configuration dans
   `BepInEx/config/grunnchipelago.client.cfg`.

## Se connecter à un multimonde

Lancez le jeu. Sur l'**écran titre**, un petit panneau **ARCHIPELAGO** se trouve à droite,
juste au-dessus du numéro de version. Le curseur de la souris y est libéré - sur l'écran titre
uniquement - pour pouvoir cliquer dans le panneau ; en jeu, Grunn reste intégralement au
clavier, rien n'est changé.

| Touche | Effet |
|---|---|
| **Tab** | champ suivant (**Maj+Tab** : précédent) |
| **Haut / Bas** | passer d'un champ à l'autre |
| **Entrée** | champ suivant, et **connexion** depuis le dernier |
| **Échap** | rendre le focus clavier au menu |

Les champs à remplir :

- **Host** - `archipelago.gg`, ou `localhost` pour un serveur local
- **Port** - le port indiqué par la room
- **Slot Name** - doit correspondre exactement au champ `name:` de votre YAML
- **Password** - laissez vide si la room n'en a pas

Tant qu'un champ détient le clavier, les commandes du menu sont mises en sommeil : vous pouvez
taper un slot contenant un « E » sans déclencher la validation du menu.

Il n'y a qu'un bouton, **Connect**. L'actionner alors que vous êtes déjà connecté quitte
simplement la room courante pour rejoindre la nouvelle : changer de multimonde revient donc à
modifier les champs et à recliquer. En cas d'échec, le panneau le dit - avec le motif renvoyé
par le serveur quand il en donne un, sinon au bout d'une dizaine de secondes.

Le panneau retient ce que vous saisissez : au lancement suivant, la connexion se refait toute
seule. Le titre du menu principal affiche **GRUNNCHIPELAGO** quand le mod est actif. Les
checks partent au fur et à mesure et les objets reçus arrivent dans votre inventaire.

Connectez-vous **depuis l'écran titre, avant de charger une partie** : c'est à ce moment que
le mod choisit la sauvegarde correspondant au multimonde rejoint (voir *Sauvegardes*).

Si vous préférez, les mêmes réglages se trouvent dans
`BepInEx/config/grunnchipelago.client.cfg`, section `[Connection]` ; le panneau ne fait que
lire et écrire ce fichier.

`Enabled = false` désactive tout et vous rend le jeu vanilla - aucun patch n'est appliqué
dans cet état.

## La console en jeu

Appuyez sur **F1** en jeu pour prendre la main sur la console Archipelago, en bas à droite.
Elle affiche tout ce que dit le serveur - objets trouvés, indices, discussion, résultats de
commandes - et reste très discrète tant qu'elle n'a pas le focus.

| Touche | Effet |
|---|---|
| **F1** | prendre / rendre le focus |
| **Entrée** | envoyer la ligne |
| **Page préc. / Page suiv.** | faire défiler l'historique |
| **Origine / Fin** | aller tout en haut / tout en bas |
| **Molette** | faire défiler l'historique |

Une fois le focus pris, la console capte le clavier et la molette : tapez une commande serveur
(`!hint`, `!missing`, …) ou un message. Votre personnage ne se déplace pas et vos outils ne
défilent pas pendant que vous écrivez. Échap est laissé au jeu, qui ouvre son menu pause.

La vue ne suit le dernier message que si vous y êtes déjà : un message qui arrive ne vous
arrache pas l'historique en pleine lecture.

## Options utiles

- **QoL** : `SkipEndingDialogues` (actif par défaut) permet de terminer d'un coup le
  dialogue de l'orbe après une mort, avec Échap. Rien d'autre n'est passé.
  `StatsShowAllLines` affiche systématiquement toutes les lignes du panneau de stats
  (Tab/Pause).
- **Journalisation** : `VerboseLogs` enregistre chaque check, octroi et piège. Le mod tient
  aussi un journal horodaté persistant dans
  `BepInEx/plugins/Grunnchipelago/grunnchipelago_session.log` - c'est ce fichier qu'il faut
  joindre en cas de problème.

## Sauvegardes

Le mod tient un **profil de sauvegarde dédié par multimonde**, nommé d'après la seed et votre
slot :

- **Non connecté** - vous jouez sur votre sauvegarde normale, vanilla. Jamais touchée.
- **Connecté** - le jeu bascule sur le profil de cette seed et de ce slot. Deux multimondes
  différents ne partagent jamais leur progression, et rejoindre la même room reprend son
  profil là où vous l'aviez laissé.

La bascule n'a lieu que **sur l'écran titre, avant tout chargement de monde** - d'où l'intérêt
de se connecter là plutôt qu'en cours de partie. Se connecter alors qu'une partie est déjà
lancée laisse la sauvegarde courante intacte jusqu'au retour au menu.

Vous pouvez passer d'un multimonde à l'autre sans relancer le jeu : revenez à l'écran titre,
pointez le panneau sur l'autre room et connectez-vous. Le monde est remis à neuf pour la
sauvegarde rejointe, rien ne subsiste du multimonde précédent.

Une fois basculée, la session reste sur ce profil même après une déconnexion. Pour retrouver
votre sauvegarde vanilla, relancez le jeu sans vous connecter.

## Générer une seed

Seule la personne qui génère a besoin de l'apworld.

1. Placez `grunn.apworld` dans le dossier `custom_worlds/` de votre installation
   Archipelago.
2. Récupérez le YAML modèle (`Players/Templates/Grunn.yaml`, ou générez les modèles depuis
   le Launcher Archipelago) et modifiez-le selon vos envies.
3. Placez votre YAML dans `Players/` et lancez **Generate**, ou déposez-le sur
   <https://archipelago.gg/uploads>.

## En cas de problème

**Le jeu démarre mais rien ne se connecte.** Vérifiez que `Slot` correspond exactement au
champ `name:` de votre YAML, majuscules comprises. Consultez ensuite le journal de session :
les erreurs de connexion y sont écrites en entier.

**Un objet ramassé ne donne rien.** C'est normal pour un check déjà envoyé : l'objet
réapparaît mais reste inerte. Le journal indique `Silencieux : … (deja envoye)`.

**Un objet n'est jamais apparu dans le monde.** Trois objets ne sont volontairement jamais
injectés dans votre inventaire - l'Os, la Boussole et la Clé étrange. Les posséder tuerait
une fin (respectivement Chien, Labyrinthe et Long Couloir). Ils apparaissent à la place sous
forme de ramassage près du panneau des roses, au point de départ, et vous ne les prenez que
lorsque vous en avez réellement besoin.
