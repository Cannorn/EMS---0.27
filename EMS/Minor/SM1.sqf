private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

_coords = [getMarkerPos "center",0,6000,20,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM1)";
[nil,nil,rTitleText,"A hunting party has been spotted!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_veh = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 5, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

[_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
[_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";

waitUntil{({alive _x} count (units SniperTeam)) < 1};

[nil,nil,rTitleText,"The hunting party has been wiped out!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
