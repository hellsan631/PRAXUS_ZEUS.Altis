private ["_unit", "_damage", "_location", "_projectile", "_HPBefore", "_HP", "_HitCount", "_oldDamage", "_chance", "_headShotSound"];

_unit 			= _this select 0;
_damage  		= _this select 1;
_location  		= _this select 2;
_projectile 	= _this select 3;

_HPBefore = _unit getVariable "BATTLE_UnitHP";
_HitCount = _unit getVariable "BATTLE_UnitHitCount";

_unit setVariable ["BATTLE_damageArray" , nil, true];

if (isNil ("_HPBefore")) then {
	_HPBefore = BATTLE_DAMAGE_HP_PLAYER;
};

if (isNil ("_HitCount")) then {
	_HitCount = 0;
};

if(_damage < 1) then {
	_damage = _damage*10;
};

if(isPlayer _unit) then {
	_damage = _damage*BATTLE_DAMAGE_MULTIPLIER_PLAYER;
} else {
	_damage = _damage*BATTLE_DAMAGE_MULTIPLIER_AI;
};

call {
	if (_location == "head") 	exitWith {	_damage = [_damage] call battle_fnc_hitHead;};
	if (_location == "body") 	exitWith {	_damage = [_damage] call battle_fnc_hitBody;};
	if (_location == "hands") 	exitWith {	_damage = [_damage] call battle_fnc_hitArms;};
	if (_location == "hand_1") 	exitWith {	_damage = [_damage] call battle_fnc_hitArms;};
	if (_location == "hand_2") 	exitWith {	_damage = [_damage] call battle_fnc_hitArms;};
	if (_location == "legs") 	exitWith {	_damage = [_damage] call battle_fnc_hitLegs;};
	if (_location == "leg_1")	exitWith {	_damage = [_damage] call battle_fnc_hitLegs;};
	if (_location == "leg_2") 	exitWith {	_damage = [_damage] call battle_fnc_hitLegs;};

	_damage = [_damage] call battle_fnc_hitBase;
};

_chance = Ceil random 100;

if(isPlayer _unit) then {
	if(_chance < BATTLE_DAMAGE_MISS_PLAYER) then {
		_damage = 0;
	};
} else {
	if(_chance < BATTLE_DAMAGE_MISS_AI) then {
		_damage = 0;
	};
};

if(BATTLE_DAMAGE_HITCURVE_PLAYER == 1 && (isPlayer _unit)) then {
	if(_HitCount < 1) then{
		_damage = (_damage/16);
	};

	if(_HitCount < 3) then{
		_damage = (_damage/8);
	};

	if(_HitCount < 6) then{
		_damage = (_damage/4);
	};
};

if(BATTLE_DAMAGE_HEADSHOTSOUND == 1) then {
	if(_location == "head" && (_HPBefore - (_damage/10)) < 0) then {
		_headShotSound = soundLocation + "headshot.ogg";
		playSound3D [_headShotSound, _unit, false, getPosATL _unit, 16, 1, 120];
	};
};


if(_HPBefore < BATTLE_DAMAGE_AGMHPENABLE) then{
	_damage = (_damage/10);
	_HP = _HPBefore - _damage;
	_unit setDamage 1 - (_HP/100);
} else {
	[_unit] call battle_fnc_damageReset;
	_HP = _HPBefore - (_damage);
};

_HitCount = _HitCount + 1;
_unit setVariable ["BATTLE_UnitHP", _HP, true];
_unit setVariable ["BATTLE_UnitHitCount", _HitCount, true];