//Define certain variables here
//Counting the # of bullets fired
FiredBulletCount = 0;
//Set Debug information below
VCOM_AIDEBUG = 0; //1 is on, 0 is off. Not recommended to have on for large # of AI. Will destroy any computer. (Spawn's infinite amount of markers to track AI).
MarkerName = 0; //Do not touch! Used to define a name for later use. DEBUG TOOL
MarkerArray = []; //Do not touch! Used to define an array for later use. DEBUG TOOL

//Compile important functions below.
call compile preProcessFile "Scripts\Cooked\VCOMAI\FSMFunctions\configFunctions.sqf";
FiredAtTarget = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\HitNear.sqf";
AIPath = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\Aiwaypoint.sqf";
VCOM_fnc_ClosestEnemy = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ClosestEnemy.sqf";
VCOM_fnc_Garrison = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_Garrison.sqf";
VCOM_fnc_LightGarrison = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_LightGarrison.sqf";
Vcom_fnc_VehicleHandle = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\Vcom_fnc_VehicleHandle.sqf";
VCOM_fnc_ClosestAllyWarn = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ClosestAllyWarn.sqf";
//VCOM_fnc_KnockDown = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_KnockDown.sqf";
VCOM_fnc_BlowBuilding = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_BlowBuilding.sqf";
VCOM_fnc_HasMine = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_HasMine.sqf";
VCOM_fnc_ReactToFireGrenade = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ReactToFireGrenade.sqf";
//VCOM_fnc_ReactToFireSuppressed = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ReactToFireSuppressed.sqf";
VCOM_fnc_classVehicle = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_classVehicle.sqf";
VCOM_fnc_MagClass = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_MagClass.sqf";
VCOM_fnc_ChangeFormation = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ChangeFormation.sqf";
VCOM_fnc_CheckBag = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_CheckBag.sqf";
VCOM_fnc_GuessDirection = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_GuessDirection.sqf";
VCOM_fnc_ReactToFire = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ReactToFire.sqf";
playMoveEverywhere = compileFinal "_this select 0 playMoveNow (_this select 1);";
switchMoveEverywhere = compileFinal "_this select 0 switchMove (_this select 1);";
Vcom_fnc_pack = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\Vcom_fnc_pack.sqf";
Vcom_fnc_unpack = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\Vcom_fnc_unpack.sqf";
//VCOM_fnc_HandledHeal = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_HandledHeal.sqf";
VCOM_EraseMarkers = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_Erasemarker.sqf";
//VCOM_DownedAI = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_DownedAI.sqf";
VCOM_fnc_Artillery = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_Artillery.sqf";
VCOM_fnc_ArtilleryCalled = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_ArtilleryCalled.sqf";

//New Functions
VCOM_fnc_DetermineRank = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_DetermineRank.sqf";
VCOM_fnc_DetermineLeader = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_DetermineLeader.sqf";
VCOM_fnc_EvasiveAI = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_EvasiveAI.sqf";
VCOM_fnc_IsDriver = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_IsDriver.sqf";
VCOM_fnc_HitAI = compile preprocessFile "Scripts\Cooked\VCOMAI\FSMFunctions\VCOM_fnc_HitAI.sqf";


//AI ACCURACY SETTINGS - You can change these numbers below
AccuracyFunctionRank6 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.2 + (random 0.2))];
_Unit setSkill ["aimingShake",(0.2 + (random 0.2))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.1))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.3 + (random 0.3))];
};
AccuracyFunctionRank5 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.15 + (random 0.15))];
_Unit setSkill ["aimingShake",(0.15 + (random 0.15))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.1))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.3 + (random 0.2))];
};
AccuracyFunctionRank4 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.1 + (random 0.15))];
_Unit setSkill ["aimingShake",(0.1 + (random 0.15))];
_Unit setSkill ["spotDistance",(0.05 + (random 0.05))];
_Unit setSkill ["spotTime",(0.00 + (random 0.1))];
_Unit setSkill ["courage",(0.5 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.2 + (random 0.2))];
};
AccuracyFunctionRank3 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.1 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.1 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.05))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.2 + (random 0.2))];
};

AccuracyFunctionRank2 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.1 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.1 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.00 + (random 0.05))];
_Unit setSkill ["spotTime",(0.07 + (random 0.05))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.2 + (random 0.2))];
};

AccuracyFunctionRank1 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.1 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.1 + (random 0.1))];
_Unit setSkill ["spotDistance",(0 + (random 0.05))];
_Unit setSkill ["spotTime",(0.05 + (random 0.05))];
_Unit setSkill ["courage",(0.2 + (random 0.3))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.1 + (random 0.2))];
};

AccuracyFunctionRank0 = {
_Unit = _this select 0;

_Unit setSkill ["aimingAccuracy",(0.1 + (random 0.1))];
_Unit setSkill ["aimingShake",(0.1 + (random 0.1))];
_Unit setSkill ["spotDistance",(0.0 + (random 0.05))];
_Unit setSkill ["spotTime",(0.0 + (random 0.05))];
_Unit setSkill ["courage",(0.1 + (random 0.1))];
_Unit setSkill ["commanding",1.0];
_Unit setSkill ["aimingSpeed",(0.1 + (random 0.1))];
_Unit setSkill ["general",1.0];
_Unit setSkill ["endurance",1.0];
_Unit setSkill ["reloadSpeed",(0.1 + (random 0.1))];
};

//The distance AI squads will communicate to each other. This can be changed per unit and is not retroactive.
VCOM_AIWarnDistance = 350;

//AI using smoke. 1 is on.
VCOM_USESMOKE = 1;

//AI will use artillery freely
VCOM_Artillery = 1;

//Artillery unit array. This will automatically fill and empty in the game. Put units in here only if it is SUPER time sensitive.
ArtilleryArray = [];

//Below is loop to check for new AI spawning in to be added to the list

[] spawn {
if (!(isDedicated)) then {
waitUntil {!isNil "BIS_fnc_init"};
waitUntil {!(isnull (findDisplay 46))};
};

while {true} do {

sleep 0.25;
{
if (local _x) then {
_CheckVariable = _x getVariable "FSMRunning";
if (isNil ("_CheckVariable")) then {_CheckVariable = 0;};
if (!(isplayer _x) && (_CheckVariable == 0)) then {null = [_x] execFSM "Scripts\Cooked\VCOMAI\AIBEHAVIORNEW.fsm";};
if ((isPlayer _x)  && (_CheckVariable == 0)) then {
player setVariable ["VCOM_FiredTime", 0];
player setVariable ["PLAYERCOMMANDER", 1];
player addEventHandler ["Fired",{null = [_this] call FiredAtTarget;}];
player setVariable ["FSMRunning",1,true];
};
};
} forEach allUnits;
sleep 5;

sleep 1;
};
};