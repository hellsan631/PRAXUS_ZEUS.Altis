_unit = _this select 0;
_dmg  = _this select 1;
_loc  = _this select 2;
_proj = _this select 3;

run_damage = 0;
doDiagLog = 1;

_dmgArray = _unit getVariable "HellsDMG";

if (isNil ("_dmgArray")) then {
	_dmgArray = [[_unit, _dmg, _loc, _proj]];
} else {
	_dmgArray = [_dmgArray,[[_unit, _dmg, _loc, _proj]]] call fn_arrayAppend;
};

if(count _dmgArray > 6) then {

	_unit setVariable ["HellsDMG" , nil];

	_unitTrueDMG = 0;
	_unitTrueIndex = 0;

	{
		_tempDmg =  _x select 1;

		if(doDiagLog == 1) then {
			diag_log format ["TestUnit: BDMG: %1 | LOC: %2", _tempDmg, _x select 2];
		};

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
	_uDMG = getDammage _unit;

	 _oldDamage = 0;

	switch(_loc)do{
	    case("head"):{_oldDamage = _unit getHitPointDamage "HitHead";};
	    case("body"):{_oldDamage = _unit getHitPointDamage "HitBody";};
	    case("hands"):{_oldDamage = _unit getHitPointDamage "HitHands";};
	    case("legs"):{_oldDamage = _unit getHitPointDamage "HitLegs";};
	    case(""):{_oldDamage = damage _unit;};
	    default{};
	};

	switch(_loc)do{
	    case("head"):{

				_unit setHitPointDamage ["hitHead",(_oldDamage + (_dmg/4))];

	    		switch(true)do{
				    case(_dmg < 1):{
				    	_dmg = _dmg / 1.005;
					};
				    case(_dmg < 2):{
					    _dmg = _dmg / 1.5;
					};
				    default{};
				};

			};
	    case("body"):{

				_unit setHitPointDamage ["hitBody",(_oldDamage + (_dmg/5))];

	    		switch(true)do{
				    case(_dmg < 1):{
				    	_dmg = _dmg / 4;
					};
				    case(_dmg < 2):{
					    _dmg = _dmg / 4.5;
					};
					case(_dmg < 3):{
					    _dmg = _dmg / 5;
					};
					case(_dmg < 4):{
					    _dmg = _dmg / 5.5;
					};
				    default{};
				};

	    	};
	    case("hands"):{

				_unit setHitPointDamage ["hitHands",(_oldDamage + (_dmg/6))];

	    		switch(true)do{
				    case(_dmg < 1):{
				    	_dmg = _dmg / 6;
					};
				    case(_dmg < 2):{
					    _dmg = _dmg / 6.5;
					};
					case(_dmg < 3):{
					    _dmg = _dmg / 7;
					};
					case(_dmg < 4):{
					    _dmg = _dmg / 7.5;
					};
					case(_dmg < 5):{
					    _dmg = _dmg / 8;
					};
				    default{};
				};

			};
	    case("legs"):{

				_unit setHitPointDamage ["hitHands",(_oldDamage + (_dmg/5))];

	    		switch(true)do{
				    case(_dmg < 1):{
				    	_dmg = _dmg / 5;
					};
				    case(_dmg < 2):{
					    _dmg = _dmg / 5.5;
					};
					case(_dmg < 3):{
					    _dmg = _dmg / 6;
					};
					case(_dmg < 4):{
					    _dmg = _dmg / 6.5;
					};
					case(_dmg < 5):{
					    _dmg = _dmg / 7;
					};
				    default{};
				};

			};
	    case(""):{

	    		switch(true)do{
				    case(_dmg < 1):{
				    	_dmg = _dmg / 5;
					};
				    case(_dmg < 2):{
					    _dmg = _dmg / 5.5;
					};
					case(_dmg < 3):{
					    _dmg = _dmg / 6;
					};
					case(_dmg < 4):{
					    _dmg = _dmg / 6.5;
					};
					case(_dmg < 5):{
					    _dmg = _dmg / 7;
					};
				    default{};
				};

			};
	    default{};
	};

	_dmgT = _dmg;

	_dmg = _uDMG + _dmg;

	if(run_damage == 1) then {

		_unit setdamage _dmg;

	};

	if(doDiagLog == 1) then {

		_nDMG = 0;

		switch(_loc)do{
		    case("head"):{_nDMG = _unit getHitPointDamage "HitHead";};
		    case("body"):{_nDMG = _unit getHitPointDamage "HitBody";};
		    case("hands"):{_nDMG = _unit getHitPointDamage "HitHands";};
		    case("legs"):{_nDMG = _unit getHitPointDamage "HitLegs";};
		    case(""):{_nDMG = damage _unit;};
		    default{};
		};

		sleep 0.5;

		_aDMG = damage _unit;

		_baseDmg = [_baseDmg, 1, 5] call CBA_fnc_formatNumber;
		_dmgT = [_dmgT, 1, 5] call CBA_fnc_formatNumber;
		_uDMG = [_uDMG, 1, 5] call CBA_fnc_formatNumber;
		_oldDamage = [_oldDamage, 1, 5] call CBA_fnc_formatNumber;

		diag_log format [
			"Unit: %1 | BaseDS: %2 | ModDS: %3 | UnitDB: %4  | OldDB: %5 | NewDS: %6 | ApplyDS: %7 | LOC: %7 | PROJ: %8",
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

} else {

	_unit setVariable ["HellsDMG", _dmgArray, false];

};