//Created on ???
// Modified on : 9/7/14 - Added radio check.   9/10/14 - Added PRIVATE commandArtilleryFire

private ["_Unit","_Wall","_Direction","_Killer","_UnitSide","_NoFlanking","_GrabVariable","_CheckStatus","_Array1","_NoFlanking2","_CheckStatus2","_GrabVariable2","_CombatStance","_group","_index","_WaypointIs","_waypoint0"];

_Unit = _this select 0;

_Unit spawn
{
sleep 8;
private ["_Wall"];
	_Direction = 0;
	for "_i" from 0 to 1 step 1 do
	{
		_Wall = "Land_InvisibleBarrier_F" createvehiclelocal (getpos _this);
		_Wall disableCollisionWith _this;		
		_Wall setDir _Direction;
		_Wall setposATL (getposATL _this);		
		[[_Wall],"DisableCollisionALL"] call BIS_fnc_MP;
		_Wall disableCollisionWith player;
		_Wall spawn {sleep 120;deletevehicle _this;};
		_Direction = 90;
	};
};


if !(side _unit in VCOM_SideBasedMovement) exitWith {};


_Killer = _this select 1;

//If this gets attached to a player, then exit before doing anything
if (isPlayer _Unit) exitWith {};

//Let's pull the units group side
_UnitSide = side (group _Unit);

//If the unit is in the ArtilleryArray, then remove it
if (_Unit in ArtilleryArray) then {ArtilleryArray = ArtilleryArray - [_Unit];};

//Check to see if this unit should be moving to support others or not
_NoFlanking = _Unit getVariable "VCOM_NOPATHING_Unit";
if (_NoFlanking) exitWith {};

//Check to see if this unit is garrisoned. If so, don't do anything
_GrabVariable = _Unit getVariable "VCOM_GARRISONED";
if (_GrabVariable) exitWith {};

//Check to see if unit has radio. If the unit does not have a radio, then it will not move to support
_CheckStatus = assignedItems _Unit;
if (!("ItemRadio" in _CheckStatus)) exitWith {};



_Array1 = _Unit call VCOMAI_FriendlyArray;
_Array1 = _Array1 - ArtilleryArray;
{
	_NoFlanking2 = _x getVariable "VCOM_NOPATHING_Unit";
	if !(_NoFlanking2) then 
	{
		_CheckStatus2 = assignedItems _x;
		if ("ItemRadio" in _CheckStatus2) then 
			{
				
				_GrabVariable2 = _x getVariable "VCOM_GARRISONED";
				
				
				if !(_GrabVariable2) then 
				{	
					_group	= group _x;
					if ((count (waypoints _group)) < 2) then 
					{
						
						
						_index = currentWaypoint _group;
						_WaypointIs = waypointType [_group,_index];
						if (_WaypointIs != "HOLD") then {
						if (_WaypointIs != "GUARD") then {
						if (_WaypointIs != "UNLOAD") then {
						if (_WaypointIs != "TR UNLOAD") then {
						if (_WaypointIs != "SENTRY") then {
						if (_WaypointIs != "LOAD") then {
						if ((_x distance _Unit) <= (_x getVariable "VCOM_Unit_AIWarnDistance") ) then {
						
						_waypoint0 = (group _x) addwaypoint[(getPosATL _Killer),0];
						_waypoint0 setwaypointtype "MOVE";
						_waypoint0 setWaypointSpeed "NORMAL";
						
						(group _x) setCurrentWaypoint [(group _x),(_waypoint0 select 1)];
						
						if (_x != (vehicle _x)) then {
							(group _x) setBehaviour "COMBAT";
						};
						_x setVariable ["VCOM_MOVINGTOSUPPORT",true,false];
						_x spawn 
						{
							sleep 10;
							_x setVariable ["VCOM_MOVINGTOSUPPORT",false,false];
						};
						
						};
						};
						};
						};
						};
						};
						};
					};
				};
			};
		};
} forEach _Array1;