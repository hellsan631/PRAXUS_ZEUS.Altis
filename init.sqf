["<t size='.6'>http://praxusgroup.com/</t>",0.02,0.3,6,1,0,3010] spawn bis_fnc_dynamicText;

VCOM_AIKnockingOut = 0;
VCOM_AIWarnDistance = 150;

hells_fnc_unitKnifeAnim = {

    private ["_unit"];

    _unit = _this select 0;

    _unit SetUnitPos "UP";
    _unit playActionNow "gesturePoint";
    _unit disableAI "MOVE";

};

"hells_fnc_unitKnifeAnim" addPublicVariableEventHandler {

    _unit = _this select 1;
    [_unit] call hells_fnc_unitKnifeAnim;

};

player removeAllEventHandlers "HandleDamage";

player addEventHandler ["HandleDamage",{

    _unit = _this select 0;
    _loc  = _this select 1;
    _dmg  = _this select 2;
    _proj = _this select 4;

    [_unit, _dmg, _loc, _proj] execVM "Scripts\playerdmg.sqf";

    false

}];

//AI Flashlights and the likes
[] execVM "Scripts\hells_handler.sqf";

//[] execVM "Scripts\Main\NVscript.sqf";

[
    10*60*10, // seconds to delete dead bodies (0 means don't delete)
    10*60*2, // seconds to delete dead vehicles (0 means don't delete)
    0, // seconds to delete immobile vehicles (0 means don't delete)
    10*60*5, // seconds to delete dropped weapons (0 means don't delete)
    10*60*20, // seconds to deleted planted explosives (0 means don't delete)
    10*60*2 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'Scripts\cleanup.sqf';

TAG_fnc_respawn = {
    Flip_Action = (_this select 0) addAction ["Flip Vehicle", "Scripts\FlipAction.sqf", [], 0, false, true, "", "_this == vehicle _target"];
    Knife_Action = player addAction ["<t color='#ff0000'>Knife</t>", "Scripts\hells_knife.sqf", [], 6, true, true, "", "((cursorTarget distance _this)<4)&&(alive cursorTarget)"];
};

if (!isDedicated) then {
	waitUntil {!isNull player};
	Player AddEventHandler ["Respawn", {
                call TAG_fnc_respawn;
            }];
	Flip_Action = player addAction ["Flip Vehicle", "Scripts\FlipAction.sqf", [], 0, false, true, "", "_this == vehicle _target"];
    Knife_Action = player addAction ["<t color='#ff0000'>Knife</t>", "Scripts\hells_knife.sqf", [], 6, true, true, "", "((cursorTarget distance _this)<4)&&(alive cursorTarget)"];
};

//Squad Managers
//Domination Squad manager -------------------------------------------------------------------
[] call compileFinal PreProcessFile "Scripts\Cooked\DOM_squad\group_manager.sqf";
[] call compileFinal PreProcessFile "Scripts\Cooked\DOM_squad\init.sqf";
//--------------------------------------------------------------------------------------------

//Map Markers for Players
0 = [] execVM "Scripts\FreeLance.sqf";

//Adds Fast Roping to Helicopters
[] execVM "Scripts\zlt_fastrope.sqf";

//Repair Script
[true] execVM "Scripts\zlt_fieldrepair.sqf";

//Realistic Jump Script
execvm "Scripts\jump.sqf";

//AI Supression System 5.5
//null = [3] execvm "tpwcas\tpwcas_script_init.sqf"

//VCOM AI
[] execVM "Scripts\Cooked\VCOMAI\init.sqf";
