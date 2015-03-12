//This script compiles a list of all the units, per side.
VCOM_West = [];
VCOM_East = [];
VCOM_Civilian = [];
VCOM_Resistance = [];

while {true} do {
	{
		call {
			if ((side _x) isEqualTo WEST) exitWith {	VCOM_West pushBack _x; };
			if ((side _x) isEqualTo EAST) exitWith { VCOM_East pushBack _x; };
			if ((side _x) isEqualTo RESISTANCE) exitWith { VCOM_Resistance pushBack _x; };
			if ((side _x) isEqualTo CIVILIAN) exitWith { VCOM_Civilian pushBack _x; };
		};

	} foreach (allUnits);

	sleep 5;
};