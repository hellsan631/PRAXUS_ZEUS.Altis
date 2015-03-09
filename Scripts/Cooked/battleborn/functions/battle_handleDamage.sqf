if (!(isDedicated)) then {
	waitUntil {!isNil "BIS_fnc_init";};
	waitUntil {!(isnull (findDisplay 46));};
};

waitUntil {!isNull player && player == player};

private ["_ScriptLocation"];

_ScriptLocation = functionLocation + "/battle_handleDamage/";

[_ScriptLocation] execVM _ScriptLocation + "locationDamage.sqf"; //process the compiling functions

fn_findDamage 		= compile preprocessFileLineNumbers _ScriptLocation + "fn_findDamage.sqf";
fn_runDamage 		= compile preprocessFileLineNumbers _ScriptLocation + "fn_runDamage.sqf";
fn_projectileTables = compile preprocessFileLineNumbers _ScriptLocation + "fn_projectileTables.sqf";

player removeAllEventHandlers "HandleDamage";

player addEventHandler ["HandleDamage", {

    [_this select 0, _this select 1, _this select 2, _this select 4] call fn_findDamage;

    false

}];

"BATTLE_findDamage" addPublicVariableEventHandler {
    _damageArray = _this select 1;
    _unit = _this select 1 select 0;

    if (local _unit) then {
        _damageArray call fn_findDamage;
    };
};