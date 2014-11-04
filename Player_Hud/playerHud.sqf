disableSerialization;

// player setVariable["AsReMixhud", true];//Variable Show/Hide HUD Support for control player hud

AsReMixhud_Control = true; // player getVariable["AsReMixhud",true];


while {true} do
{
    1000 cutRsc ["AsReMixhud","PLAIN"];
    _wpui = uiNameSpace getVariable "AsReMixhud";
    _vitals = _wpui displayCtrl 4900;
	
	_thePlayer = player;
	
	AsReMixhud_zombieKills 	= _thePlayer getVariable["zombieKills",0];
	AsReMixhud_headshots 	= _thePlayer getVariable["headShots",0];
	AsReMixhud_killsH 		= _thePlayer getVariable["humanKills",0];
	_cashMoney 				= _thePlayer getVariable["cashMoney",0];
    _bankMoney 				= _thePlayer getVariable["bankMoney",0];
	AsReMixhud_killsB 		= _thePlayer getVariable["banditKills",0];
	AsReMixhud_humanity 	= _thePlayer getVariable["humanity",0];
	AsReMixhud_zombies 		= "";
	AsReMixhud_zombiesAlive = "";
	Blood 		        = 		_Player getVariable["USEC_BloodQty",12000];
	AsReMixhud_pid			= "";
	AsReMixhud_puid			= "";
    AsReMixhud_hmnicon 		= "";
	AsReMixhud_fps 			= (round diag_fps);
	AsReMixhud_svrname		= "Clanfrontos";
	
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
	
if((AsReMixhud_humanity >= 5000) && (AsReMixhud_humanity <= 7499))then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\H1.paa'/>"; };
if((AsReMixhud_humanity >= 7500) && (AsReMixhud_humanity <= 14999))then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\H1-2.paa'/>"; };
if((AsReMixhud_humanity >= 15000) && (AsReMixhud_humanity <= 17499)) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\H2.paa'/>"; };
if((AsReMixhud_humanity >= 17500) && (AsReMixhud_humanity <= 19999)) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\H2-3.paa'/>"; };
if(AsReMixhud_humanity >= 20000) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\H3.paa'/>"; };
	
if((AsReMixhud_humanity <= 4999) && (AsReMixhud_humanity >= -4999)) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\S1.paa'/>"; };
	
if((AsReMixhud_humanity <= -5000) && (AsReMixhud_humanity >= -7499))then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\B1.paa'/>"; };
if((AsReMixhud_humanity <= -7500) && (AsReMixhud_humanity >= -14999))then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\B1-2.paa'/>"; };
if((AsReMixhud_humanity <= -15000) && (AsReMixhud_humanity >= -17499)) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\B2.paa'/>"; };
if((AsReMixhud_humanity <= -17500) && (AsReMixhud_humanity >= -19999)) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\B2-3.paa'/>"; };
if(AsReMixhud_humanity <= -20000) then { AsReMixhud_hmnicon = "<img size='3.7' image='Scripts\Player_Hud\icons\B3.paa'/>"; };
	
	_vitals ctrlSetStructuredText parseText format ["
		
		<t size='5.0' align='center'> %5 </t><br/>
		<t size='1.0' align='center'> %2 </t> <br/>
		<t size='0.8' align='left'> %4 </t><img size='1.9' align='right' image='Scripts\Player_Hud\icons\sz.paa'/>   <br/>
		<t size='0.8' align='left'> %9 </t><img size='1.9' align='right' image='Scripts\Player_Hud\icons\sb.paa'/>   <br/>
		<t size='0.8' align='left'> %10 </t><img size='1.9' align='right' image='Scripts\Player_Hud\icons\sh.paa'/>   <br/>
		<t size='0.8' align='left'> %3 </t><img size='1.0' align='right' image='Scripts\Player_Hud\icons\dollars.paa'/>   <br/>
		<t size='0.8' align='left'> %14 </t><img size='1.0' align='right' image='Scripts\Player_Hud\icons\equip_safe_CA.paa'/>   <br/>
		<t size='0.9'> %13 </t><img size='0.9' align='right' image='Scripts\Player_Hud\icons\Fps.paa'/><br/>
		<t size='0.9'> %11h %12min </t><img size='0.9' align='right' image='Scripts\Player_Hud\icons\Uptime.paa'/><br/>
	",
	Blood,   //1
	AsReMixhud_humanity,//2
	[_cashMoney] call BIS_fnc_numberText,//3
	AsReMixhud_zombiekills,//4
	AsReMixhud_hmnicon,//5
	name player,//6
	AsReMixhud_zombiesAlive,//7
	AsReMixhud_zombies,//8
	AsReMixhud_killsB,//9
	AsReMixhud_killsH,//10
	_hours,//11
	_minutes2,//12
	AsReMixhud_fps,//13
	[_bankMoney] call BIS_fnc_numberText,//14
	AsReMixhud_svrname//15
	];
	_vitals ctrlCommit 0;
        
    sleep 2;
};
