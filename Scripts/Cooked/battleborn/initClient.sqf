////////////////////////////////////////
//////  BattleBorn Framework  //////////
////////////////////////////////////////

waitUntil {!isNull player};

player addRating 20000; //Fix that AI doesn't attack players when they kill friendly units so quickly.

if (BATTLE_DAMAGE_MODENABLE == 1) then {

	[] execVM functionLocation + "battle_handleDamage.sqf";

	player addEventHandler ["HandleRating", {

		[
			[
				["Enemy Killed", "align = 'center' size = '0.7' shadow = '1' size = '0.7'"]
			]
		] spawn bis_fnc_typeText2;

	}];

};

if (BATTLE_SAVERESPAWNLOADOUT == 1) then {
	getLoadout = compile preprocessFileLineNumbers functionLocation + 'battle_respawnLoadout\get_loadout.sqf';
	setLoadout = compile preprocessFileLineNumbers functionLocation + 'battle_respawnLoadout\set_loadout.sqf';

	[] execVM functionLocation + "battle_respawnLoadout.sqf";
};

if (BATTLE_INSIGNIA == 1) then {
	[] execVM functionLocation + "battle_insignia.sqf";
};

if (BATTLE_KNIFE == 1) then {
	[] execVM functionLocation + "battle_knife.sqf";
};

if (BATTLE_NV_MODENABLE == 1) then {
	[] execVM functionLocation + "battle_nvgEffects.sqf";
};

if (BATTLE_FATIGUE == 1) then {
	[] execVM functionLocation + "battle_fatigue.sqf";
};

if (BATTLE_KNIFE == 1) then {
	[] execVM functionLocation + "battle_knife.sqf";
};

if (BATTLE_DELETERESPAWNCORPSE == 1) then {
	[] execVM functionLocation + "battle_deleteCorpse.sqf";
};

if (BATTLE_FLIPVEHICLE == 1) then {
	[] execVM functionLocation + "battle_flipAction.sqf";
};