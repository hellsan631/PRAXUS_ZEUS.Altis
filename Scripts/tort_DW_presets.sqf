/*
tort_DW_presets, Version: 0.2, Author: tortuosit, Date: 20140712

Example:
0 = ["Altis", 0] execVM "\@tort_DynamicWeather\script\tort_DW_presets.sqf";
*/

switch (_this select 0) do {
   case "Altis": {tort_DW_preset=[[0.3,0.01,0.2],"constant",[0.1,0.1],[0.05,0.15],[0,0.75,0,0.2,0,0.5],(_this select 1),0]};
   case "Sunny and moderate": {tort_DW_preset=[[0.3,0.01,0.2],"constant",[0.05,0],[0.05,0.15],[0,0.4,0,0.05,0,0.5],(_this select 1),0]};
   case "Cloudy": {tort_DW_preset=[[0.45,0.01,0.5],"freeCycle",[0,0],[0,0.1],[0.3,0.5,0,0.1,0,0.8],(_this select 1),0]};
   case "Moderately variable": {tort_DW_preset=[[0.5,0.05,0.5],"freeCycle",[0.1,0],[0.05,0.15],[0.2,0.6,0,0.1,0,0.5],(_this select 1),0]};
   case "Variable and turbulent": {tort_DW_preset=[[0.5,0.05,0.5],"freeCycle",[0.3,0.1],[0.1,0.3],[0.2,0.8,0,0.5,0,1],(_this select 1),0]};
   case "Light fog": {tort_DW_preset=[[0.4,0.1,0.5],"constant",[0.2,0.2],[0.05,0.15],[0,0.7,0.05,0.15,0,1],(_this select 1),0]};
   case "Fog": {tort_DW_preset=[[0.4,0.6,0.5],"constant",[0.2,0.2],[0.05,0.15],[0,0.7,0.4,0.7,0,1],(_this select 1),0]};
   case "Random chaos": {tort_DW_preset=["random","random",[1,1],[0,0.2],[0,1,0,1,0,1],(_this select 1),0]};
};

0 = tort_DW_preset execVM "\@tort_DynamicWeather\script\tort_DynamicWeather.sqf";