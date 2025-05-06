

# Tales of Vesperia encounter editor

This will let you modify the game so that it allows you to load in any boss into the Estellise (Yuri solo) encounter.
<br> Many thanks to [AdmiralCurtiss](https://github.com/AdmiralCurtiss) for making and updating [HyoutaTools](https://github.com/AdmiralCurtiss/HyoutaTools)! It would not be possible without his tool.

### Requirements
- At least 10 GB of free space
- A GitHub account (to download [HyoutaTools](https://github.com/AdmiralCurtiss/HyoutaTools))
- [HyoutaTools](https://github.com/AdmiralCurtiss/HyoutaTools) (commit b5365e1978c170119d75acda7a702b4ea62f60ac or later)
- [Cheat Engine](https://cheatengine.org)
- My [Vesperia Cheat Engine table](https://raw.githubusercontent.com/Sora3100/Tales_of_Cheat_Tables/refs/heads/master/Vesperia.CT)

### Installation
 1. Download this repository and extract it to a folder.
 2. Download and extract [HyoutaTools](https://github.com/AdmiralCurtiss/HyoutaTools) to the same folder.
	 - **To do this, you will need a GitHub account.**
	 1. Click on "Looking for an executable? Check here!"
	 2. Click on the first ✅ icon.
	 3. Scroll all the way down, then click on the Artifact "HyoutaToolsCLI".
	 4. Extract the contents to the folder of this script.
3. Move the "chara.svo" file from your game folder (\Tales of Vesperia Definitive Edition\Data64\\) to the script's folder.
4. Run "run.bat" as admin. (This is required for symbolic linking purposes, it saves some space.)
5. When asked, press R, then press Enter. (This is required for merging the JSON files that [HyoutaTools](https://github.com/AdmiralCurtiss/HyoutaTools) will use)
6. If no errors popped up, then move the newly appeared "BTL_ENEMY_1722.DAT" file in the script's folder into the "chara" folder also found in the same folder.
7. Move the "chara" folder in the script's folder to "\Tales of Vesperia Definitive Edition\Data64\\"
   - If the "chara.svo" file is still present in "\Tales of Vesperia Definitive Edition\Data64\\", you will need to either move it, rename it  or delete it.
 8. You have now successfully installed it. Proceed to usage.
### Usage
1. Open the game and load a save.
2. Open my [Vesperia Cheat Engine table](https://raw.githubusercontent.com/Sora3100/Tales_of_Cheat_Tables/refs/heads/master/Vesperia.CT).
3. Enable the main "Enable" script, go to Notes -> Pointers and enable "T8BTEMGP Finder".
4. Change the value of "Edit" under "T8BTEMGP Finder", either use the dropdown to select "592:Estellise (Yuri solo)" or manually type in 592 and press enter.
5. Setup the enemies as you like.
<br> Note that you will need to change the scale of the enemy to make them appear.
   - (OPTIONAL, but recommended) Go to Notes -> Pointers -> Encounter related and enable "Encounter editor".
<br>(By default, this is set to the Estellise fight, but if it isn't, set it to 1711.)
<br>This allows you to enter the fight from anywhere. Including random encounters.
6. Enter the Estellise fight. (either by Namco Banda Isle or via the script mentioned in the previous OPTIONAL step).
7. Your selected enemies should now be present. Have fun!


### Known issues

- Trying to load any mob that isn't "Gattuso Cub" or "Wolf" or "Axe Beak" or "Rhinossus" will crash the game. <br> This is because only boss characters are included. <br> If I included everything, the game would crash, as there is seemingly a 2 GB cap on how big of a file the game can load.
 - Entering a town after loading in the Estellise fight will result in a crash. This includes escaping, losing or winning the fight.
   -  Enter the encounter from the field using the encounter editor found in my [Cheat Engine table](https://raw.githubusercontent.com/Sora3100/Tales_of_Cheat_Tables/refs/heads/master/Vesperia.CT).
   - Can be found under Notes -> Pointers -> Encounter related -> Encounter editor.
   - By default, it is set to the Estellise fight.
- Trying to load a Team Melee variant of a party member will result them being in a T-Stance if they aren't also in the active party.