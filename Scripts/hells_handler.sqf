waitUntil {!isNull player};

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'Scripts\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Scripts\set_loadout.sqf';

[] spawn {

    while{true} do {

        if(alive player) then {

            respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

			profileNamespace setVariable ["saveLoadout", respawnLoadout];

        } else {

        	waitUntil {alive player};

        	sleep 10;

    	};

    	sleep 5;

    };
};

player addMPEventHandler ["MPHit", {

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }
];

player addMPEventHandler ["MPKilled", {

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }
];

// Load saved loadout (including ammo count) on respawn
player addMPEventHandler ["MPRespawn", {

		respawnLoadout = profileNamespace getVariable "saveLoadout";

		sleep 5;

		player enableFatigue false;

        [player, respawnLoadout, ["ammo"]] spawn setLoadout;

    }
];

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

				sleep 0.05;

				_x enableGunLights "forceOn";

				_x setVariable ["HellsCustom", 1 ,true];


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