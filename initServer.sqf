//--- Respawn inventory settings

//--- Curator settings
_curator = allcurators select 0;
_curators = allcurators;

_curator addcuratoraddons [
	"A3_Misc_F_Helpers",
	"A3_Structures_F_Civ_Accessories",
	"A3_Structures_F_Civ_Camping",
	"A3_Structures_F_Civ_Constructions",
	"A3_Structures_F_Civ_Garbage",
	"A3_Structures_F_Civ_InfoBoards",
	"A3_Structures_F_Civ_Market",
	"A3_Structures_F_Furniture",
	"A3_Structures_F_Ind_Cargo",
	"A3_Structures_F_Items_Electronics",
	"A3_Structures_F_Items_Cans",
	"A3_Structures_F_Items_Luggage",
	"A3_Structures_F_Items_Vessels",
	"A3_Structures_F_Mil_BagFence",
	"A3_Structures_F_EPA_Civ_Camping",
	"A3_Structures_F_EPA_Civ_Constructions",
	"A3_Structures_F_EPA_Items_Food",
	"A3_Structures_F_EPA_Items_Medical",
	"A3_Structures_F_EPA_Items_Tools",
	"A3_Signs_F",
	"A3_Signs_F_AD",
	"A3_Structures_F_Wrecks",
	"A3_Weapons_F_Ammoboxes",
	"A3_Weapons_F_NATO",
	"A3_Weapons_F_CSAT",
	"A3_Weapons_F_AAF",
	"A3_weapons_F_FIA",
	"A3_Weapons_F_ItemHolders",
	"A3_Weapons_F_Headgear",
	"A3_Weapons_F_Vests",
	"A3_Weapons_F_EPA_Ammoboxes",
	"A3_Weapons_F_EPB_Ammoboxes",
	"A3_Data_F_Curator_Intel",

	"A3_Characters_F_BLUFOR",
	"A3_Characters_F_Civil",
	"A3_Characters_F_OPFOR",
	"A3_Characters_F_Beta",
	"A3_Characters_F_INDEP",
	"A3_Characters_F_Gamma",
	"A3_UAV_F_Characters_F_Gamma",
	"A3_Characters_F_Common",
	"A3_Static_F_Mortar_01",
	"A3_Static_F_Beta_Mortar_01",
	"A3_Static_F_Gamma",

	"A3_Soft_F_MRAP_01",
	"A3_Soft_F_MRAP_02",
	"A3_Soft_F_Offroad_01",
	"A3_Soft_F_Quadbike",
	"A3_Soft_F_MRAP_03",
	"A3_Soft_F_HEMTT",
	"A3_Soft_F_TruckHeavy",
	"A3_Soft_F_Car",
	"A3_Soft_F_Gamma_Offroad",
	"A3_Soft_F_SUV",
	"A3_Soft_F_Gamma_HEMTT",
	"A3_Soft_F_Gamma_TruckHeavy",
	"A3_Soft_F_Truck",

	//--- Weapons (ammo boxes are reading curator addons)
	"A3_Characters_F",
	"A3_Weapons_F_EBR",
	"A3_Weapons_F_EPA_EBR",
	"A3_Weapons_F_EPA_LongRangeRifles_DMR_01",
	"A3_Weapons_F_EPA_LongRangeRifles_GM6",
	"A3_Weapons_F_EPB_LongRangeRifles_GM3",
	"A3_Weapons_F_EPB_LongRangeRifles_M320",
	"A3_Weapons_F_Explosives",
	"A3_Weapons_F_Items",
	"A3_Weapons_F_Launchers_LAW",
	"A3_Weapons_F_Launchers_NLAW",
	"A3_Weapons_F_Launchers_Titan",
	"A3_Weapons_F_LongRangeRifles_GM6",
	"A3_Weapons_F_LongRangeRifles_M320",
	"A3_Weapons_F_Machineguns_M200",
	"A3_Weapons_F_Machineguns_Zafir",
	"A3_Weapons_F_Pistols_ACPC2",
	"A3_Weapons_F_Pistols_P07",
	"A3_Weapons_F_Pistols_PDW2000",
	"A3_Weapons_F_Pistols_Pistol_heavy_01",
	"A3_Weapons_F_Pistols_Pistol_heavy_02",
	"A3_Weapons_F_Pistols_Rook40",
	"A3_Weapons_F_Rifles_Mk20",
	"A3_Weapons_F_Rifles_MX",
	"A3_Weapons_F_Rifles_SDAR",
	"A3_weapons_f_rifles_SMG_02",
	"A3_Weapons_F_Rifles_TRG20",
	"A3_Weapons_F_Rifles_Vector",
	"A3_Weapons_F",
	"A3_Weapons_F_Acc",

	"A3_Modules_F_Effects",
	"A3_Modules_F_Events",
	"A3_Modules_F_Intel",
	"A3_Modules_F_Curator_Animals",
	"A3_Modules_F_Curator_Effects",
	"A3_Modules_F_Curator_Environment",
	"A3_Modules_F_Curator_Flares",
	"A3_Modules_F_Curator_Chemlights",
	"A3_Modules_F_Curator_Intel",
	"A3_Modules_F_Curator_Lightning",
	"A3_Modules_F_Curator_Mines",
	"A3_Modules_F_Curator_Misc",
	"A3_Modules_F_Curator_Multiplayer",
	"A3_Modules_F_Curator_Objectives",
	"A3_Modules_F_Curator_Ordnance",
	"A3_Modules_F_Curator_Respawn",
	"A3_Modules_F_Curator_Smokeshells"
];

