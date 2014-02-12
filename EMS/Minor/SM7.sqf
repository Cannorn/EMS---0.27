private ["_coords"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
_coords = [getMarkerPos "center",0,6000,5,0,30,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM7)";

[nil,nil,rTitleText,"A sniper team has been spotted!", "PLAIN",6] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

[_coords,20,2,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
[_coords,80,2,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
waitUntil{({alive _x} count (units SniperTeam)) < 1};

[nil,nil,rTitleText,"Snipers killed!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
