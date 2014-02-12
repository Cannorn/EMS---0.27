private ["_coords","_veh"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
publicVariable "MissionGoMinor";
_coords =  [getMarkerPos "center",0,6200,20,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Minor mission created (SM3)";

[nil,nil,rTitleText,"Bandits have set up a stash house!", "PLAIN",10] call RE;

MCoords = _coords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_baserunover = createVehicle ["Land_HouseV_1I3",[(_coords select 0) + 2, (_coords select 1) + 5,-0.3],[], 0, "CAN_COLLIDE"];
_veh = createVehicle ["SUV_Camo",[(_coords select 0) + 15, (_coords select 1) - 10,0],[], 0, "CAN_COLLIDE"];
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];

_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaLoot",true];

[_coords,60,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
[_coords,40,3,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 2;

waitUntil{{isPlayer _x && _x distance _baserunover < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"The stash house has been secured!", "PLAIN",6] call RE;
MissionGoMinor = 0;
publicVariable "MissionGoMinor";
MCoords = 0;
publicVariable "MCoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
