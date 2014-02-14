private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
_coords =  [getMarkerPos "center",0,6000,25,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM4)";

[nil,nil,rTitleText,"A helicopter has crashed!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_chopcrash = createVehicle ["UH60Wreck_DZ",_coords,[], 0, "CAN_COLLIDE"];
_veh = createVehicle ["SUV_Camo",[(_coords select 0) + 15, (_coords select 1) - 15,0],[], 0, "CAN_COLLIDE"];
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate setVariable ["permaLoot",true];

[_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
[_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";

waitUntil{{isPlayer _x && _x distance _chopcrash < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"Wrecked Chopper has been secured!", "PLAIN",6] call RE;
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";
SM1 = 5;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
