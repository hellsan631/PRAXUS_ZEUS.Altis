if (!(isDedicated)) then {
	waitUntil {!isNil "BIS_fnc_init";};
	waitUntil {!(isnull (findDisplay 46));};
};
waitUntil {!isNull player && player == player};

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'Scripts\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Scripts\set_loadout.sqf';
fn_arrayAppend = compile preprocessFileLineNumbers 'Scripts\fn_arrayAppend.sqf';

sleep 20;

["<t size='.6'>Loadout Saving Enabled</t>",0.02,0.3,7,1,0,3010] spawn bis_fnc_dynamicText;

[] spawn {

    while{true} do {

        if(alive player) then {

            _respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

			profileNamespace setVariable ["saveLoadout", _respawnLoadout];

        } else {

        	waitUntil {alive player};

        	sleep 5;

    	};

    	sleep 5;

    };
};

sleep 0.1;

player addMPEventHandler ["MPHit", {

		_respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", _respawnLoadout];

    }];

sleep 0.1;

player addMPEventHandler ["MPKilled", {

		_respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", _respawnLoadout];

    }];

sleep 0.1;

// Load saved loadout (including ammo count) on respawn
player addMPEventHandler ["MPRespawn", {

		_respawn = profileNamespace getVariable "saveLoadout";

		player enableFatigue false;

        [player, _respawn, ["ammo"]] spawn setLoadout;

        _respawn = profileNamespace getVariable "saveLoadout";

		player enableFatigue false;

        [player, _respawn, ["ammo"]] spawn setLoadout;

        saveProfileNamespace;

        _insignia = player call BIS_fnc_getUnitInsignia;

		if((isNil ("_insignia")) || (_insignia != "Praxus_insignia")) then {
			[player,"Praxus_insignia"] call BIS_fnc_setUnitInsignia;
		}

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

				_x addAction ["<t color='#ff0000'>Knife</t>", "hells_knife.sqf", [], 6, true, true, "", "((cursorTarget distance _this)<4)&&(alive cursorTarget)"];

			};

			if(isPlayer _x) then {

				player setfatigue 0;

				_insignia = player call BIS_fnc_getUnitInsignia;

				if((isNil ("_insignia")) || (_insignia != "Praxus_insignia")) then {
					[player,"Praxus_insignia"] call BIS_fnc_setUnitInsignia;
				}

			};


		} forEach (allUnits);

		sleep 4;

	};
};