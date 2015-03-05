//BATTLEBORN Damage Modeling System
//Enables Battleborn's Damage modeling system
BATTLE_Damage_ModEnable = 1;
BATTLE_Damage_ModEnableAI = 0;
BATTLE_Damage_ModAGMSupport = 1;

//Damage System Settings [PLAYERVALUE, AIVALUE]
BATTLE_Damage_Multiplier = [5, 5]; 		//Amount of damage a unit takes per bullet
BATTLE_Damage_HitPointsPlayer = [100,100]; 	//Amount of HP a player has in the system
BATTLE_Damage_MissChance = = [25, 25]; 		//A chance for a bullet that hits to be dodged

//Stablization of ARMA 3 AI Default Damage System
BATTLE_Damage_ModStablizeAI = 1; 			//Stableizes the AI's damage model to be consistant. I.E, removes all AI damage mods
BATTLE_Damage_ModStablizeMultiplier = 1;	//A multiplier to damage done to the AI
/////////////////////////////////////////////////////


//BATTLEBORN NightVision Effect System
//Adds some visual effects when NVG's are enabled.
BATTLE_NightVision_ModEnable = 1;
BATTLE_NightVision_ModAdvancedEffects = 0;
/////////////////////////////////////////////////////


//BATTLEBORN Misc Items
//Random Settings
BATTLE_Knife_ModEnable = 1;					//Allows you to knife an enemy for a silent kill.
BATTLE_Medical_ModEnable = 1;				//Adds Medical System Indicators
BATTLE_DeleteRespawnCorpse = 1;				//Deletes Corpses on Respawn
BATTLE_SaveRespawnLoadout = 1;				//Enables a loadout save system when a player dies or disconnects.
BATTLE_RemoveNVGFromAI = 1;
BATTLE_ForceFlashlightUseForAI = 1;			//Forces flash light useage for AI