private ["_coords","_chopper","_heli"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6000,35,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Major Mission Created (SM4)";

[nil,nil,rTitleText,"A bandit supply helicopter has landed!", "PLAIN",10] call RE;
Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_chopper = ["UH1H_DZE","Mi17_DZE","CH_47F_EP1_DZE"] call BIS_fnc_selectRandom;
sleep 1;
_heli = createVehicle [_chopper,_coords,[], 0, "NONE"];
_heli setFuel 0.50;
_heli setVehicleAmmo 1.00;
_heli setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_heli];
sleep 1;

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaloot",true];
sleep 1;

_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance _heli < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"The helicopter has been taken!", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
