//BATTLEBORN Damage Modeling System
//Enables Battleborn's Damage modeling system
#define BATTLE_DAMAGE_MODENABLE 1;
#define BATTLE_DAMAGE_MODENABLEAI 0;
#define BATTLE_DAMAGE_AGMSUPPORT 1;

//Damage System Settings
#define BATTLE_DAMAGE_MULTIPLIER_PLAYER 5;  //Amount of damage a unit takes per bullet
#define BATTLE_DAMAGE_MULTIPLIER_AI 5;
#define BATTLE_DAMAGE_HP_PLAYER 100;		//Amount of HP a player has in the system
#define BATTLE_DAMAGE_HP_AI 100;
#define BATTLE_DAMAGE_MISS_PLAYER 25;		//A chance for a bullet that hits to be dodged
#define BATTLE_DAMAGE_MISS_AI 25;

//Stablization of ARMA 3 AI Default Damage System
//Use this as a substitue to the above damage modeling.
//This will override the AI damage modeling above
#define BATTLE_DAMAGE_STABILIZEAI_ENABLE 1;		//Stableizes the AI's damage model to be consistant. I.E, removes all AI damage mods
#define BATTLE_DAMAGE_STABILIZE_MULTIPLIER 1;	//A multiplier to damage done to the AI
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



//BATTLEBORN Public Settings
publicVariable "BATTLE_NightVision_ModEnable";
publicVariable "BATTLE_NightVision_ModAdvancedEffects";

publicVariable "BATTLE_Knife_ModEnable";
publicVariable "BATTLE_Medical_ModEnable";
publicVariable "BATTLE_DeleteRespawnCorpse";
publicVariable "BATTLE_SaveRespawnLoadout";
publicVariable "BATTLE_RemoveNVGFromAI";
publicVariable "BATTLE_ForceFlashlightUseForAI";
/////////////////////////////////////////////////////
