weathermenu_main = [
  [" Settings", false],
  ["Toggle weather info screen", [2],"", -5, [["expression","[100000] execVM '\TORT_DYNAMICWEATHER\settings\startstop_Infoboard.sqf'"]],"1","1"],
  ["Toggle ground fog", [3], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\settings\toggle_groundfog.sqf'"]], "1", "1"],
  ["Random change: Never", [4],"", -5, [["expression","[0,0] execVM '\TORT_DYNAMICWEATHER\settings\setRandomness.sqf'"]],"1","1"],
  ["Random change: Rare", [5],"", -5, [["expression","[0.05,0.1] execVM '\TORT_DYNAMICWEATHER\settings\setRandomness.sqf'"]],"1","1"],
  ["Random change: Sometimes", [6],"", -5, [["expression","[0.1,0.2] execVM '\TORT_DYNAMICWEATHER\settings\setRandomness.sqf'"]],"1","1"],
  ["Random change: Often", [7],"", -5, [["expression","[0.3,0.2] execVM '\TORT_DYNAMICWEATHER\settings\setRandomness.sqf'"]],"1","1"],
  ["Slow progressing (60m)", [8],"", -5, [["expression","[60] execVM '\TORT_DYNAMICWEATHER\settings\setCycleSpeed.sqf'"]],"1","1"],
  ["Normal progressing (30m)", [9],"", -5, [["expression","[30] execVM '\TORT_DYNAMICWEATHER\settings\setCycleSpeed.sqf'"]],"1","1"],
  ["Fast progressing (15m)", [10],"", -5, [["expression","[15] execVM '\TORT_DYNAMICWEATHER\settings\setCycleSpeed.sqf'"]],"1","1"],
  ["STOP weather processing", [11], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\settings\stop_tort_DynamicWeather.sqf'"]], "1", "1"]
];

weathertrend = [
  [" Weather trend", false],
  ["Constant: Stay constant and always return back to current level", [2], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\constant.sqf'"]], "1", "1"],
  ["Better: Trending straight towards better weather", [3], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\better.sqf'"]], "1", "1"],
  ["Worse: Trending straight towards worse weather", [4], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\worse.sqf'"]], "1", "1"],
  ["Cycle: randomly moving inside the extremes", [5], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\freecycle.sqf'"]], "1", "1"],
  ["Cycle w. probability: better", [6], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\pbetter.sqf'"]], "1", "1"],
  ["Cycle w. probability: worse", [7], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\pworse.sqf'"]], "1", "1"],
  ["Random: Every new cycle is random", [8], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\random.sqf'"]], "1", "1"],
  ["Oscillate: Hop between good and bad", [9], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\trend\oscillate.sqf'"]], "1", "1"]
];

weatherpreset = [
  [" Weather preset", false],
  ["Sunny", [2], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\preset\sunny.sqf'"]], "1", "1"],
  ["Cloudy", [3],"", -5, [["expression","[] execVM '\TORT_DYNAMICWEATHER\preset\cloudy.sqf'"]],"1","1"],
  ["Rainy", [4],"", -5, [["expression","[] execVM '\TORT_DYNAMICWEATHER\preset\rainy.sqf'"]],"1","1"],
  ["Stormy", [5],"", -5, [["expression","[] execVM '\TORT_DYNAMICWEATHER\preset\stormy.sqf'"]],"1","1"],
  ["No fog", [6], "", -5, [["expression", "[0] execVM '\TORT_DYNAMICWEATHER\preset\setfog.sqf'"]], "1", "1"],
  ["Light fog", [7], "", -5, [["expression", "[0.15] execVM '\TORT_DYNAMICWEATHER\preset\setfog.sqf'"]], "1", "1"],
  ["Medium fog", [8], "", -5, [["expression", "[0.38] execVM '\TORT_DYNAMICWEATHER\preset\setfog.sqf'"]], "1", "1"],
  ["Heavy fog", [9], "", -5, [["expression", "[0.8] execVM '\TORT_DYNAMICWEATHER\preset\setfog.sqf'"]], "1", "1"],
  ["Shuffle weather", [10],"", -5, [["expression","[] execVM '\TORT_DYNAMICWEATHER\preset\shuffle.sqf'"]],"1","1"]
];

weathertemplate = [
  [" Weather template", false],
  ["As set in userconfig", [2], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\template\userconfig.sqf'"]], "1", "1"],
  ["Unknown weather", [2], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\template\unknown.sqf'"]], "1", "1"],
  ["Sunny weather", [3], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\template\sunny.sqf'"]], "1", "1"],
  ["Moderate weather", [4], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\template\moderate.sqf'"]], "1", "1"],
  ["Moderate w. extreme breakouts", [4], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\template\moderate2.sqf'"]], "1", "1"],
  ["Mostly uncomfortable", [5], "", -5, [["expression", "[] execVM '\TORT_DYNAMICWEATHER\template\uncomfortable.sqf'"]], "1", "1"]
];