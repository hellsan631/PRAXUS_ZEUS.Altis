private ["_unit", "_damage", "_location", "_projectile"];

_unit 			= _this select 0;
_damage  		= _this select 1;
_location  		= _this select 2;
_projectile 	= _this select 3;

_unit setVariable ["BATTLE_runDamage" , nil];