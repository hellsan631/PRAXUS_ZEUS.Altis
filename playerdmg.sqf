_unit = _this select 0;
_dmg  = _this select 1;
_loc  = _this select 2;
_proj = _this select 3;

run_damage = 1;
doDiagLog = 0;

if(doDiagLog == 1) then {
	diag_log format ["TestUnit: BDMG: %1 | LOC: %2 ", _dmg, _loc];
};

_dmgArray = _unit getVariable "HellsDMG";

_uDMG =  _unit getVariable "HellsOldDmg";

if (isNil ("_uDMG")) then {
	_uDMG = 0;
};

if (isNil ("_dmgArray")) then {
	_dmgArray = [[_unit, _dmg, _loc, _proj]];
} else {
	_dmgArray = [_dmgArray,[[_unit, _dmg, _loc, _proj]]] call fn_arrayAppend;
};

_unit setVariable ["HellsDMG", _dmgArray, false];

_prevCount = count _dmgArray;
_newCount = count _dmgArray;
_last = 0;

if(_prevCount > 6) then {

	sleep 0.05;

	_dmgArray = _unit getVariable "HellsDMG";

	if (!isNil ("_dmgArray")) then {

		_newCount = count _dmgArray;

		if(_newCount  == _prevCount) then {
			_last = 1;
		};

	};

};

if(_last == 1) then {

	_dmgExe = _unit getVariable "HellsDmgDo";

	if (isNil ("_dmgExe")) then {
		_dmgExe = 1;
		_unit setVariable ["HellsDmgDo", _dmgExe, false];
	} else {
		_last = 0;
	};

};

if(_last == 1) then {

	_unit setVariable ["HellsDMG" , nil];

	_unitTrueDMG = 0;
	_unitTrueIndex = 0;

	{
		_tempDmg =  _x select 1;

		if(_tempDmg > _unitTrueDMG) then {
			_unitTrueDMG = _tempDmg;
			_unitTrueIndex = _forEachIndex;
		};

	} forEach _dmgArray;

	_unitTrueDMGArray = _dmgArray select _unitTrueIndex;

	_unit = _unitTrueDMGArray select 0;
	_dmg  = _unitTrueDMGArray select 1;
	_loc  = _unitTrueDMGArray select 2;
	_proj = _unitTrueDMGArray select 3;

	if(doDiagLog == 1) then {
		diag_log format ["Selected Unit: BDMG: %1 | LOC: %2", _dmg, _loc];
	};

	_baseDmg = _dmg;

	_oldDamage = 0;

	switch(_loc)do{
	    case("head"):{_oldDamage = _unit getHitPointDamage "HitHead";};
	    case("body"):{_oldDamage = _unit getHitPointDamage "HitBody";};
	    case("hands"):{_oldDamage = _unit getHitPointDamage "HitHands";};
	    case("hand_1"):{_oldDamage = _unit getHitPointDamage "HitHands";};
	    case("hand_2"):{_oldDamage = _unit getHitPointDamage "HitHands";};
	    case("legs"):{_oldDamage = _unit getHitPointDamage "HitLegs";};
	    case("leg_1"):{_oldDamage = _unit getHitPointDamage "HitLegs";};
	    case("leg_2"):{_oldDamage = _unit getHitPointDamage "HitLegs";};
	    default{_oldDamage = damage _unit;};
	};

	switch(_loc)do{
	    case("head"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_headDmg;};
	    case("body"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_bodyDmg;};
	    case("hands"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_armsDmg;};
	    case("hand_1"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_armsDmg;};
	    case("hand_2"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_armsDmg;};
	    case("legs"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_legsDmg;};
	    case("leg_1"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_legsDmg;};
	    case("leg_2"):{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_legsDmg;};
	    default{_dmg = [_unit, _dmg, _oldDamage] call hells_fnc_baseDmg;};
	};

	_dmgT = _dmg;

	_dmg = _uDMG + _dmg;

	_dmgCSEArray = [0,0,0,0,0,0];
	[_unit, "cse_bodyPartStatus", _dmgCSEArray] call cse_fnc_setVariable;

	if(run_damage == 1) then {

		_unit setDamage _dmg;

		_unit setVariable ["HellsOldDmg", _dmg, true];

	};

	_unit setVariable ["HellsDmgDo", nil, false];

	if(doDiagLog == 1) then {

		_nDMG = 0;

		switch(_loc)do{
		    case("head"):{_nDMG = _unit getHitPointDamage "HitHead";};
		    case("body"):{_nDMG = _unit getHitPointDamage "HitBody";};
		    case("hands"):{_nDMG = _unit getHitPointDamage "HitHands";};
		    case("legs"):{_nDMG = _unit getHitPointDamage "HitLegs";};
		    default{_nDMG = damage _unit;};
		};

		sleep 0.5;

		_aDMG = damage _unit;

		_baseDmg = 		[_baseDmg, 1, 5] call CBA_fnc_formatNumber;
		_dmgT = 		[_dmgT, 1, 5] call CBA_fnc_formatNumber;
		_uDMG = 		[_uDMG, 1, 5] call CBA_fnc_formatNumber;
		_oldDamage = 	[_oldDamage, 1, 5] call CBA_fnc_formatNumber;

		diag_log format [
			"Unit: %1 | BaseDS: %2 | ModDS: %3 | UnitDB: %4  | OldDB: %5 | NewDS: %6 | ApplyDS: %7 | LOC: %8 | PROJ: %9",
			_unit,
			_baseDmg, 	//base dmg, the amount of original chosen damage
			_dmgT, 		//The amount of damage after applied to dmg mod
			_uDMG, 		//The damage to the unit before applied
			_oldDamage, //The old Damage to body part
			_nDMG, 		//The new damage to body part
			_aDMG, 		//The total applied damage to unit (after 500ms)
			_loc, 		//location
			_proj 		//projectile name
		];
	};
};

