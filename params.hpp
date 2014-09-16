class Params
{
	class Param_Weather
	{
		title = "Initial weather";
		values[] = {0,1,2,3,4,5};
		texts[] = {"Clear","Sunny","Cloudy","Foggy","Stormy","Random"};
		default = 2;
	};
	class Param_WeatherTrend
	{
		title = "Weather Trend";
		values[] = {0,1,2,3,4,5,6};
		texts[] = {"Constant init level (random events return to this)","Worse","Likely to trend to worse","Better","Likely to trend to better","Randomly cycling","Random at any"};
		default = 6;
	};
	class Param_probRnd
	{
		title = "Random weather events";
		values[] = {0,1,2,3};
		texts[] = {"Never","Rarely","Sometimes","Often"};
		default = 1;
	};
};