folderLocation = "Scripts\Cooked\"

missionLocation = [ ( str missionConfigFile ), 0, -15 ] call BIS_fnc_trimString;
scriptLocation = missionLocation + folderLocation + "BattleBorn\";
uiLocation = missionLocation + folderLocation + "BattleBorn\UI";
soundLocation = missionLocation + folderLocation + "BattleBorn\sounds\";
functionLocation = missionLocation + folderLocation + "BattleBorn\functions\";
dataLocation = missionLocation + folderLocation + "BattleBorn\data\";

sleep 20;

["<t size='.6'>Running BattleBorn Scripts</t>",0.02,0.3,7,1,0,3010] spawn bis_fnc_dynamicText;

[] execVM scriptLocation + "defaultSettings.sqf";

if (isServer || isDedicated) then {
	[] execVM scriptLocation + "initServer.sqf";
};

[] execVM scriptLocation + "initClient.sqf";

