publicVariable "scriptLocation";
publicVariable "missionLocation";
publicVariable "uiLocation";
publicVariable "soundLocation";
publicVariable "functionLocation";
publicVariable "dataLocation";

folderLocation = "Scripts\Cooked\"

missionLocation = [ ( str missionConfigFile ), 0, -15 ] call BIS_fnc_trimString;
scriptLocation = missionLocation + folderLocation + "BattleBorn\";
uiLocation = missionLocation + folderLocation + "BattleBorn\UI";
soundLocation = missionLocation + folderLocation + "BattleBorn\sounds\";
functionLocation = missionLocation + folderLocation + "BattleBorn\functions\";
dataLocation = missionLocation + folderLocation + "BattleBorn\data\";


if (isServer || isDedicated) then {


};

