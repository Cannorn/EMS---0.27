private ["_coords","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
_coords = [getMarkerPos "center",0,6500,20,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM6)";

[nil,nil,rTitleText,"A weapons truck has crashed!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_uralcrash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];
_hummer = createVehicle ["SUV_Camo",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer setVariable ["ObjectID","1",true]; PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaloot",true];

[_coords,40,3,3,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
[_coords,60,4,3,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 2;

waitUntil{{isPlayer _x && _x distance _uralcrash < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"The crash site has been secured!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
