# Mise en place de Geoguessr Archipelago

## Table des matières

- [Besoins](#besoins)
- [Mise en place](#mise-en-place)
    - [Pour les joueurs d'une session](#pour-les-joueurs-dune-session)
    - [Pour l'hôte seulement](#pour-lhôte-seulement)
        - [Installer le Launcher Archipelago](#installer-le-launcher-archipelago)
        - [Installer l'`.apworld` Geoguessr](#installer-lapworld-geoguessr)
        - [Rassembler les YAML des joueurs](#rassembler-les-yaml-des-joueurs)
        - [Générer la session Archipelago](#générer-la-session-archipelago)
        - [Héberger la session Archipelago](#héberger-la-session-archipelago)
    - [Générer un fichier YAML](#générer-un-fichier-yaml)
- [Un problème ?](#un-problème)
    - [La génération du multi-monde ne fonctionne pas](#la-génération-du-multi-monde-ne-fonctionne-pas)
    - [J'ai été déconnecté en jouant et ma game n'a pas été validée](#jai-été-déconnecté-en-jouant-et-ma-game-na-pas-été-validée)
    - [Au bout d'un temps la connexion au serveur ne fonctionne plus](#au-bout-dun-temps-la-connexion-au-serveur-ne-fonctionne-plus)

# Besoins

Pour jouer à une session Archipelago sur Geoguessr, un compte **Geoguessr Pro** est nécessaire (pour générer des games solo).

Il est possible de soumettre des challenges à la main pour récupérer les scores d'un compte gratuit, mais cela est pénible et l'accès à un compte Pro via un tiers sera nécessaire dans tous les cas.

# Mise en place

Voici les étapes d'installation pour les joueurs. Pour l'hôte (la personne qui créera la partie), les étapes spéciales sont disponibles [ici](#pour-lhôte-seulement)

## Pour les joueurs d'une session

Seules **deux étapes** sont nécessaires si vous n'hébergez pas la partie :
- D'abord, installez l'**extension de jeu** en utilisant un des liens suivants, en fonction de votre navigateur internet :
    - Firefox : https://addons.mozilla.org/firefox/addon/geoguessr-archipelago-client/
    - Chrome (et dérivés) : https://chromewebstore.google.com/detail/geoguessr-archipelago-cli/hemokppgpfdnfbjkjgifogekkbphkhgg

- Ensuite, vous devrez générer votre **fichier de configuration** (ou **fichier YAML**) qui permettra de choisir vos paramètres personnes pour la partie.
Voir [ici](#generer-un-fichier-yaml) pour les instructions. Envoyez ce fichier à l'hôte de la partie, pour qu'iel crée la partie multi-jeux.

Une fois installée, cliquez sur l'**icône de l'extension** pour ouvrir l'onglet de jeu *Geoguessr Archipelago*.

Cet onglet sera votre quartier général pour jouer à une session Archipelago sur Geoguessr.

Nous vous conseillons d'**épingler** cette icône d'extension sur votre barres d'outils.

Vous pouvez ensuite lire la section **`Comment jouer`** en bas de l'onglet, pour découvrir les bases du fonctionnement et les explications concernant cet onglet, **surtout** si vous n'êtes pas familiers avec les randomizers ou Archipelago.

## Pour l'hôte seulement

### Installer le Launcher Archipelago

Allez sur https://github.com/ArchipelagoMW/Archipelago/releases/latest et téléchargez les fichiers d'installations pour votre système d'exploitation (.exe pour Windows) **en bas de la page**.

Lancez le programme d'installation pour installer le Launcher Archipelago.

### Installer l'`.apworld` Geoguessr

Allez sur https://github.com/remigranotier/geoguessr-archipelago/releases/latest et téléchargez le fichier `.apworld` de notre dernière release.

Une fois téléchargé, double-cliquez dessus pour l'installer. Cela peut prendre jusqu'à une minute.

### Rassembler les YAML des joueurs

Archipelago a besoin d'**un fichier YAML par joueur**. Il correspond à la configuration qu'Archipelago utilisera pour générer une partie jouable en fonction des paramètres des différents participants. Pour générer un fichier YAML, voir [ici](#générer-un-fichier-yaml).

### Générer la session Archipelago

1. Ouvrez le Launcher Archipelago (sur Windows, dans le menu Démarrer).
2. Recherchez `Browse Files` et cliquez sur `Open`. Cela ouvrira un Explorateur de Fichiers dans votre dossier Archipelago.
3. Ouvrez le dossier `Players` .
4. Déplacez tous les fichiers YAML des joueurs dans ce dossier.
5. Retournez sur le Launcher Archipelago, recherchez `Generate` et cliquez sur `Open`.

Si tout s'est bien passé, retournez dans votre dossier Archipelago, allez dans le dossier `output` : vous devriez voir un nouveau fichier `.zip`. C'est ce fichier qui servira à la création de la partie : il contient toute la logique cachée de votre session.

### Héberger la session Archipelago

Une fois votre fichier `.zip` prêt, allez sur [le site officiel d'Archipelago](https://archipelago.gg/).

1. Cliquez sur `Start Playing` sur la page d'accueil.
2. Cliquez sur le lien en bas `host a pre-generated game for you`.
3. Uploadez votre fichier `.zip`.
4. Cliquez sur `Create new room`. 

Sur cet onglet, vous devriez voir (peut-être après rafraichissements) un lien vers votre session Archipelago (quelque chose comme `archipelago.gg:33333`). Utilisez ce lien dans votre extension `Geoguessr Archipelago` pour vous connecter à cette session.

## Générer un fichier YAML

Archipelago décrit le fonctionnement des fichiers YAML [ici](https://archipelago.gg/tutorial/Archipelago/advanced_settings_en).

Vous avez plusieurs options pour la génération :
- **(recommandé)** Utiliser notre Générateur YAML en cliquant sur **Générer un YAML** en bas de l'onglet de l'extension.
- (nécessite le [Launcher Archipelago](#installer-le-launcher-archipelago)) Utiliser la fonction "Options Creator" du Launcher Archipelago. Sélectionnez Geoguessr et faites un tour des options pour choisir ce que vous préférez.
- (nécessite le [Launcher Archipelago](#installer-le-launcher-archipelago)) Générer le template de base en utilisant la fonction "Generate Template Options" du Launcher Archipelago. Vous pouvez modifier ce template avec au moins votre "Slot name". (le "Slot name" est le nom de l'emplacement que vous utiliserez en vous connectant au serveur Archipelago : en gros, c'est votre nom de joueur).

Nous avons essayé de préparer des paramètres par défaut aussi équilibrés que possible, mais des modifications peuvent être faites de votre côté en fonction de votre niveau de jeu et de vos sessions passées sur Archipelago précédemment.

Vous pourrez également trouver des préconfigurations d'options pour mettre en place différents types de session rapidement. Ces préconfigurations sont disponibles plus clairement sur le Générateur YAML de l'extension.

## Un problème ?

### La génération du multi-monde ne fonctionne pas

Assurez-vous de bien lire le message d'erreur envoyé lorsque vous cliquez sur l'option "Generate" dans le Launcher Archipelago. Il est probable que vos paramètres soient contradictoires ou trop restrictifs pour permettre une génération réussie.

### J'ai été déconnecté en jouant et ma game n'a pas été validée

Si votre résultat n'a pas été pris en compte, vous pouvez copier/coller l'ID de la seed que vous avez joué (ou êtes toujours en train de jouer) dans la page de l'extension. Toute médaille ou tout score qui n'a pas été validé sera revérifié.

### Au bout d'un temps la connexion au serveur ne fonctionne plus

Parfois, le port du serveur Archipelago change. Retournez sur votre serveur Archipelago pour récupérer la nouvelle adresse, et connectez-vous en utilisant le nouveau port.