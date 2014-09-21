_unit = _this select 0;
_songid = _this select 1;

if(!isServer) then {
	sleep floor(random 5);
};

publicVariable "playing";

if (isNil ("playing")) then {
	playing = 0;
	publicVariable "playing";
};

if((playing == 0) || (playing == "0")) then {
	_wait = [[_unit, _songid], "tac_fnc_musicCore"] spawn tac_fnc_GlobalExec;

	playing = 1;

	publicVariable "playing";

	sleep (_wait);

	playing = 0;

	publicVariable "playing";
}
