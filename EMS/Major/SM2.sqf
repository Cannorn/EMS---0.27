private ["_coords","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6500,35,0,10,0] call BIS_fnc_findSafePos;
sleep 1;
diag_log "EMS: Major mission created (SM2)";

[nil,nil,rTitleText,"A C-130 has crashed and bandits are near the site!", "PLAIN",10] call RE;
Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_c130wreck = createVehicle ["C130J_wreck_EP1",[(_coords select 0) , (_coords select 1)],[], 0, "NONE"];
_c130wreck setVariable ["ObjectID","1",true]; PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
_hummer = createVehicle ["SUV_Camo",[(_coords select 0) - 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer setVariable ["ObjectID","1",true]; PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaloot",true];
sleep 2;
_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 2;

waitUntil{{isPlayer _x && _x distance _c130wreck < 15 } count playableunits > 0}; 

[nil,nil,rTitleText,"The crash site has been secured!", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
