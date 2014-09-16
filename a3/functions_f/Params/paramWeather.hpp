/*
	Include this file to description.ext of your mission

	Optionally, you can set default value:
		#define WEATHER_DEFAULT	0.8

	Example:
	class Params
	{
		#include "\a3\Functions_F_Curator\Params\paramRespawnWeather.hpp"
	};
*/

#ifndef WEATHER_DEFAULT
	#define WEATHER_DEFAULT	40
#endif

class Weather
{
	title = "Weather"; //--- ToDo: Localize
	values[] = {0,20,40,60,80,100};
	texts[] = {"Clear","Sunny","Partly cloudy","Mainly Cloudy","Rainy","Storm"}; //--- ToDo: Localize
	default = WEATHER_DEFAULT;
	function = "BIS_fnc_paramWeather";
};