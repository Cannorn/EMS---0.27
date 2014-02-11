private ["_coords","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6500,20,0,20,0] call BIS_fnc_findSafePos;
diag_log "EMS: Major Mission Created (SM7)";

[nil,nil,rTitleText,"Object been airdropped!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_chopper = ["BTR60_TK_EP1","LAV25","LAV25_HQ","LAV25_HQ","LAV25_HQ"] call BIS_fnc_selectRandom;
sleep 1;
hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];
hueychop setVariable ["ObjectID","1",true]; PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
hueychop setFuel 0.50;
hueychop setVehicleAmmo 1.00;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 1, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaLoot",true];

_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance hueychop < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"Object secured", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
