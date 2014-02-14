private ["_coords","_humm","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6000,15,0,20,0] call BIS_fnc_findSafePos;
diag_log "EMS: Major Mission Created (SM6)";

[nil,nil,rTitleText,"A humvee has broken down!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_humm = ["HMMWV_Ambulance_CZ_DES_EP1","HMMWV_M1151_M2_CZ_DES_EP1","HMMWV_DZ"] call BIS_fnc_selectRandom;
_veh = createVehicle [_humm,_coords,[], 0, "NONE"];
_veh setFuel 0.50;
_veh setVehicleAmmo 1.00;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
sleep 1;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaloot",true];
sleep 1;

_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance _veh < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"The humvee is under survivor control!", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
