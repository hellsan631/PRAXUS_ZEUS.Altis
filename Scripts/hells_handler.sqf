sleep 0.1;

[] spawn {

	while {true} do {

		sleep 1;

		{

			private ["_CheckVariable"];
			_CheckVariable = _x getVariable "HellsCustom";

			if (isNil ("_CheckVariable")) then {
				_CheckVariable = 0;
				_x setVariable ["HellsCustom", 1 ,true];
				_x setVariable ["HellsHP", 100 ,true];
				_x setVariable ["HellsHits", 0 ,true];
				_x setVariable ["HellsIsUnitDown", 0, true];
				_x setVariable ["HellsIsUnitStable", 0, true];
			};

			if(!(isplayer _x) && (_CheckVariable == 0)) then {

				_x unlinkItem "NVGoggles";
				_x unlinkItem "NVGoggles_OPFOR";
				_x unlinkItem "NVGoggles_INDEP";

				sleep 0.05;

				_x addPrimaryWeaponItem "acc_flashlight";

				sleep 0.1;

				_x enableGunLights "forceOn";

				_x setVariable ["AGM_AllowUnconscious", false];

			};

		} forEach (allUnits);

		sleep 4;

	};
};
