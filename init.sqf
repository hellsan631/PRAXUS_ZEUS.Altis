["<t size='.6'>http://praxusgroup.com/</t>",0.02,0.3,6,1,0,3010] spawn bis_fnc_dynamicText;

VCOM_AIKnockingOut = 0;
VCOM_AIWarnDistance = 150;

[] execVM "Scripts\Cooked\battleborn\init.sqf";

//VCOM AI
[] execVM "Scripts\Cooked\VCOMAI\init.sqf";
