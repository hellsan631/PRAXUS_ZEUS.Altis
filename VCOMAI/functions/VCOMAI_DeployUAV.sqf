private ["_UAVBagClassName", "_UAVClassName", "_UAVCreated", "_myNearestEnemy", "_FriendlyArray", "_ClosestFriendly","_Array1"];
//Lets get that UAV up in the SKY!

_UAVBagClassName = _this getVariable "VCOM_StaticClassName";


_UAVClassName = [_UAVBagClassName,0,-11] call BIS_fnc_trimString;
_UAVClassName = _UAVClassName + "_F";

_UAVCreated = createVehicle [_UAVClassName, getPos _this, [], 0,""];
createVehicleCrew _UAVCreated; 
removeBackpackGlobal _this;
_this setVariable ["VCOM_HASUAV",false,false];


while {alive _UAVCreated} do
{
	_myNearestEnemy = _UAVCreated call VCOMAI_ClosestEnemy;
	if !(_NearestEnemy isEqualTo []) then
	{
		_UAVCreated doMove (getpos _myNearestEnemy);
		_FriendlyArray = _UAVCreated call VCOMAI_FriendlyArray;
		_ClosestFriendly = [_FriendlyArray,_UAVCreated] call BIS_fnc_nearestPosition;
		if (isNil "_ClosestFriendly") then {_ClosestFriendly = _UAVCreated};
		[_UAVCreated] join (group _ClosestFriendly);
		if (_myNearestEnemy distance _UAVCreated < 600) then
		{
			_Array1 = _UAVCreated call VCOMAI_FriendlyArray;
			{
				(group _x) reveal [_myNearestEnemy, 4];
			} foreach _Array1;
		};
	};
	

sleep 10;
};