_rewardsEmpty = [
	[
		{
			_curator addcuratoraddons [
				"A3_Structures_F_Civ_Dead",
				"A3_Structures_F_Civ_Lamps",
				"A3_Structures_F_Civ_PlayGround",
				"A3_Structures_F_Civ_SportsGrounds",
				"A3_Structures_F_Households_Slum",
				"A3_Structures_F_Households_Stone_Big",
				"A3_Structures_F_Households_Stone_Shed",
				"A3_Structures_F_Households_Stone_Small",
				"A3_Structures_F_Naval_RowBoats",
				"A3_Structures_F_Walls",
				"A3_Structures_F_EPB_Civ_Dead",
				"A3_Structures_F_EPB_Civ_PlayGround",
				"A3_Structures_F_EPB_Naval_Fishing"
			];

		},
		"Unlock village objects"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Structures_F_Mil_BagBunker",
				"A3_Structures_F_Mil_Barracks",
				"A3_Structures_F_Mil_Bunker",
				"A3_Structures_F_Mil_Cargo",
				"A3_Structures_F_Mil_Fortification",
				"A3_Structures_F_Mil_Offices",
				"A3_Structures_F_Mil_Radar",
				"A3_Structures_F_Mil_Shelters",
				"A3_Structures_F_Mil_TentHangar",
				"A3_Structures_F_Research",
				"A3_Structures_F_Training",
				"A3_Structures_F_EPA_Mil_Scrapyard"
			];

		},
		"Unlock town objects"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Structures_F_Households_Addons",
				"A3_Structures_F_Households_House_Big01",
				"A3_Structures_F_Households_House_Big02",
				"A3_Structures_F_Households_House_Shop01",
				"A3_Structures_F_Households_House_Shop02",
				"A3_Structures_F_Households_House_Small01",
				"A3_Structures_F_Households_House_Small02",
				"A3_Structures_F_Households_House_Small03",
				"A3_Structures_F_Households_WIP",
				"A3_Structures_F_Ind_CarService",
				"A3_Structures_F_Civ_Offices",
				"A3_Structures_F_EPB_Civ_Accessories",
				"A3_Structures_F_EPB_Civ_Garbage"
			];

		},
		"Unlock military objects"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Structures_F_Dominants_Lighthouse",
				"A3_Structures_F_Ind_ConcreteMixingPlant",
				"A3_Structures_F_Ind_Crane",
				"A3_Structures_F_Ind_DieselPowerPlant",
				"A3_Structures_F_Ind_Factory",
				"A3_Structures_F_Ind_FuelStation",
				"A3_Structures_F_Ind_FuelStation_Small",
				"A3_Structures_F_Ind_PowerLines",
				"A3_Structures_F_Ind_ReservoirTank",
				"A3_Structures_F_Ind_Shed",
				"A3_Structures_F_Ind_SolarPowerPlant",
				"A3_Structures_F_Ind_Tank",
				"A3_Structures_F_Ind_Transmitter_Tower",
				"A3_Structures_F_Ind_WindPowerPlant"
			];
		},
		"Unlock industrial objects"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Structures_F_Civ_Chapels",
				"A3_Structures_F_Civ_BellTowers",
				"A3_Structures_F_Civ_Calvaries",
				"A3_Structures_F_Dominants_Church",
				"A3_Structures_F_Ind_Windmill",
				"A3_Structures_F_Civ_Ancient",
				"A3_Structures_F_Civ_Statues",
				"A3_Structures_F_Dominants_Amphitheater",
				"A3_Structures_F_Dominants_Castle"
			];
		},
		"Unlock cultural objects"
	]
];
_rewardsVehicles = [
	[
		{
			_curator addcuratoraddons [
				"A3_Armor_F_AMV",
				"A3_Armor_F_Marid",
				"A3_Armor_F_APC_Wheeled_03",
				"A3_Boat_F_Boat_Armed_01",
				"A3_Boat_F_Boat_Transport_01",
				"A3_Boat_F_Beta_Boat_Armed_01",
				"A3_Boat_F_SDV_01",
				"A3_Boat_F_Civilian_Boat"
			];
		},
		"Unlock heavy wheeled vehicles and boats"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Armor_F_Panther",
				"A3_armor_f_beta_APC_Tracked_02",
				"A3_Armor_F_Slammer",
				"A3_Armor_F_T100K",
				"A3_Armor_F_EPB_APC_tracked_03",
				"A3_Armor_F_EPB_MBT_03"
			];
		},
		"Unlock armored vehicles"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Air_F_Heli_Light_01",
				"A3_Air_F_Heli_Light_02",
				"A3_Air_F_Beta_Heli_Attack_01",
				"A3_Air_F_Beta_Heli_Attack_02",
				"A3_Air_F_Beta_Heli_Transport_01",
				"A3_Air_F_Beta_Heli_Transport_02",
				"A3_Air_F_Gamma_Plane_Fighter_03",
				"A3_Air_F_EPB_Heli_Light_03"
			];
		},
		"Unlock aircrafts"
	],
	[
		{
			_curator addcuratoraddons [
				"A3_Soft_F_Crusher_UGV",
				"A3_Air_F_Gamma_UAV_01",
				"A3_Air_F_Gamma_UAV_02"
			];
		},
		"Unlock autonomous vehicles"
	]
];
_rewardArea = [];
for "_i" from 1 to (count (allMissionObjects "emptydetector")) do {
	_rewardArea = _rewardArea + [
		[
			{[_curator] call bis_fnc_addCuratorAreaFromTrigger;},
			"Unlock new area"
		]
	];
};

