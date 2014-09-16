/*
	Include this file to description.ext of your mission

	Optionally, you can set default value:
		#define DAYTIMEPERIOD_DEFAULT	18

	Example:
	class Params
	{
		#include "\a3\Functions_F_Curator\Params\paramRespawnDaytimePeriod.hpp"
	};
*/

#ifndef DAYTIMEPERIOD_DEFAULT
	#define DAYTIMEPERIOD_DEFAULT	12
#endif

class Daytime
{
	title = "Time"; //--- ToDo: Localize
	values[] = {6,12,18,0};
	texts[] = {"Morning","Day","Evening","Night"}; //--- ToDo: Localize
	default = DAYTIMEPERIOD_DEFAULT;
	function = "BIS_fnc_paramDaytime";
};