////////////////////////////////////////
//////  BattleBorn Framework  //////////
////////////////////////////////////////

waitUntil {!isNull player};

fn_arrayAppend = compile preprocessFileLineNumbers functionLocation + 'compiled\fn_arrayAppend.sqf';

player addRating 20000;

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

