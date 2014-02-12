private ["_coords"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
_coords = [getMarkerPos "center",0,6000,5,0,20,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM8)";

[nil,nil,rTitleText,"A psychotic axe murderer escaped!", "PLAIN",6] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

[_coords,80,8,1,2] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
waitUntil{({alive _x} count (units AxeMurderer)) < 1};

[nil,nil,rTitleText,"Finally! He's done!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\Minor\SMfinder.sqf";
