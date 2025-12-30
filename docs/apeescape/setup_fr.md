# Ape Escape - Guide de configuration

## Logiciels Requis
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Veuillez utiliser la version 0.6.1 ou ultérieure pour le support intégré dans Bizhawk.
- Fichier ISO ou BIN/CUE Ape Escape (USA). Soit une version originale en label noir, soit la version Greatest Hits devrait fonctionner.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) version 2.7 à 2.9.1. La version 2.10 de BizHawk ou tout autre émulateur n'est **pas** pris en charge.
- Le fichier `apeescape.apworld` le plus récent. Vous pouvez le trouver sur la [page GitHub](https://github.com/Thedragon005/Archipelago-Ape-Escape/releases/latest). Déposer le fichier dans le dossier `Archipelago/custom_worlds`.

### Configuration de BizHawk
Après avoir installé BizHawk, ouvrez `EmuHawk.exe` et allez changer les configurations suivantes :

- Si vous utilisez la version 2.7 ou 2.8 de Bizhawk, naviguez jusqu'à `Config > Customize`. Dans l'onglet `Advanced`, 
changez le paramètre Lua Core de `NLua+KopiLua` à `Lua+LuaInterface`, ensuite redémarrer EmuHawk. 
(Si vous utilisez la version 2.9 de BizHawk, vous pouvez passer cette étape.)
- Sous `Config > Customize`, cochez la case "Run in background" pour empêcher la déconnexion du client quand Bizhawk s'exécute en arrière-plan.
- Sous `Config > Preferred Cores > PSX`, sélectionnez NymaShock.
- Ouvrez n'importe quel jeu PlayStation dans EmuHawk et allez dans `Config > Controllers…` pour configurer les entrées.
Si vous ne pouvez pas cliquer sur `Controllers…`, c'est parce que vous devez d'abord charger un jeu.
- Ape Escape est vraiment particulier à propos des configurations analogues : Aller dans `PSX > Settings` et sélectionnez `Sync Settings`. Changez Virtual
Port 1 à Dual Analog pour aider à prévenir les problèmes de deadzone.
Vous pourriez avoir à inverser la Sensitivité pour l'axe "Up/Down" à -100%.
Cela peux être trouvé sous Analog Controls through `Config > Controllers…`.
Selon votre contrôleur, vous pourriez aussi vouloir ajuster les Deadzone. Quelque chose aux alentours de 6% est recommandé pour un contrôleur de type DualShock 4.
- Envisagez d'effacer les raccourcis clavier dans `Config > Hotkeys…` si vous ne prévoyez pas les utiliser. Sélectionnez
le raccourci, puis appuyez sur Esc pour l'effacer.

## Générer une partie

1. Créez votre fichier de configuration (YAML). Après avoir installé le fichier `apeescape.apworld`, vous pouvez générer un modèle dans le menu Archipelago Launcher en cliquant sur l'option `Generate Template Settings`.
2. Suivez les instructions générales d'Archipelago pour [Générer une partie](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game) (En anglais).
3. Ouvrez `ArchipelagoLauncher.exe`
4. Sélectionnez "BizHawk Client" dans la colonne de droite. À la première ouverture, on vous demandera également de 
repérer `EmuHawk.exe` dans votre installation de Bizhawk.

## Se connecter à un Serveur

1. Si EmuHawk n'a pas démarré automatiquement, ouvrez-le manuellement.
2. Ouvrez votre fichier ISO ou CUE d'Ape Escape (USA) dans EmuHawk.
3. Dans EmuHawk, allez à `Tools > Lua Console`. Cette fenêtre doit rester ouverte quand vous jouez. Faites attention de ne pas cliquer sur "TAStudio" directement en dessous, car cela est connu pour supprimer votre sauvegarde.
4. Dans la fenêtre Lua Console, allez à `Script > Open Script…`.
5. Naviguez jusqu'à votre répertoire d'installation Archipelago et ouvrez `data/lua/connector_bizhawk_generic.lua`.
6. L'émulateur et le client vont éventuellement se connecter l'un à l'autre. La fenêtre Bizhawk Client devrait indiquer qu'il s'est connecté et a reconnu Ape Escape.
7. Pour connecter le client au serveur, entrez l'adresse de la salle et le port (ex. `archipelago.gg:38281`) dans le 
champ situé en haut du client et appuyez sur Connect.

Vous devriez maintenant être en mesure de recevoir et d'envoyer des objets. Vous devrez faire ces étapes chaque fois que vous voulez vous reconnecter.

## Terminer une session
- Ape Escape ne sauvegarde pas automatiquement votre progression. Quand vous avez fini de jouer, sauvegardez soit votre 
partie dans une carte mémoire virtuelle à partir de la station de sauvegarde (recommandé) ou bien effectuez une 
sauvegarde d'état (savestate) pour pouvoir reprendre plus tard. Lors d'une reconnexion ultérieure, Archipelago
vous enverra tous les objets que vous avez reçus pendant la déconnexion.
