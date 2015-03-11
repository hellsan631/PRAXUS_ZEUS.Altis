if (!(isDedicated)) then {
	waitUntil {!isNil "BIS_fnc_init";};
	waitUntil {!(isnull (findDisplay 46));};
};

waitUntil {!isNull player && player == player};

(_this select 0) addAction ["Flip Vehicle", "Scripts\FlipAction.sqf", [], 0, false, true, "", "_this == vehicle _target"];