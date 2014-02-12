private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
_coords =  [getMarkerPos "center",0,6200,20,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM2)";

[nil,nil,rTitleText,"Bandits have taken over a Medical Outpost!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_baserunover = createVehicle ["US_WarfareBFieldhHospital_Base_EP1",[(_coords select 0) +2, (_coords select 1) +5,-0.3],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["MASH_EP1",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_veh = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate setVariable ["permaLoot",true];

[_coords,60,3,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
[_coords,40,2,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";
sleep 2;

waitUntil{{isPlayer _x && _x distance _baserunover < 10 } count playableunits > 0};
 
[nil,nil,rTitleText,"The Medical Outpost is under control!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
