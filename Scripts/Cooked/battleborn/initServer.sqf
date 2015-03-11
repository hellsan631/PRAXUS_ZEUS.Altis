////////////////////////////////////////
//////  BattleBorn Framework  //////////
////////////////////////////////////////

if (!isServer) exitWith {};

if (BATTLE_REMOVENVG_AI == 1 || BATTLE_FORCEFLASHLIGHTUSE_AI == 1) then {
	[] execVM functionLocation + "battle_removeNVG.sqf";
};
