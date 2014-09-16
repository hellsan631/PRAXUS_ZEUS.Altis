waitUntil {!isNull player};

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'Scripts\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Scripts\set_loadout.sqf';

sleep 30;

systemChat "Loadout Saving Enabled";

[] spawn {

    while{true} do {

        if(alive player) then {

            respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

			profileNamespace setVariable ["saveLoadout", respawnLoadout];

			//systemChat "save";

        } else {

        	waitUntil {alive player};

        	sleep 5;

    	};

    	sleep 5;

    };
};

player addEventHandler ["handledamage",{

 		player setdamage ((damage player) /1.015);

	}];

player addMPEventHandler ["MPHit", {

		player setDamage (0.02 + getDammage player);

		//systemChat "hit";

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }];

player addMPEventHandler ["MPKilled", {

		//systemChat "dead";

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }];

// Load saved loadout (including ammo count) on respawn
player addMPEventHandler ["MPRespawn", {

		respawn = profileNamespace getVariable "saveLoadout";

		sleep 5;

		player enableFatigue false;

        [player, respawn, ["ammo"]] spawn setLoadout;

        sleep 5;

        respawn = profileNamespace getVariable "saveLoadout";

		player enableFatigue false;

        [player, respawn, ["ammo"]] spawn setLoadout;


    }];

[] spawn {

	while {true} do {

		sleep 0.25;

		{

			private ["_CheckVariable"];
			_CheckVariable = _x getVariable "HellsCustom";

			if (isNil ("_CheckVariable")) then {
				_CheckVariable = 0;
			};

			if(!(isplayer _x) && (_CheckVariable == 0)) then {

				_x addPrimaryWeaponItem "acc_flashlight";
				_x unassignItem "NVGoggles";
				_x removeItem "NVGoggles";
				_x unassignItem "NVGoggles_OPFOR";
				_x removeItem "NVGoggles_OPFOR";
				_x unassignItem "NVGoggles_INDEP";
				_x removeItem "NVGoggles_INDEP";

				sleep 0.1;

				_x enableGunLights "forceOn";

				_x setVariable ["HellsCustom", 1 ,true];

 				knifeAction = _x addAction ["Knife", hell_fnc_KnifeUnit, [], 5, true, true, "", "(_target == _this)&&((cursorTarget distance _this)<2)&&(alive cursorTarget)&&(side cursorTarget != side _this)&&(cursorTarget isKindOf 'Man')"];

 				_x setVariable ["knifeAction", 1 ,knifeAction];


			};

			if((isPlayer _x) && (_CheckVariable == 0)) then {

				_x setVariable ["HellsCustom",1,true];

				_x enableFatigue false;

			};

			if(isPlayer _x) then {

				_x setfatigue 0;

			}


		} forEach (allUnits);

		sleep 5;

	};
};

hell_fnc_KnifeUnit = {
	_caller = player;
	_unitToKnife = cursorTarget;

	if (isNil "_unitToKnife" or {isNull _unitToKnife}) exitWith {false};

	systemChat "Knife";

	_unitToKnife setDamage 1;

	knifeAction = _unitToKnife getVariable "knifeAction";

	_unitToKnife removeAction knifeAction;

};