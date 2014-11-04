/*
	AsReMix Player HUD File - Zupa Single Currency Edit - Lots of thanks to AsRemix.
*/

#define hud_status_idc 4900


class AsReMixhud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "AsReMixhud";
	onLoad = "uiNamespace setVariable ['AsReMixhud', _this select 0]";
	
	class controlsBackground {

		class AsReMixhud_Status:Hw_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safezoneX + (safezoneW -0.20) ;
			y = safezoneY + 0.05 * safezoneW;
			w = 0.20; h = 0.8;
			colorText[] = {1,1,1,1};
			lineSpacing = 12;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 0;
			class Attributes {
				align = "right";
			};
		};

	};
};
