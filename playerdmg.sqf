_unit = _this select 0;
_dmg  = _this select 1;
_loc  = _this select 2;
_proj = _this select 3;

["<t size='.6'>Hit " + _loc + "</t>",0.02,0.3,0.8,1,0,3010] spawn bis_fnc_dynamicText;

sleep 0.1;

if(_dmg < 0.25) then {

	_dmg = _dmg / 1.005; //reduce by a small bit

} else {
	if (_dmg < 0.6) then { //if hp is in between 75% and 40%

		_dmg = _dmg / 1.08; //reduce by about 4-5 pts

	} else {
		if (_dmg < 0.9) then { //if HP is between 40% and 10%

			_dmg = _dmg / 1.10; //reduce by about 8-9

		} else {

			if (_dmg <= 1) then {

				//deadsies

			};
		};
	};
};

_unit setdamage _dmg;
