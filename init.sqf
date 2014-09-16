["<t size='.6'>http://praxusgroup.com/</t>",0.02,0.3,6,1,0,3010] spawn bis_fnc_dynamicText;

//AI Flashlights and the likes
[] execVM "Scripts\hells_handler.sqf";

skillFriendly=0.125;
skillEnemy=0.125;
precisionFriendly=0.01;
precisionEnemy=0.01;

GAM_TimeXlerationMP = [0.08333333, 15, true, 30] execVM "GAM\GAM_TimeXleration\scripts\timexleration-mp.sqf";

// dynamic weather
private["_initWeather","_weatherTrend","_probRnd"];
_initWeather = ["clear","sunny","cloudy","foggy","bad","random"] select Param_initWeather;
_weatherTrend = ["constant","worse","pWorse","better","pBetter","freeCycle","random"] select Param_weatherTrend;
_probRnd = [0,0.05,0.2,0.45] select Param_probRnd;

0 = [_initWeather, _weatherTrend, [0.1, 0.2], [0.05, 0.4], [0, 0.8, 0, 0.5, 0, 0.7], 0, 0] execVM "Scripts\tort_DynamicWeather.sqf";

[] execVM "NVscript.sqf";


[
    10*60*10, // seconds to delete dead bodies (0 means don't delete)
    10*60*2, // seconds to delete dead vehicles (0 means don't delete)
    0, // seconds to delete immobile vehicles (0 means don't delete)
    10*60*5, // seconds to delete dropped weapons (0 means don't delete)
    10*60*20, // seconds to deleted planted explosives (0 means don't delete)
    10*60*2 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'cleanup.sqf';

TAG_fnc_respawn = {Flip_Action = (_this select 0) addAction ["Flip Vehicle", "FlipAction.sqf", [], 0, false, true, "", "_this == vehicle _target"];};

if (!isDedicated) then {
	waitUntil {!isNull player};
	Player AddEventHandler ["Respawn", {call TAG_fnc_respawn;}];
	Flip_Action = player addAction ["Flip Vehicle", "FlipAction.sqf", [], 0, false, true, "", "_this == vehicle _target"];

};

//Squad Managers
//Domination Squad manager -------------------------------------------------------------------
[] call compileFinal PreProcessFile "DOM_squad\group_manager.sqf";
[] call compileFinal PreProcessFile "DOM_squad\init.sqf";
//--------------------------------------------------------------------------------------------

//Map Markers for Players
0 = [] execVM "FreeLance.sqf";

//Adds Fast Roping to Helicopters
[] execVM "zlt_fastrope.sqf";

//Repair Script
[true] execVM "zlt_fieldrepair.sqf";

//Realistic Jump Script
execvm "jump.sqf";

//AI Supression System 5.5
null = [3] execvm "tpwcas\tpwcas_script_init.sqf"

//VCOM AI
[] execVM "VCOMAI\init.sqf";
VCOM_AIWarnDistance = 350;
