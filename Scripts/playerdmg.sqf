_unit = _this select 0;
_dmg  = _this select 1;
_loc  = _this select 2;
_proj = _this select 3;

run_damage = 1;
do_damage = 1;
doDiagLog = 0;

if(doDiagLog == 1) then {
	diag_log format ["TestUnit: BDMG: %1 | LOC: %2 ", _dmg, _loc];
};

if(true) then {

	_dmgArray = _unit getVariable "HellsDMG";

	_HPB = _unit getVariable "HellsHP";
	_HC = _unit getVariable "HellsHits";
	_HPA = 0;

	if (isNil ("_HPB")) then {
		_unit setVariable ["HellsHP", 100 ,true];
		_HPB = 100;
	};

	if (isNil ("_HC")) then {
		_unit setVariable ["_HC", 0 ,true];
		_HC = 0;
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

			if(_tempDmg > _unitTrueDMG && ((_x select 2) != "?")) then {
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

		_uDMG = _dmg;

		if(isPlayer _unit) then{
			_dmg = (_dmg*15);
		} else {
			_dmg = (_dmg*15);
		};

		_nDMG = _dmg;

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

		if(run_damage == 1) then {

			if(do_damage == 1) then {

				if(_HC < 2) then{
					_dmg = (_dmg/4);
				};

				if(_HPB < 35) then{
					_HPA = _HPB - (_dmg);
					_unit setDamage 1 - (_HPA/100);
				} else {
					_HPA = _HPB - (_dmg);
				};

			}else {

				if(_HPB < _dmg) then{
					_HPA = 100;
				} else {
					_HPA = _HPB - _dmg;
				};

			};

			_HC = _HC + 1;
			_unit setVariable ["HellsHP", _HPA, true];
			_unit setVariable ["HellsHits", _HC, true];


		};

		_unit setVariable ["HellsDmgDo", nil, false];

		if(doDiagLog == 1) then {

			sleep 0.5;

			_aDMG = damage _unit;

			_baseDmg = 		[_baseDmg, 1, 5] call CBA_fnc_formatNumber;
			_dmgT = 		[_dmgT, 1, 5] call CBA_fnc_formatNumber;
			_uDMG = 		[_uDMG, 1, 5] call CBA_fnc_formatNumber;
			_nDMG = 		[_nDMG, 1, 5] call CBA_fnc_formatNumber;

			_HPA = [_HPA, 1, 5] call CBA_fnc_formatNumber;
			_HPB = [_HPB, 1, 5] call CBA_fnc_formatNumber;
			_dmg = [_dmg, 1, 5] call CBA_fnc_formatNumber;

			diag_log format [
				"Unit: %1 | BaseDS: %2 | ModDS: %3 | UnitDB: %4  | NewDS: %5 | ApplyDS: %6 | TDMG: %7 | HITS: %8 | HPB: %9 | HPA: %10 | LOC: %11 | PROJ: %12",
				_unit,
				_baseDmg, 	//base dmg, the amount of original chosen damage
				_dmgT, 		//The amount of damage after applied to dmg mod
				_uDMG, 		//The old dmg
				_nDMG, 		//The new dmg
				_aDMG, 		//The total applied damage to unit (after 500ms)
				_dmg, 		//True Damage
				_HC,		//Hit Count
				_HPB,		//HP Before
				_HPA,		//HP After
				_loc, 		//location
				_proj 		//projectile name
			];
		};
	};

};


hells_fnc_headDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 50):{	_dm = _dm / 1.15;	};
		case(_dm < 75):{	_dm = _dm / 1.2;	};
		case(_dm < 100):{	_dm = _dm / 1.25;	};
	    case(_dm < 150):{	_dm = _dm / 1.4;	};
	    case(_dm < 200):{	_dm = _dm / 1.5;	};
	    default{			_dm = _dm;			};
	};

	_dm = _dm * 1.1;

	_dm

};

hells_fnc_bodyDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 25):{	_dm = _dm / 1.2;	};
		case(_dm < 50):{	_dm = _dm / 1.25;	};
		case(_dm < 75):{	_dm = _dm / 1.3;	};
		case(_dm < 100):{	_dm = _dm / 1.3;	};
	    case(_dm < 150):{	_dm = _dm / 3;		};
	    case(_dm < 200):{	_dm = _dm / 3.5;	};
		case(_dm < 400):{	_dm = _dm / 4;		};
		case(_dm < 600):{	_dm = _dm / 6;		};
	    default{			_dm = _dm / 6;		};
	};

	_dm = _dm / 1.15;

	_dm

};

hells_fnc_legsDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 25):{	_dm = _dm / 1.2;	};
		case(_dm < 50):{	_dm = _dm / 1.25;	};
		case(_dm < 75):{	_dm = _dm / 1.3;	};
		case(_dm < 100):{	_dm = _dm / 1.3;	};
	    case(_dm < 150):{	_dm = _dm / 3;		};
	    case(_dm < 200):{	_dm = _dm / 3.5;	};
		case(_dm < 400):{	_dm = _dm / 4;		};
		case(_dm < 600):{	_dm = _dm / 6;		};
	    default{			_dm = _dm / 6;		};
	};

	_dm = _dm / 1.3;

	_dm

};

hells_fnc_armsDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

	switch(true)do{
		case(_dm < 25):{	_dm = _dm / 1.2;	};
		case(_dm < 50):{	_dm = _dm / 1.25;	};
		case(_dm < 75):{	_dm = _dm / 1.3;	};
		case(_dm < 100):{	_dm = _dm / 1.3;	};
	    case(_dm < 150):{	_dm = _dm / 3;		};
	    case(_dm < 200):{	_dm = _dm / 3.5;	};
		case(_dm < 400):{	_dm = _dm / 4;		};
		case(_dm < 600):{	_dm = _dm / 6;		};
	    default{			_dm = _dm / 6;		};
	};

	_dm = _dm / 1.5;

	_dm

};

hells_fnc_baseDmg = {

    private ["_dm", "_un", "_od"];

	_un = _this select 0; //unit
    _dm = _this select 1; //dmg
    _od = _this select 2; //old dmg

    switch(true)do{
		case(_dm < 25):{	_dm = _dm / 1.2;	};
		case(_dm < 50):{	_dm = _dm / 1.25;	};
		case(_dm < 75):{	_dm = _dm / 1.3;	};
		case(_dm < 100):{	_dm = _dm / 1.3;	};
	    case(_dm < 150):{	_dm = _dm / 3;		};
	    case(_dm < 200):{	_dm = _dm / 3.5;	};
		case(_dm < 400):{	_dm = _dm / 4;		};
		case(_dm < 600):{	_dm = _dm / 6;		};
	    default{			_dm = _dm / 6;		};
	};

	_dm = _dm / 1.015;

	_dm

};