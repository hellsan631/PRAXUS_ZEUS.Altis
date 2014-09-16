_unit = _this select 0;
_corpse = _this select 1;

if (local _unit) then {
	_corpse removeAction squad_mgmt_action;
	
	squad_mgmt_action = player addAction [
		("<t color='#04cc6b'>" + "Squad Management" + "</t>"), 
		Compile preprocessFileLineNumbers "DOM_squad\open_dialog.sqf", [], -80, false
	];
};

// Initialize
removeAllWeapons _unit;
removeBackpack _unit;
removeAllItems _unit;
removeUniform _unit;
removeVest _unit;
removeHeadgear _unit;
removeAllAssignedItems _unit;

// Uniform
_unit addUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrier1_rgr";
_unit addHeadgear "H_HelmetB";
	
// Items
_unit addWeapon "ItemMap";
_unit addWeapon "ItemRadio";
_unit addWeapon "ItemCompass";
_unit addWeapon "ItemWatch";	
