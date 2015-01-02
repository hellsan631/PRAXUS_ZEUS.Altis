_tar = cursorTarget;
_caller = _this select 1;
_id = _this select 2 ;

if ((isNil "_tar") || (isNull _tar)) exitWith {false;};

if ((_tar isKindOf "Man")&&((_tar distance _caller) < 4)&&(side _tar != side _caller)) then {

	[_caller] call hells_fnc_unitKnifeAnim;
	knife_unit = _caller;
	publicVariable "hells_fnc_unitKnifeAnim";

	_tar setDamage 1;

	_caller say3D "knife_sound";

	_tar removeAction _id;

};

