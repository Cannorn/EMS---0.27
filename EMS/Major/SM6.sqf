private ["_coords","_chopper","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6500,15,0,20,0] call BIS_fnc_findSafePos;
diag_log "EMS: Major Mission Created (SM11)";

[nil,nil,rTitleText,"A humvee has broken down!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_chopper = ["HMMWV_Ambulance_CZ_DES_EP1","HMMWV_M1151_M2_CZ_DES_EP1","HMMWV_DZ"] call BIS_fnc_selectRandom;
sleep 1;
hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];
hueychop setVariable ["ObjectID","1",true]; PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
hueychop setFuel 0.50;
hueychop setVehicleAmmo 1.00;
sleep 1;

_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance hueychop < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"The humvee is under survivor control!", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
