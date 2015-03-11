//BATTLEBORN Damage Modeling System
//Enables Battleborn's Damage modeling system
#define BATTLE_DAMAGE_MODENABLE 1;
#define BATTLE_DAMAGE_MODENABLEAI 2; 		//2 means a stablization of damage instead of using the damage system overhaul
#define BATTLE_DAMAGE_AGMSUPPORT 1;
#define BATTLE_DAMAGE_AGMSUPPORTAI 0;
#define BATTLE_DAMAGE_AGMHPENABLE 35;		//HP to enable AGM support/effects

//Damage System Settings
#define BATTLE_DAMAGE_MULTIPLIER_PLAYER 2;  //Amount of damage a unit takes per bullet
#define BATTLE_DAMAGE_MULTIPLIER_AI 1;
#define BATTLE_DAMAGE_HP_PLAYER 100;		//Amount of HP a player has in the system
#define BATTLE_DAMAGE_HP_AI 100;
#define BATTLE_DAMAGE_MISS_PLAYER 25;		//A chance for a bullet that hits to be dodged
#define BATTLE_DAMAGE_MISS_AI 0;
#define BATTLE_DAMAGE_HITCURVE_PLAYER 1;	//Curves the damage for players based on number of hits. Less hits = less damage.
#define BATTLE_DAMAGE_HEADSHOTSOUND 1;
/////////////////////////////////////////////////////


//BATTLEBORN NightVision Effect System
//Adds some visual effects when NVG's are enabled.
#define BATTLE_NV_MODENABLE 1;
#define BATTLE_NV_ADVANCEDEFFECTS 0; //0 = none, 1 = film gain only, 2 = film gain and blur
#define BATTLE_NV_ENABLESOUND 1;
/////////////////////////////////////////////////////


//BATTLEBORN Misc Items
//Random Settings
#define BATTLE_INSIGNIA 1; //places praxus insignia on player units on spawn
#define BATTLE_KNIFE 1;
#define BATTLE_KNIFEDISTANCE 3;
#define BATTLE_FATIGUE 1;
#define BATTLE_FATIGUEDECAY 0.15; //higher numbers means fatigue decays more. this represents decay every 5 seconds
#define BATTLE_MEDICAL 1;
#define	BATTLE_DELETERESPAWNCORPSE 1;
#define	BATTLE_SAVERESPAWNLOADOUT 1;
#define BATTLE_REMOVENVG_AI 1;
#define BATTLE_FORCEFLASHLIGHTUSE_AI 1;
#define BATTLE_CLEANUP 0;
#define BATTLE_FLIPVEHICLE 0;
/////////////////////////////////////////////////////
