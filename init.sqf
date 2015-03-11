["<t size='.6'>http://praxusgroup.com/</t>",0.02,0.3,6,1,0,3010] spawn bis_fnc_dynamicText;

VCOM_AIKnockingOut = 0;
VCOM_AIWarnDistance = 150;

[] execVM "Scripts\Cooked\battleborn\init.sqf";

[
    10*60*10, // seconds to delete dead bodies (0 means don't delete)
    10*60*2, // seconds to delete dead vehicles (0 means don't delete)
    0, // seconds to delete immobile vehicles (0 means don't delete)
    10*60*5, // seconds to delete dropped weapons (0 means don't delete)
    10*60*20, // seconds to deleted planted explosives (0 means don't delete)
    10*60*2 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'Scripts\cleanup.sqf';

//VCOM AI
[] execVM "Scripts\Cooked\VCOMAI\init.sqf";
