waitUntil {!isNull player};

// Compile scripts
getLoadout = compile preprocessFileLineNumbers 'Scripts\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'Scripts\set_loadout.sqf';

sleep 20;

["<t size='.6'>Loadout Saving Enabled</t>",0.02,0.3,7,1,0,3010] spawn bis_fnc_dynamicText;

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

player addEventHandler ["handledamage",{

 		player setdamage ((damage player) /1.015);

	}];

player addMPEventHandler ["MPHit", {

		player setDamage (0.02 + getDammage player);

		respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

		profileNamespace setVariable ["saveLoadout", respawnLoadout];

    }];

player addMPEventHandler ["MPKilled", {

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

				private ["knifeAction"];

				knifeAction = _x addAction ["<t color='#ff0000'>Knife</t>", fn_KnifeUnit, [], 5, true, true, "", "(_target == _this)&&((cursorTarget distance _this)<3)&&(alive cursorTarget)&&(side cursorTarget != side _this)&&(cursorTarget isKindOf 'Man')"];

				_x setVariable ["knifeAction", 1 ,knifeAction];

				_x addPrimaryWeaponItem "acc_flashlight";

				sleep 0.05;

				_x unassignItem "NVGoggles";
				_x removeItem "NVGoggles";

				sleep 0.02;

				_x unassignItem "NVGoggles_OPFOR";
				_x removeItem "NVGoggles_OPFOR";

				sleep 0.02;

				_x unassignItem "NVGoggles_INDEP";
				_x removeItem "NVGoggles_INDEP";

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

			}


		} forEach (allUnits);

		sleep 5;

	};
};

fn_KnifeUnit = {

	//private ["_caller"];
	private ["_unitToKnife"];

    _target = _this select 1;
	_unitToKnife = cursorTarget;

	if ((isNil "_unitToKnife") || (isNull _unitToKnife)) exitWith {false;};

	[_target] call fn_unitKnifeAnim;
	knife_unit = _target; publicVariable "fn_unitKnifeAnim";

	_unitToKnife setDamage 1;

	//_target say3D "knife_sound";

	knifeAction = _unitToKnife getVariable "knifeAction";

	_unitToKnife removeAction knifeAction;

};

fn_unitKnifeAnim = {

    private ["_unit"];

    _unit = _this select 0;

    if (local _unit) then {
        _unit SetUnitPos "UP";
        _unit playActionNow "gesturePoint";
        _unit disableAI "MOVE";
    };

};

"fn_unitKnifeAnim" addPublicVariableEventHandler {

    _unit = _this select 1;
    [_unit] call fn_unitKnifeAnim;

};
