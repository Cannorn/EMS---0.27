private ["_coords","_dummymarker","_base","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};
_coords = [getMarkerPos "center",0,6500,25,0,10,0] call BIS_fnc_findSafePos;
diag_log "EMS: Major Mission Created (SM9)";

[nil,nil,rTitleText,"A base is being constructed!", "PLAIN",6] call RE;

Ccoords = _coords;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_base = ["land_fortified_nest_big","Land_Fort_Watchtower"] call BIS_fnc_selectRandom;
LandingParty = createVehicle [_base,[(_coords select 0) - 20, (_coords select 1) - 10,-0.2],[], 0, "NONE"];

_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 2, (_coords select 1),0],[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillConstructionMajor.sqf";
_crate setVariable ["permaLoot",true];
sleep 1;

_aispawn = [_coords,60,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
_aispawn = [_coords,40,3,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";
sleep 1;

waitUntil{{isPlayer _x && _x distance LandingParty < 10 } count playableunits > 0}; 

[nil,nil,rTitleText,"Treath contained!", "PLAIN",6] call RE;
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";
SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
