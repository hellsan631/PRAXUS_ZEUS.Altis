if (!(isDedicated)) then {
	waitUntil {!isNil "BIS_fnc_init";};
	waitUntil {!(isnull (findDisplay 46));};
};

waitUntil {!isNull player && player == player};

private ["_ScriptLocation", "_isNeeded"];

_isNeeded = false;

_ScriptLocation = functionLocation + "battle_handleDamage\";

[_ScriptLocation] execVM _ScriptLocation + "locationDamage.sqf"; //process the compiling functions

fn_findDamage 		= compile preprocessFileLineNumbers (_ScriptLocation + "fn_findDamage.sqf");
fn_runDamage 		= compile preprocessFileLineNumbers (_ScriptLocation + "fn_runDamage.sqf");
fn_projectileTables = compile preprocessFileLineNumbers (_ScriptLocation + "fn_projectileTables.sqf");
fn_diagDamage 		= compile preprocessFileLineNumbers (functionLocation + "battle_diag\fnc_diagDamage.sqf");

[name player, "Adding Damage Handlers"] call battle_fnc_diaglog;

player removeAllEventHandlers "HandleDamage";

player addEventHandler ["HandleDamage", {

	private ["_respawnLoadout"];

	if (BATTLE_SAVERESPAWNLOADOUT == 1 && _isNeeded) then {
	    _respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

	    profileNamespace setVariable ["saveLoadout", _respawnLoadout];
	};

    [_this select 0, _this select 1, _this select 2, _this select 4] call fn_findDamage;

    false;

}];



"BATTLE_findDamage" addPublicVariableEventHandler {
    (_this select 1) call fn_findDamage;
};