//--- Unlock everything
_unlockEverything = ("CuratorUnlock" call bis_fnc_getParamValue) > 0;
if (_unlockEverything) exitwith {
	{
		call (_x select 0);
	} foreach (_rewardsEmpty + _rewardsVehicles);
	{
		deletevehicle _x;
	} foreach (allmissionobjects "emptydetector");
	{
		_x setcuratorcoef ["place",0];
		_x setcuratorcoef ["delete",0];
	} foreach _curators;
};

//--- Assign rewards in semi-random order
_rewards = [];
_allRewards = [_rewardsEmpty,_rewardsVehicles/*,_rewardArea*/];
_allRewardsCount = count _allRewards;
_index = 0;
while {{count _x > 0} count _allRewards > 0} do {
	_rewardArray = _allRewards select _index;
	if (count _rewardArray > 0) then {
		_rewardID = _rewardArray call bis_fnc_randomIndex;
		_rewards set [count _rewards,_rewardArray select _rewardID];
		_rewardArray set [_rewardID,-1];
		_rewardArray = _rewardArray - [-1];
		_allRewards set [_index,_rewardArray];
	};
	_index = (_index + 1) % _allRewardsCount;
};

//--- Initialize challenges
sleep 1;
waituntil {count (curatoraddons _curator) > 1};
[_curator,[],2,_rewards] spawn bis_fnc_manageCuratorChallenges;
