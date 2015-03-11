private ["_unit", "_isNeeded"];

_unit = _this select 0;

_isNeeded = false;

_unit removeAllEventHandlers "HandleDamage";

_unit addEventHandler ["HandleDamage", {

	private ["_respawnLoadout"];

	if (BATTLE_SAVERESPAWNLOADOUT == 1 && _isNeeded) then {
	    _respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

	    profileNamespace setVariable ["saveLoadout", _respawnLoadout];
	};

    [_this select 0, _this select 1, _this select 2, _this select 4] call fn_findDamage;

    false;

}];