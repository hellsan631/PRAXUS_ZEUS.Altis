fn_dsl_CreateCamera =
{
	dsl_GlobalCam = "CAMERA" camCreate getPos player;
	sleep 0.01;
	showCinemaBorder false; [] spawn {sleep .5; showCinemaBorder false};

	dsl_GlobalCam cameraEffect ["Internal","Back"];
};


	private ["_camTarOffset","_camZoom"];
	call fn_dsl_CreateCamera;
	dsl_ShowingSelfCam = true;
	dsl_GlobalCam camSetTarget (player modelToWorld [0,0,1]);
	dsl_GlobalCam camSetPos (player modelToWorld [1,4,1.85]);
	dsl_GlobalCam camSetFOV .33;
	dsl_GlobalCam camSetFocus [50, 0];
	dsl_GlobalCam camCommit 0;

	dsl_SelfCam_FocusOn = "self";
	dsl_SelfCam_FrontOrBack = 0; // 0 for front, 1 for back

	if (primaryWeapon player == "") then {player playMove "amovpercmstpsnonwnondnon"} else {
	player playMove "amovpercmstpslowwrfldnon"; };

	_inc = 0;
	_pdir = getDir player;
	//_inc = _pdir;

	[] spawn
	{
		private ["_camZoom","_camtarOffset","_camComTime"];
		// handle focus/fov independent of below


		waitUntil
		{
			switch (dsl_SelfCam_FocusOn) do
			{
				case "self": {_camTarOffset = [0,0,1]; 				_camZoom = .33; dsl_SelfCam_FrontOrBack = 0;	_camComTime = .35};
				case "self_back": {_camTarOffset = [0,-.15,1.3]; 	_camZoom = .33; dsl_SelfCam_FrontOrBack = 1;	_camComTime = .35};
			};
			dsl_GlobalCam camSetTarget (player modelToWorld _camTarOffset);
			dsl_GlobalCam camSetFOV _camZoom;
			dsl_GlobalCam camCommit _camComTime;
			!dsl_ShowingSelfCam
		};
	};

	waitUntil
	{
		private ["_focusCheck","_focusCheckOriginal","_leftRight","_noExtraSleep"];

		_delayTime = 0;
		_distance = 0;

		_modDir = 0;

		_focusCheck = dsl_SelfCam_FocusOn;
		_focusCheckOriginal = _focusCheck;
		_extraSleep = true;

		// simple set camera positions that are known-good and relative to the player
		if (_inc > 4) then {_inc = 0};
		if (_inc == 0) then {_modDir = (_pdir + 10) + (180 * dsl_SelfCam_FrontOrBack); _delayTime = 5; _distance = 1;};
		if (_inc == 1) then {_modDir = (_pdir + 20) + (180 * dsl_SelfCam_FrontOrBack); _delayTime = 5; _distance = .45;};
		if (_inc == 2) then {_modDir = (_pdir + 30) + (180 * dsl_SelfCam_FrontOrBack); if (dsl_SelfCam_FocusOn == "weapon") then {_modDir = (_pdir + 10)}; _delayTime = 2; _distance = .45;};
		if (_inc == 3) then {_modDir = (_pdir - 20) + (180 * dsl_SelfCam_FrontOrBack); _delayTime = 5;_distance = .45;};
		if (_inc == 4) then {_modDir = (_pdir - 20) + (180 * dsl_SelfCam_FrontOrBack);  if (dsl_SelfCam_FocusOn == "weapon") then {_modDir = (_pdir - 10)}; _delayTime = 2;_distance = .45;};
		_inc = _inc + 1;

		_relPos = [player, 3 + _distance, _modDir] call BIS_fnc_relPos;

		dsl_GlobalCam camSetPos [_relPos select 0, _relpos select 1, 1.5];
		dsl_GlobalCam camCommit 3;

		for "_i" from 0 to 30 do
		{
			if (_focusCheck != dsl_SelfCam_FocusOn) then {_extraSleep = false}
			else {sleep .1; _focusCheck = dsl_SelfCam_FocusOn;};
			if (!dsl_ShowingSelfCam) exitWith {};
		};

		if (_extraSleep) then
		{
			for "_i" from 0 to 30 do
			{
				if (_focusCheck != _focusCheckOriginal) then {_extraSleep = false}
				else {sleep .1; _focusCheck = dsl_SelfCam_FocusOn;};
				if (!dsl_ShowingSelfCam) exitWith {};
			};
		};

		!dsl_ShowingSelfCam
	};
