_unit = _this select 0;
_songid = _this select 1;

if(_playing == 0) then {
	_wait = [[_unit, _songid], "tac_fnc_musicCore"] spawn tac_fnc_GlobalExec;

	if(_wait == 0) then {
		diag_log ["tac_music_core - _wait", _wait];
	}

	_playing = 1;

	sleep (_wait);

	_playing = 0;
}
