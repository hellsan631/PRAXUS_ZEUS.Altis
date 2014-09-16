//Define certain variables here
//Counting the # of bullets fired
FiredBulletCount = 0;
//Set Debug information below
VCOM_AIDEBUG = 1; //1 is on, 0 is off. Not recommended to have on for large # of AI. Will destroy any computer. (Spawn's infinite amount of markers to track AI).
MarkerName = 0; //Do not touch! Used to define a name for later use. DEBUG TOOL
MarkerArray = []; //Do not touch! Used to define an array for later use. DEBUG TOOL

//Compile important functions below.
call compile preProcessFile "VCOMAI\FSMFunctions\configFunctions.sqf";
FiredAtTarget = compile preprocessFile "VCOMAI\FSMFunctions\HitNear.sqf";
AIHIT = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_AiHit.sqf";
AIPath = compile preprocessFile "VCOMAI\FSMFunctions\Aiwaypoint.sqf";
VCOM_fnc_ClosestEnemy = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ClosestEnemy.sqf";
VCOM_fnc_Garrison = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_Garrison.sqf";
VCOM_fnc_LightGarrison = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_LightGarrison.sqf";
Vcom_fnc_VehicleHandle = compile preprocessFile "VCOMAI\FSMFunctions\Vcom_fnc_VehicleHandle.sqf";
VCOM_fnc_ClosestAllyWarn = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ClosestAllyWarn.sqf";
VCOM_fnc_KnockDown = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_KnockDown.sqf";
VCOM_fnc_BlowBuilding = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_BlowBuilding.sqf";
VCOM_fnc_HasMine = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_HasMine.sqf";
VCOM_fnc_ReactToFireGrenade = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ReactToFireGrenade.sqf";
VCOM_fnc_ReactToFireSuppressed = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ReactToFireSuppressed.sqf";
VCOM_fnc_classVehicle = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_classVehicle.sqf";
VCOM_fnc_MagClass = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_MagClass.sqf";
VCOM_fnc_ChangeFormation = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ChangeFormation.sqf";
VCOM_fnc_CheckBag = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_CheckBag.sqf";
VCOM_fnc_GuessDirection = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_GuessDirection.sqf";
VCOM_fnc_ReactToFire = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ReactToFire.sqf";
playMoveEverywhere = compileFinal "_this select 0 playMoveNow (_this select 1);";
switchMoveEverywhere = compileFinal "_this select 0 switchMove (_this select 1);";
Vcom_fnc_pack = compile preprocessFile "VCOMAI\FSMFunctions\Vcom_fnc_pack.sqf";
Vcom_fnc_unpack = compile preprocessFile "VCOMAI\FSMFunctions\Vcom_fnc_unpack.sqf";
VCOM_fnc_HandledHeal = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_HandledHeal.sqf";
VCOM_EraseMarkers = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_Erasemarker.sqf";
VCOM_DownedAI = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_DownedAI.sqf";
VCOM_fnc_Artillery = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_Artillery.sqf";
VCOM_fnc_ArtilleryCalled = compile preprocessFile "VCOMAI\FSMFunctions\VCOM_fnc_ArtilleryCalled.sqf";
//AI ACCURACY SETTINGS - You can change these numbers below
AccuracyFunctionShort = {
_Unit = _this select 0;
//Hint "SHORT DISTANCE!" - Less than 75 meters - 0 means TERRIBLE and 1.0 means BEST for all of these.
VCOM_ShortAcc = _Unit setSkill ["aimingAccuracy",(0.1 + (random 0.1))];
VCOM_ShortShake = _Unit setSkill ["aimingShake",(0.1 + (random 0.1))];
VCOM_ShortDistance = _Unit setSkill ["spotDistance",(0.05 + (random 0.05))];
VCOM_ShortTime = _Unit setSkill ["spotTime",(0.7 + (random 0.1))];
VCOM_ShortCourage = _Unit setSkill ["courage",(0.1 + (random 0.1))];
VCOM_ShortCommanding = _Unit setSkill ["commanding",1.0];
VCOM_ShortSpeed = _Unit setSkill ["aimingSpeed",(0.05 + (random 0.05))];
VCOM_ShortGeneral = _Unit setSkill ["general",1.0];
VCOM_ShortEndurance = _Unit setSkill ["endurance",1.0];
VCOM_ShortReloadSkill = _Unit setSkill ["reloadSpeed",(0.1 + (random 0.1))];
};
AccuracyFunctionMedium = {
_Unit = _this select 0;
//Hint "MEDIUM DISTANCE!" - Between 75 meters and 250 meters - 0 means TERRIBLE and 1.0 means BEST for all of these.
VCOM_MediumAcc = _Unit setSkill ["aimingAccuracy",(0.05 + (random 0.05))];
VCOM_MediumShake = _Unit setSkill ["aimingShake",(0.05 + (random 0.05)) ];
VCOM_MediumDistance = _Unit setSkill ["spotDistance",(0.05 + (random 0.05))];
VCOM_MediumTime = _Unit setSkill ["spotTime",(0.70 + (random 0.1))];
VCOM_MediumCourage = _Unit setSkill ["courage",1.0];
VCOM_MediumCommanding = _Unit setSkill ["commanding",1.0];
VCOM_MediumSpeed = _Unit setSkill ["aimingSpeed",(0.05 + (random 0.05))];
VCOM_MediumGeneral = _Unit setSkill ["general",1.0];
VCOM_MediumEndurance = _Unit setSkill ["endurance",1.0];
VCOM_MediumReloadSkill = _Unit setSkill ["reloadSpeed",(0.1 + (random 0.1))];
};
AccuracyFunctionFar = {
_Unit = _this select 0;
//Hint "FAR DISTANCE!" - Between 250 meters and 600 meters - 0 means TERRIBLE and 1.0 means BEST for all of these.
VCOM_FarAcc = _Unit setSkill ["aimingAccuracy",(0.01 + (random 0.02))];
VCOM_FarShake = _Unit setSkill ["aimingShake",(0.01 + (random 0.02)) ];
VCOM_FarDistance = _Unit setSkill ["spotDistance",(0.01 + (random 0.02))];
VCOM_FarTime = _Unit setSkill ["spotTime",1.0];
VCOM_FarCourage = _Unit setSkill ["courage",1.0];
VCOM_FarCommanding = _Unit setSkill ["commanding",1.0];
VCOM_FarSpeed = _Unit setSkill ["aimingSpeed",(0.01 + (random 0.05))];
VCOM_FarGeneral = _Unit setSkill ["general",1.0];
VCOM_FarEndurance = _Unit setSkill ["endurance",1.0];
VCOM_FarReloadSkill = _Unit setSkill ["reloadSpeed",(0.01 + (random 0.05))];
};
AccuracyFunctionExtreme = {
_Unit = _this select 0;
//Hint "EXTREME DISTANCE!" - Over 600 meters - 0 means TERRIBLE and 1.0 means BEST for all of these.
VCOM_ExtremeAcc = _Unit setSkill ["aimingAccuracy",(0.001 + (random 0.01))];
VCOM_ExtremeShake = _Unit setSkill ["aimingShake",(0.001 + (random 0.01))];
VCOM_ExtremeDistance = _Unit setSkill ["spotDistance",(0.01 + (random 0.01))];
VCOM_ExtremeTime = _Unit setSkill ["spotTime",1.0];
VCOM_ExtremeCourage = _Unit setSkill ["courage",1.0];
VCOM_ExtremeCommanding = _Unit setSkill ["commanding",1.0];
VCOM_ExtremeSpeed = _Unit setSkill ["aimingSpeed",(0.01 + (random 0.03))];
VCOM_ExtremeGeneral = _Unit setSkill ["general",1.0];
VCOM_ExtremeEndurance = _Unit setSkill ["endurance",1.0];
VCOM_FarReloadSkill = _Unit setSkill ["reloadSpeed",(0.01 + (random 0.03))];
};

//The distance AI squads will communicate to each other.
VCOM_AIWarnDistance = 250;
//Prevent helmets from coming off. 1 is on.
VCOM_AIHelmet = 0;
//AI have a chance to get knocked down when shot. 1 is on.
VCOM_AIKnockingOut = 1;
//AI using smoke. 1 is on.
VCOM_USESMOKE = 1;
//Will AI use new downing system?
VCOM_PermaDown = 1;
//AI will use artillery freely
VCOM_Artillery = 0;
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

				if (isNil ("_CheckVariable")) then {
					_CheckVariable = 0;
				};

				if (!(isplayer _x) && (_CheckVariable == 0)) then {

					null = [_x] execFSM "AIBEHAVIOR1.fsm";

				};

				if ((isPlayer _x) && (_CheckVariable == 0)) then {

					player setVariable ["FiredTime", 0];
					player setVariable ["PLAYERCOMMANDER", 1];
					player addEventHandler ["Fired",{null = [_this] call FiredAtTarget;}];
					player setVariable ["FSMRunning",1,true];

				};

			};

		} forEach allUnits;

		sleep 5;

	};
};