hells_fnc_headDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 0.25):{	_dm = _dm / 1.2;	};
		case(_dm < 0.5):{	_dm = _dm / 1.4;	};
		case(_dm < 0.9):{	_dm = _dm / 1.6;	};
	    case(_dm < 1):{	    _dm = _dm / 1.25;	};
	    case(_dm < 2):{		_dm = _dm / 1.5;	};
	    default{			_dm = _dm / 2;		};
	};

	_dm = _dm / 1.005;

	_dm

};

hells_fnc_bodyDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 0.25):{	_dm = _dm / 2;		};
		case(_dm < 0.5):{	_dm = _dm / 2.5;	};
		case(_dm < 0.9):{	_dm = _dm / 3;		};
	    case(_dm < 1):{	   	_dm = _dm / 2.75;	};
	    case(_dm < 2):{		_dm = _dm / 2.5;	};
		case(_dm < 3):{		_dm = _dm / 3;		};
		case(_dm < 4):{		_dm = _dm / 3.5;	};
	    default{			_dm = _dm / 2;		};
	};

	_dm = _dm / 1.01;

	_dm

};

hells_fnc_legsDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
	    case(_dm < 0.25):{	_dm = _dm / 2.5;	};
		case(_dm < 0.5):{	_dm = _dm / 2.25;	};
		case(_dm < 0.9):{	_dm = _dm / 2;		};
	    case(_dm < 1):{		_dm = _dm / 2.5;	};
	    case(_dm < 2):{		_dm = _dm / 3;		};
		case(_dm < 3):{		_dm = _dm / 3.5;	};
		case(_dm < 4):{		_dm = _dm / 4;		};
		case(_dm < 5):{		_dm = _dm / 4.5;	};
	    default{			_dm = _dm / 2;		};
	};

	_dm = _dm / 1.10;

	_dm

};

hells_fnc_armsDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 0.25):{ 	_dm = _dm / 3;		};
		case(_dm < 0.5):{	_dm = _dm / 2.75;	};
		case(_dm < 0.9):{	_dm = _dm / 2.5;	};
	    case(_dm < 1):{		_dm = _dm / 3;		};
	    case(_dm < 2):{		_dm = _dm / 3.5;	};
		case(_dm < 3):{		_dm = _dm / 4;		};
		case(_dm < 4):{		_dm = _dm / 4.5;	};
		case(_dm < 5):{		_dm = _dm / 5;		};
	    default{			_dm = _dm / 2;		};
	};

	_dm = _dm / 1.15;

	_dm

};

hells_fnc_baseDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

    switch(true)do{
		case(_dm < 0.25):{	_dm = _dm / 2;		};
		case(_dm < 0.5):{	_dm = _dm / 2.33;	};
		case(_dm < 0.9):{	_dm = _dm / 2.66;	};
	    case(_dm < 1):{		_dm = _dm / 3;		};
	    case(_dm < 2):{		_dm = _dm / 3.5;	};
		case(_dm < 3):{		_dm = _dm / 4;		};
		case(_dm < 4):{		_dm = _dm / 4.5;	};
		case(_dm < 5):{		_dm = _dm / 5;		};
	    default{			_dm = _dm / 2;		};
	};

	_dm = _dm / 1.015;

	_dm

};