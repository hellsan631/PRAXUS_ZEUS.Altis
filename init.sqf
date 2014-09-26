["<t size='.6'>http://praxusgroup.com/</t>",0.02,0.3,6,1,0,3010] spawn bis_fnc_dynamicText;

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

//AI Flashlights and the likes
[] execVM "Scripts\hells_handler.sqf";

player addMPEventHandler ["MPRespawn", {

            (_this select 0) addAction ["<t color='#ff0000'>Knife</t>", "hells_knife.sqf", [], 6, true, true, "", "((cursorTarget distance _this)<4)&&(alive cursorTarget)"];

            _this spawn FNC_Del_Corpse;

        }];

player addEventHandler ["HandleDamage",{

    _unit = _this select 0;
    _loc  = _this select 1;
    _dmg  = _this select 2;
    _proj = _this select 4;

    [_unit, _dmg, _loc, _proj] execVM "playerdmg.sqf";

    false

}];

FNC_Del_Corpse = {_unit = _this select 1;
        _pos = getPos _unit;_xpos = _pos select 0;_ypos = _pos select 1;
        _zpos = _pos select 2;sleep 0.3;for "_i" from 0 to 3 do {_xvel = 0;_yvel = 0;_zvel = 0;_tnt = 0;
        drop[["A3\Data_F\ParticleEffects\Universal\universal.p3d",16,7,48],"","Billboard",0,1 + random 0.5,[_xpos,_ypos,_zpos],
        [_xvel,_yvel,_zvel],1,1.2,1.3,0,[2],[[0.55,0.5,0.45,0],[_tnt + 0.55,_tnt + 0.5,_tnt + 0.45,0.16],
        [_tnt + 0.55,_tnt + 0.5,_tnt + 0.45, 0.12],[_tnt + 0.5,_tnt + 0.45,_tnt + 0.4,0.08],
        [_tnt + 0.45,_tnt + 0.4,_tnt + 0.35,0.04],[_tnt + 0.4,_tnt + 0.35,_tnt + 0.3,0.01]],[0],0.1,0.1,"","",""];};
    deleteVehicle _unit;};

GAM_TimeXlerationMP = [0.08333333, 15, true, 30] execVM "GAM\GAM_TimeXleration\scripts\timexleration-mp.sqf";

0 = ["random", "cycling", [0.1, 0.2], [0.05, 0.4], [0, 0.8, 0, 0.5, 0, 0.7], 0, 0] execVM "Scripts\tort_DynamicWeather.sqf";

[] execVM "NVscript.sqf";

[
    10*60*10, // seconds to delete dead bodies (0 means don't delete)
    10*60*2, // seconds to delete dead vehicles (0 means don't delete)
    0, // seconds to delete immobile vehicles (0 means don't delete)
    10*60*5, // seconds to delete dropped weapons (0 means don't delete)
    10*60*20, // seconds to deleted planted explosives (0 means don't delete)
    10*60*2 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'cleanup.sqf';

TAG_fnc_respawn = {
            Flip_Action = (_this select 0) addAction ["Flip Vehicle", "FlipAction.sqf", [], 0, false, true, "", "_this == vehicle _target"];
        };

if (!isDedicated) then {
	waitUntil {!isNull player};
	Player AddEventHandler ["Respawn", {
                call TAG_fnc_respawn;
            }];
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
//null = [3] execvm "tpwcas\tpwcas_script_init.sqf"

//VCOM AI
[] execVM "VCOMAI\init.sqf";
