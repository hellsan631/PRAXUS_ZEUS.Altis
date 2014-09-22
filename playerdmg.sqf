_unit = _this select 0;
_dmg  = _this select 1;
_loc  = _this select 2;
_proj = _this select 3;

sleep 0.1;

run_damage = 0;

_baseDmg = _dmg;

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

if(run_damage == 1) then {

	_unit setdamage _dmg;

};

_Stxt = parseText format
   ["<t color='#ffffff'>Unit: </t><t color='#ffffff'>%1</t><br/>
   <t color='#ffffff'>BDMG: </t><t color='#FFFFFF'>%2</t><br/>
   <t color='#ffffff'>ADMG: </t><t color='#FFFFFF'>%3</t><br/>
   <t color='#ffffff'>LOC: </t><t color='#FFFFFF'>%4</t><br/>
   <t color='#ffffff'>PROJ: </t><t color='#CCCCCC'>%5</t><br/>",
   _unit,
   _baseDmg,
   _dmg,
   _loc,
   _proj];

hintsilent _Stxt;

