private ["_Unit", "_magazinesAmmo", "_Magazine", "_value", "_SubtractAmount", "_DemoCharge", "_SatchelCharge", "_Bomb", "_IsWired", "_IsRemote", "_IsClaymore", "_MineName"];

_Unit = _this;
_magazinesAmmo = magazinesAmmo _Unit;

{
	_Magazine = _x select 0;
	_value = (configfile >> "CfgMagazines" >> _Magazine >> "nameSound") call BIS_fnc_getCfgData;
	if (_value isEqualTo "satchelcharge") then 
	{
		_SubtractAmount = 0;
		_DemoCharge = ["DemoCharge",_Magazine,false] call BIS_fnc_inString;
		_SatchelCharge = ["SatchelCharge",_Magazine,false] call BIS_fnc_inString;
		
		if (_DemoCharge || {_SatchelCharge}) then
		{
			_Bomb = "Democharge_F";
			if (_SatchelCharge) then {_Bomb = "SatchelCharge_F"};
			_Unit setVariable ["VCOM_SATCHELBOMB",_Bomb,false];
			_Unit setVariable ["Vcom_SatchelObjectMagazine",_Magazine,false];
			_Unit setVariable ["VCOM_HASSATCHEL",true,false];
		};

	};
	if (_value isEqualTo "mine") then
	{
		_SubtractAmount = 0;
		_IsWired = ["wire",_Magazine,false] call BIS_fnc_inString;
		_IsRemote = ["remote",_Magazine,false] call BIS_fnc_inString;
		_IsClaymore = ["Claymore",_Magazine,false] call BIS_fnc_inString;
		if (_IsWired) then {_SubtractAmount = -9} else {_SubtractAmount = -10};
		if (_IsRemote) then {_SubtractAmount = -11};
		_MineName = [_Magazine,0,_SubtractAmount] call BIS_fnc_trimString;
		if (_IsClaymore) then {_MineName = "Claymore_F"};
		_Unit setVariable ["Vcom_MineObject",_MineName,false];
		_Unit setVariable ["Vcom_MineObjectMagazine",_Magazine,false];
		_Unit setVariable ["VCOM_HasMine",true,false];
	};
} forEach _magazinesAmmo;



