if (!(isDedicated)) then {
    waitUntil {!isNil "BIS_fnc_init";};
    waitUntil {!(isnull (findDisplay 46));};
};

waitUntil {!isNull player && player == player};

sleep 5;

getLoadout = compile preprocessFileLineNumbers (functionLocation + 'battle_respawnLoadout\fn_getLoadout.sqf');
setLoadout = compile preprocessFileLineNumbers (functionLocation + 'battle_respawnLoadout\fn_setLoadout.sqf');

["<t size='.6'>Loadout Saving Enabled</t>",0.02,0.3,7,1,0,3010] spawn bis_fnc_dynamicText;

// Load saved loadout (including ammo count) on respawn
respawnLoadoutEH = player addMPEventHandler ["MPRespawn", {

    private ["_respawnLoadout"];

    _respawnLoadout = profileNamespace getVariable "saveLoadout";

    [player, _respawnLoadout, ["ammo"]] spawn setLoadout;

}];

//save loadout when a unit dies
killedLoadoutEH = player addMPEventHandler ["MPKilled", {

    private ["_respawnLoadout"];

    _respawnLoadout = [player,["ammo","repetitive"]] call getLoadout;

    profileNamespace setVariable ["saveLoadout", _respawnLoadout];

}];

