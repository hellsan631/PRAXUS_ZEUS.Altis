waitUntil {!isNull player && player == player};

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'Scripts\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Scripts\set_loadout.sqf';

sleep 20;

["<t size='.6'>Loadout Saving Enabled</t>",0.02,0.3,7,1,0,3010] spawn bis_fnc_dynamicText;

if (!(isDedicated)) then {
	waitUntil {!isNil "BIS_fnc_init";};
	waitUntil {!(isnull (findDisplay 46));};
};

[] spawn {

    while{true} do {

        if(alive player) then {

            respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

			profileNamespace setVariable ["saveLoadout", respawnLoadout];

        } else {

        	waitUntil {alive player};

        	sleep 5;

    	};

    	sleep 5;

    };
};

sleep 0.1;

player addEventHandler ["handledamage",{

		sleep 0.1;

		lesshp = getDammage player;

		if(lesshp < 0.25) then {

			lesshp = lesshp / 1.005; //reduce by a small bit

		} else {
			if (lesshp < 0.6) then { //if hp is in between 75% and 40%

				lesshp = lesshp / 1.08; //reduce by about 4-5 pts

			} else {
				if (lesshp < 0.9) then {

					lesshp = lesshp / 1.10; //reduce by about 8-9

				} else {

					if (lesshp <= 1) then {

						//deadsies

					};
				};
			};
		};

 		player setdamage lesshp;

	}];

sleep 0.1;

player addMPEventHandler ["MPHit", {

		sleep 0.1;

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }];

sleep 0.1;

player addMPEventHandler ["MPKilled", {

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }];

sleep 0.1;

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

        saveProfileNamespace;

    }];

sleep 0.1;

[] spawn {

	while {true} do {

		sleep 1;

		{

			private ["_CheckVariable"];
			_CheckVariable = _x getVariable "HellsCustom";

			if (isNil ("_CheckVariable")) then {
				_CheckVariable = 0;
			};

			if(!(isplayer _x) && (_CheckVariable == 0)) then {

				_x unlinkItem "NVGoggles";
				_x unlinkItem "NVGoggles_OPFOR";
				_x unlinkItem "NVGoggles_INDEP";

				sleep 0.05;

				_x addPrimaryWeaponItem "acc_flashlight";

				sleep 0.1;

				_x enableGunLights "forceOn";

				_x setVariable ["HellsCustom", 1 ,true];


			};

			if((isPlayer _x) && (_CheckVariable == 0)) then {

				_x setVariable ["HellsCustom",1,true];

				_x enableFatigue false;

			};

			if(isPlayer _x) then {

				player setfatigue 0;

			};

			if(_CheckVariable == 0) then {

				_x addAction ["<t color='#ff0000'>Knife</t>", "hells_knife.sqf", [], 6, true, true, "", "(_target == _this)&&((cursorTarget distance _this)<4)&&(alive cursorTarget)&&(side cursorTarget != side _this)&&(cursorTarget isKindOf 'Man')"];

			};

		} forEach (allUnits);

		sleep 4;

	};
};



