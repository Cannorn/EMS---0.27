private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6200,40,0,10,0] call BIS_fnc_findSafePos;
sleep 1;
diag_log "EMS: Major Mission Created (SM3)";

[nil,nil,rTitleText,"Bandits have set up a medical re-supply camp!", "PLAIN",10] call RE;
Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_baserunover = createVehicle ["Land_Fort_Watchtower",[(_coords select 0) - 10, (_coords select 1) - 5,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["US_WarfareBFieldhHospital_Base_EP1",[(_coords select 0) + 2, (_coords select 1) + 5,-0.3],[], 0, "CAN_COLLIDE"];
_veh = createVehicle ["HMMWV_Ambulance_CZ_DES_EP1",[(_coords select 0) + 15, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
sleep 1;

_crate = createVehicle ["USVehicleBox",[(_coords select 0) + 5, (_coords select 1),0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate setVariable ["permaloot",true];
sleep 1;

_aispawn = [_coords,60,4,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,40,3,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance _baserunover < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"Camp has been taken over", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
