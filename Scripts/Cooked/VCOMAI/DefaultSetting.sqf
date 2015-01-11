//This script is only ran IF the userconfig folder is not installed properly.
//This script is for defining basic settings for the AI
//1 - is on. 0 - is off.
VCOM_USESMOKE_DEFINE = 1; //Should the AI use smoke grenades in battle?
VCOM_Artillery_DEFINE = 1; //Should AI be able to call for artillery? Artillery must already be present on map
VCOM_AIDEBUG_DEFINE = 0; //Would you like to run the debug code?
VCOM_ADVANCEDDRIVING_DEFINE = 1; //Would you like to enable advanced driving for AI? It makes them avoid obstacles.......because they don't do it by themselves all the time.....logic....ITS A GOOD GAME
VCOM_GARRISONEMPTYSTATICS_DEFINE = 1; //Should the AI garrison empty statics nearby?
NOAI_FOR_PLAYERLEADERS_DEFINE = 1; //Player group leaders will get more control over their AI

//The default distance AI will respond to others in need
VCOM_AIWarnDistance_DEFINE = 400; //What is the range that AI should respond to others in need?


//AI ACCURACY SETTINGS - You can change these numbers below
//Colonel Level AI
AccuracyFunctionRank6 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.1 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.1 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.1))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.3 + (random 0.3))];
};
//Major Level AI
AccuracyFunctionRank5 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.05 + (random 0.05))];
_Unit setSkill ["aimingShake",(0.05 + (random 0.05))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.1))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.3 + (random 0.2))];
};
//Captain Level AI
AccuracyFunctionRank4 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.01 + (random 0.015))];
_Unit setSkill ["aimingShake",(0.01 + (random 0.015))];
_Unit setSkill ["spotDistance",(0.05 + (random 0.05))];
_Unit setSkill ["spotTime",(0.00 + (random 0.1))];
_Unit setSkill ["courage",(0.5 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.2 + (random 0.2))];
};
//Lieutenant Level AI
AccuracyFunctionRank3 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.01 + (random 0.01))];
_Unit setSkill ["aimingShake",(0.01 + (random 0.01))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.05))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.2 + (random 0.2))];
};
//Sergeant Level AI
AccuracyFunctionRank2 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.01 + (random 0.01))];
_Unit setSkill ["aimingShake",(0.01 + (random 0.01))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.07 + (random 0.05))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.2 + (random 0.2))];
};
//Corporal Level AI
AccuracyFunctionRank1 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0 + (random 0.05))];
_Unit setSkill ["aimingShake",(0 + (random 0.05))];
_Unit setSkill ["spotDistance",(0 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.05))];
_Unit setSkill ["courage",(0.2 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.1 + (random 0.2))];
};
//Private Level AI
AccuracyFunctionRank0 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0)];
_Unit setSkill ["aimingShake",(0)];
_Unit setSkill ["spotDistance",(0.0 + (random 0.05))];
_Unit setSkill ["spotTime",(0.0 + (random 0.05))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.1 + (random 0.1))];
};