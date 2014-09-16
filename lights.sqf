_types = ["Lamps_Base_F", "PowerLines_base_F", "Land_LampDecor_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampShabby_F", "Land_NavigLight", "Land_PowerPoleWooden_lamp_F", "Land_runway_edgelight", "Land_PowerPoleWooden_L_F", "Land_FloodLight_F", "Land_PortableLight_single_F", "Land_PortableLight_double_F", "Land_NavigLight_3_F"];
_onoff = _this select 2;
_object = _this select 0;
_radius = _this select 3;

_radius = _radius select 2;

_onoff = _onoff*.95;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
    // powercoverage is a marker I placed.
	_lamps = getPos _object nearObjects [_types select _i, _radius];
	sleep 1;

	{_x setDamage _onoff} forEach _lamps;
};