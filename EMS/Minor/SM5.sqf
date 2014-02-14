private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
_coords =  [getMarkerPos "center",0,6000,10,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM5)";

[nil,nil,rTitleText,"A Humvee has crashed!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_veh = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

_crate = createVehicle ["RULaunchersBox",[(_coords select 0) - 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate setVariable ["permaLoot",true];

[_coords,60,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
[_coords,40,3,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 2;

waitUntil{{isPlayer _x && _x distance _hummer < 5 } count playableunits > 0}; 

[nil,nil,rTitleText,"The crash site has been secured!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
