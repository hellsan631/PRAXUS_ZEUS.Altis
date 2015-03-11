private [
			"_unit", "_damage", "_location", "_projectile",
			"_damageArray", "_prevCount", "_newCount", "_last", "_dmgExe",
			"_unitTrueDMG", "_unitTrueIndex", "_tempDmg", "_tempLoc", "_tempLen"
		];

_unit 			= _this select 0;

if (!(local _unit)) exitWith {
	BATTLE_findDamage = _this;
	if (isServer) then {
        (owner _unit) publicVariableClient "BATTLE_findDamage";
    } else {
        publicVariableServer "BATTLE_findDamage";
    };
};

_damage  		= _this select 1;
_location  		= _this select 2;
_projectile 	= _this select 3;

_damageArray = _unit getVariable "BATTLE_damageArray";

if (isNil ("_damageArray")) then {
	_damageArray = [];
};

_damageArray pushBack [_unit, _damage, _location, _projectile];

_unit setVariable ["BATTLE_damageArray", _damageArray, false];

_prevCount = count _damageArray;
_newCount = count _damageArray;
_last = 0;

//Might improve this by using diag_TickTime to measure total time eclipsed, or diag_FrameNo
if(_prevCount > 6) then {

	sleep 0.05;

	_damageArray = _unit getVariable "BATTLE_damageArray";

	if (!isNil ("_damageArray")) then {

		_newCount = count _damageArray;

		if(_newCount == _prevCount) then {
			_last = 1;
		};

	};

};

if(_last == 1) then {

	_dmgExe = _unit getVariable "BATTLE_runDamage";

	if (isNil ("_dmgExe")) then {
		_unit setVariable ["BATTLE_runDamage", 1, false];
	} else {
		_last = 0;
	};

};

if(_last == 1) then {

	_unit setVariable ["BATTLE_damageArray" , nil];

	_unitTrueDMG = 0;
	_unitTrueIndex = 0;

	{
		_tempDmg 	= _x select 1;
		_tempLoc 	= _x select 2;
		_tempLen 	= count (toArray _tempLoc);

		if(_tempDmg > _unitTrueDMG && (_tempLoc != "?" && !isNil ("_tempLoc") && _tempLen > 1) then {
			_unitTrueDMG = _tempDmg;
			_unitTrueIndex = _forEachIndex;
		};

	} forEach _damageArray;

	(_damageArray select _unitTrueIndex) call fn_runDamage;

};
