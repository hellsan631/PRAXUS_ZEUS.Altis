if (!(isDedicated)) then {
	waitUntil {!isNil "BIS_fnc_init";};
	waitUntil {!(isnull (findDisplay 46));};
};

waitUntil {!isNull player && player == player};

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'Scripts\Funcs\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Scripts\Funcs\set_loadout.sqf';
fn_arrayAppend = compile preprocessFileLineNumbers 'Scripts\Funcs\fn_arrayAppend.sqf';

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

    	sleep 20;

    };
};

sleep 0.1;

// Load saved loadout (including ammo count) on respawn
player addMPEventHandler ["MPRespawn", {

        _respawn = profileNamespace getVariable "saveLoadout";

        [player, _respawn, ["ammo"]] spawn setLoadout;

        player setVariable ["HellsHP", 100 ,true];
        player setVariable ["HellsHits", 0 ,true];

        _insignia = player call BIS_fnc_getUnitInsignia;

		[player,"Praxus_insignia"] call BIS_fnc_setUnitInsignia;

		player setVariable ["AGM_AllowUnconscious", false];

		player addAction ["<t color='#ff0000'>Knife</t>", "Scripts\hells_knife.sqf", [], 6, true, true, "", "((cursorTarget distance _this)<4)&&(alive cursorTarget)"];

        _this spawn FNC_Del_Corpse;

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
				_x setVariable ["HellsCustom", 1 ,true];
				_x setVariable ["HellsHP", 100 ,true];
				_x setVariable ["HellsHits", 0 ,true];
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

			if((isPlayer _x) && (_CheckVariable == 0)) then {

				_x addAction ["<t color='#ff0000'>Knife</t>", "Scripts\hells_knife.sqf", [], 6, true, true, "", "((cursorTarget distance _this)<4)&&(alive cursorTarget)"];

			};

			if(isPlayer _x) then {

				player setfatigue 0;

				[player,"Praxus_insignia"] call BIS_fnc_setUnitInsignia;

			};


		} forEach (allUnits);

		sleep 4;

	};
};

FNC_Del_Corpse = {

    _unit = _this select 1;
    _pos = getPos _unit;
    _xpos = _pos select 0;
    _ypos = _pos select 1;
    _zpos = _pos select 2;

    sleep 0.3;

    for "_i" from 0 to 3 do {

        _xvel = 0;
        _yvel = 0;
        _zvel = 0;
        _tnt = 0;

        drop[
    		["A3\Data_F\ParticleEffects\Universal\universal.p3d",16,7,48],
    		"","Billboard",0,1 + random 0.5,[_xpos,_ypos,_zpos],
	        [_xvel,_yvel,_zvel],1,1.2,1.3,0,[2],[
	        	[0.55,0.5,0.45,0],[_tnt + 0.55,_tnt + 0.5,_tnt + 0.45,0.16],
	        	[_tnt + 0.55,_tnt + 0.5,_tnt + 0.45, 0.12],[_tnt + 0.5,_tnt + 0.45,_tnt + 0.4,0.08],
	        	[_tnt + 0.45,_tnt + 0.4,_tnt + 0.35,0.04],[_tnt + 0.4,_tnt + 0.35,_tnt + 0.3,0.01]
	        ],
	        [0],0.1,0.1,"","",""
        ];
    };

    deleteVehicle _unit;

};