private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6000,20,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Major Mission Created (SM5)";

[nil,nil,rTitleText,"A Ural carrying supplies crashed!", "PLAIN",10] call RE;
Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_uralcrash = createVehicle ["UralWreck",[(_coords select 0) - 1, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_veh = createVehicle ["HMMWV_DZ",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
sleep 1;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillConstructionMajor.sqf";
_crate setVariable ["permaloot",true];
sleep 1;

_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance _uralcrash < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"The supplies have been secured!", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
