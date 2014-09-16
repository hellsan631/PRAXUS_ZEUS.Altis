//Created on ???
// Modified on : 8/19/14

_Unit = _this select 0;
_myNearestEnemy = _this select 1;
_UnitGroup = group _Unit;
_GroupUnits = units _UnitGroup;
_Vehicle = (vehicle _Unit);
_CargoList = assignedCargo _Vehicle;
_CargoGroup = [];
//Hint format ["_CargoList %1",_CargoList];
if ((count _CargoList) <= 0) exitWith {};
_CargoListSelection = _CargoList call BIS_fnc_selectRandom;
_CargoGroup = group _CargoListSelection;
_Unit doMove (getPosATL _myNearestEnemy);
{

if ((_myNearestEnemy distance _x) < 400) then {
if ((getPos _Vehicle select 2) < 3) then {

unassignVehicle _x;
commandGetOut _x;
doGetOut _x;
_x action ["eject", _Vehicle];

}
else
{
//(driver (vehicle _Unit)) setBehaviour "Careless"; // He stays relaxed, even if enemies are around
//(driver (vehicle _Unit)) setCombatMode "Blue"; // He won't attack anything, anymore 
//(driver (vehicle _Unit)) setCaptive true;
(driver (vehicle _Unit)) land "LAND";
_Vehicle land "LAND";
waitUntil {(getPos _Vehicle select 2) < 15;};
_Vehicle engineOn false;
waitUntil {(getPos _Vehicle select 2) < 1.5;};
{
unassignVehicle _x;
commandGetOut _x;
doGetOut _x;
_x action ["eject", _Vehicle];

sleep 0.5;
} forEach (units _CargoGroup);
_Vehicle engineOn true;
};
};


} foreach _CargoList;
