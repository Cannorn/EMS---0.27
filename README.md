EMS---0.27
==========

This is a followup on the EMS - 0.26 from Fuchs

Credits: Lazyink, TheSzerdi, Falcyn , TAWTonic  the devs from the original Missions system

Same as EMS-026 only taken out the copied missions , u can sell the vehicles but they wont be there after a restart or save to the database

Install is simple on Epoch-1041   ... unpack your dayz_server.pbo

<b>Edit your server_functions.sqf</b><br>Located: dayz_server\init\server_functions.sqf<br>

<b>Around line 37 look for this:</b>

    server_deaths = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDeaths.sqf";

<b>Add this after it:</b>

    fnc_hTime = compile preprocessFile "\z\addons\dayz_server\EMS\misc\fnc_hTime.sqf";
    
<b>Around line 622 look for this:</b>
	

    dayz_recordLogin = {
      private["_key"];
      _key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
      _key call server_hiveWrite;
    };


<b>Insert this after it:</b>
	

    MissionGo = 0;
    MissionGoMinor = 0;
    if (isServer) then {
      SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8"];
      [] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
      SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8"];
      [] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
    };
 

AND NEXT ... Copy the EMS folder into the unpacked dayz_server.pbo then Repack and then 

Copy the debug folder into your mission-folder

... thats it

    
