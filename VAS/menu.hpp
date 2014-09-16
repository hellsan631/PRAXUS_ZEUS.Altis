/*
	Author: Bryan "Tonic" Boardwine
	Website: www.iamtonic.co
	Use of the VAS system is permitted although modification and distribution must be approved by Tonic.
*/

#include "common.hpp"

class VAS_Diag {
	idd = 2500;
	name= "Virtual_Ammobox_Sys";
	movingEnable = 1;
	enableSimulation = true;
	onLoad = "['guns',false] spawn VAS_fnc_mainDisplay; ctrlShow [2507,false]; ctrlShow [2508,false]; ctrlShow [2509,false]; ctrlShow [2850,false]; ctrlShow [2851,false]; ";
	onUnload = "VAS_box_weapons = nil; VAS_box_magazines = nil; VAS_box_items = nil; VAS_box_backpacks = nil; VAS_box_goggles = nil;"; //When the dialog is gone set these back to nil.

	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

// cadre noir VAS
		class MainBackground:VAS_RscText {
		// opacit? 0.7 de base
			colorBackground[] = {0, 0, 0, 0.8};
			idc = -1;
			moving = 1;
			x = -0.2;
			y = 0.1 + (11 / 250);
			w = 1.385;
			h = 1 - (22 / 250);
		};

// COlonne gauche Banderolle Orange au dessus
		class vasText : VAS_RscText
		{
			idc = -1;
			moving = 1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VAS_Main_VirtGear";
			sizeEx = 0.04;
			x = -0.2; y = 0.35;
			w = 0.575; h = 0.04;
		};

		// COlonne droite Banderolle Orange au dessus
		class vasgText : VAS_RscText
		{
			idc = -1;
			moving = 1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "$STR_VAS_Main_YCG";
			sizeEx = 0.04;
			// ok en dessous
			x = 0.60; y = 0.35;
			//w = 0.275; h = 0.04;
			w = 0.575; h = 0.04;
		};

		//
		class VAS_ContainerBG : VAS_RscText
		{
			//colorBackground[] = {0,0,0,0.7};
			//idc = 2950;
			//x = 0.64 * safezoneW + safezoneX;
			//y = 0.7 + (11 / 250);
			//w = 0.09;
			//h = 0.235 - (22 / 250);
		};

		class VAS_VestBG : VAS_ContainerBG
		{
			idc = 2951;
			moving = 1;
			y = 0.35 + (11 / 250);
		};

		class VAS_BackpackBG : VAS_ContainerBG
		{
			idc = 2952;
			y = 0.5 + (11 / 250);
		};

		class VAS_UniformPicSlot : VAS_RscPicture
		{
			idc = 2960;
			moving = 1;
			text = "";
			onLBDrop = "(_this + 1) call VAS_fnc_quickAddDrag";
			x = 0.57 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};

		class VAS_VestPicSlot : VAS_UniformPicSlot
		{
			idc = 2961;
			moving = 1;
			text = "";
			onLBDrop = "(_this + 2) call VAS_fnc_quickAddDrag";
			x = 0.64 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
		};

		class VAS_BackpackPicSlot : VAS_UniformPicSlot
		{
			idc = 2962;
			moving = 1;
			text = "";
			onLBDrop = "(_this + 3) call VAS_fnc_quickAddDrag";
			x = 0.71 * safezoneW + safezoneX;
			y = 0.7 * safezoneH + safezoneY;
		};

		class VAS_loadBarP : VAS_RscProgress
		{
			idc = 2970;
			moving = 1;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};
			x = 0.57 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.086;
			h = 0.015;
		};

		class VAS_VestLoad : VAS_loadBarP
		{
			idc = 2971;
			moving = 1;
			x = 0.64 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
		};

		class VAS_BackpackLoad : VAS_loadBarP
		{
			idc = 2972;
			moving = 1;
			x = 0.71 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
		};
	};

	class controls {

		class gundetailsbg : VAS_RscText
		{
			// colorBackground[] = {0, 0, 0, 0.7};
			idc = 2507;
			moving = 1;
			text = "";

			x = -0.2;
			y = 0.1 + (11 / 250);
			w = 0.53;
			h = 0.13 - (22 / 250);
		};

		class AttachmentsBG : VAS_RscText
		{
			// colorBackground[] = {0,0,0,0.7};
			idc = 2850;
			text = "";
			x = -0.205;
			y = 0.77 + (11 / 250);
			w = 0.3;
			h = 0.32 - (22 / 250);
		};

		class AttachmentsList : VAS_RscListBox
		{
			// colorBackground[] = {0,0,0,0};
			idc = 2851;
			text = "";
			onLBDblClick = "_this call VAS_fnc_quickAttachment";
			canDrag = 1;
			sizeEx = 0.035;
			x = -0.2; y = 0.77 + (11 / 250);
			w = 0.29; h = 0.32 - (22 / 250);
		};

		// detail nom arme
		// class gundetails : VAS_RscStructuredText
		// {
			// idc = 2508;
			// text = "";
			text = "<t align='center'>EBR 21 7.62 mm Uses:</t>";
			// x = -0.265;
			// y = 0.15 + (11 / 250);
			// w = 0.4; h = 0.15;
		// };

		//Listes chargeurs colonne gauche
		class gundetailslist : VAS_RscListBox
		{
			// colorBackground[] = {0,0,0,0};
			idc = 2509;
			moving = 1;
			text = "";
			onLBDblClick = "_this spawn VAS_fnc_quickMag;";
			sizeEx = 0.030;

			x = -0.2; y = 0.2;
			w = 0.585; h = 0.13;
		};

		// Colonne gauche equipement
		class vasGear : VAS_RscListBox
		{
			idc = 2501;
			moving = 1;
			text = "";
			sizeEx = 0.032;
			onLBSelChanged = "_this spawn VAS_fnc_details";
			onLBDblClick = "_this spawn VAS_fnc_quickItem;";
			//x = 0.12; y = 0.31;
			x = -0.2; y = 0.45;
			//w = 0.75; h = 0.340;
			w = 0.585; h = 0.340;
		};

		// colonne droite armement
		class vasPGear : VAS_RscListBox
		{
			idc = 2502;
			moving = 1;
			text = "";
			sizeEx = 0.032;
			onLBDblClick = "_this spawn VAS_fnc_qRemoveItem;";
			// Details des munitions pour l'arme selectionner
			onLBSelChanged = "_this spawn VAS_fnc_details";
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";

			x = 0.60; y = 0.45;
			w = 0.585; h = 0.340;
		};

// Dsl paperdoll view
		class ViewBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_StartView";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "[] spawn VAS_fnc_Startview";

			// position bouton, 0,42 milieu
			x = 1.20; y = 0.15;
			w = (7 / 40);
			h = (1 / 25);
		};

		class ViewStopBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_StopView";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "[] spawn VAS_fnc_Stopview";

			// position bouton, 0,42 milieu
			x = 1.20; y = 0.30;
			w = (7 / 40);
			h = (1 / 25);
		};

		class FrontViewBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_FrontView";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "dsl_SelfCam_FocusOn = 'self';";

			// position bouton, 0,42 milieu
			x = 1.20; y = 0.20;
			w = (7 / 40);
			h = (1 / 25);
		};

		class BackViewStopBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_BackView";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "dsl_SelfCam_FocusOn = 'self_back';";

			// position bouton, 0,42 milieu
			x = 1.20; y = 0.25;
			w = (7 / 40);
			h = (1 / 25);
		};
//Weapons Armes colonne central 6,25 de large
		class WeaponsBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_Weapons";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "['guns',false] spawn VAS_fnc_mainDisplay";

			// position bouton, 0,42 milieu
			x = 0.54; y = 0.1;
			w = (4 / 40);
			h = (1 / 25);
		};

		//Magazine Chargeurs colonne central 6,25 de large
		class MagazinesBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_Magazines";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "['mags',false] spawn VAS_fnc_mainDisplay";
			x = 0.645; y = 0.1;
			w = (6 / 40);
			h = (1 / 25);
		};

		//Item Objets colonne central 6,25 de large
		class ItemsBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_Items";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "['items',false] spawn VAS_fnc_mainDisplay";
			x = 0.80; y = 0.1;
			w = (3.9 / 40);
			h = (1 / 25);
		};


		//Backpack colonne central 6,25 de large
		class BackpacksBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_Backpacks";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "['packs',false] spawn VAS_fnc_mainDisplay";
			x = 0.90; y = 0.1;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GogglesBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_Goggles";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.9};
			onButtonClick = "['glass',false] spawn VAS_fnc_mainDisplay";
			x = 1.06; y = 0.1;
			w = (5 / 40);
			h = (1 / 25);
		};

		//Filter Buttons

		//Filter Buttons
		class Filter1 : VAS_RscActiveText
		{
			idc = 2580;
			moving = 1;
			text = "$STR_VAS_Main_Uniforms";
			action = "[0] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			//x = 0.43; y = 0.55;
			x = 0.65; y = 0.2;
			w = 0.575; h = 0.04;
		};

		class Filter2 : VAS_RscActiveText
		{
			idc = 2581;
			moving = 1;
			text = "$STR_VAS_Main_Vests";
			action = "[1] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			//x = 0.43; y = 0.58;
			x = 0.85; y = 0.2;
			w = 0.575; h = 0.04;
		};

		class Filter3 : VAS_RscActiveText
		{
			idc = 2582;
			moving = 1;
			text = "$STR_VAS_Main_Headgear";
			action = "[2] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			//x = 0.43; y = 0.61;
			x = 1.05; y = 0.2;
			w = 0.575; h = 0.04;
		};

		class Filter4 : VAS_RscActiveText
		{
			idc = 2583;
			moving = 1;
			text = "$STR_VAS_Main_Attachments";
			action = "[3] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			//x = 0.43; y = 0.64;
			x = 0.65; y = 0.25;
			w = 0.575; h = 0.04;
		};

		// Dernier filtre  position 0.67
		class Filter5 : VAS_RscActiveText
		{
			idc = 2584;
			moving = 1;
			text = "$STR_VAS_Main_Misc";
			action = "[4] spawn VAS_fnc_filterMenu";
			sizeEx = 0.04;
			//x = 0.43; y = 0.67;
			x = 0.85; y = 0.25;
			w = 0.575; h = 0.04;
		};

		// Titre VAS
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			moving = 1;
			text = "HUD Modification -> CyclonUnited [C.U] GranolaBar";
			x = 0.2;
			y = 1;
			w = 0.8;
			h = (1 / 25);
		};

		// class VersionNumber : Title {
			// idc = 2404;
			// style = 1;
			// text = "v2.5";
		// };

		// Bouton ajouter
		class ButtonAddG : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_btnAdd";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn VAS_fnc_addGear";
			//x = 0.13;
			//y = 0.67;
			x = 0.42;
			y = 0.50;
			w = (6 / 40);
			h = (1 / 25);
		};
		// Bouton enlever
		class ButtonRemoveG : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_btnRemove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[false] spawn VAS_fnc_removeGear;";
			//x = 0.61;
			//y = 0.67;
			x = 0.42;
			y = 0.60;
			w = (6 / 40);
			h = (1 / 25);
		};

		// bouton fermer
		class ButtonClose : VAS_RscButtonMenu {
			idc = -1;
			moving = 1;
			//shortcuts[] = {0x00050000 + 2};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			text = "$STR_VAS_Main_btnClose";
			onButtonClick = "closeDialog 0;";

			//x = 0.63; y = 0.1;
			//x = 0.1;
			//y = 0.9 - (1 / 25);
			x = -0.2; y = 0.1;
			w = (3.25 / 40);
			h = (1 / 25);
		};

		class ButtonLoadGear : VAS_RscButtonMenu
		{
			idc = -1;
			text = "$STR_VAS_Main_btnLoad";
			onButtonClick = "createDialog ""VAS_Load_Diag"";";
			x = -0.10; y = 0.1;
			w = (9.25 / 40);
			h = (1 / 25);
			// x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.8 - (1 / 25);
			// w = (6.25 / 40);
			// h = (1 / 25);
		};

		class ButtonSaveGear : VAS_RscButtonMenu {
			idc = -1;
			text = "$STR_VAS_Main_btnSave";
			onButtonClick = "createDialog ""VAS_Save_Diag"";";
			x = 0.15; y = 0.1;
			w = (12 / 40);
			h = (1 / 25);
			// x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.8 - (1 / 25);
			// w = (6.25 / 40);
			// h = (1 / 25);
		};

		// class ButtonRemoveAll : VAS_RscButtonMenu {
			// idc = -1;
			// text = "$STR_VAS_Main_btnRemoveAll";
			// onButtonClick = "[true] spawn VAS_fnc_removeGear;";
			// x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.8 - (1 / 25);
			// w = (6.25 / 40);
			// h = (1 / 25);
		// };
	};
};

// partie chargement profil
class VAS_Load_Diag {
	idd = 2520;
	name= "Virtual_Ammobox_Sys Load";
	movingEnable = 1;
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[1] spawn VAS_fnc_SaveLoad";

	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class MainBackground:VAS_RscText {
			// colorBackground[] = {0, 0, 0, 0.7};
			// idc = -1;
			// moving = 1;
			// x = 0.1;
			// y = 0.2 + (11 / 250);
			// w = 0.6;
			// h = 0.6 - (22 / 250);

			colorBackground[] = {0, 0, 0, 0.8};
			idc = -1;
			moving = 1;
			x = -0.2;
			y = 0.1 + (11 / 250);
			w = 1.385;
			h = 1 - (22 / 250);

		};
	};

	class controls {

			// titre partie chargement
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0.8};
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Load_Title";
			x = -0.1;
			y = 0.1;
			w = 1.278;
			h = (1 / 25);
		};

		class LoadLoadoutList : VAS_RscListBox
		{
			idc = 2521;
			moving = 1;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[1] spawn VAS_fnc_loadoutInfo";

			x = -0.2; y = 0.2;
			w = 0.430; h = 0.630;
		};

		class LoadFetchList : VAS_RscListBox
		{
			idc = 2522;
			moving = 1;
			colorBackground[] = {0,0,0,0};
			text = "";
			sizeEx = 0.030;

			x = 0.3; y = 0.2;
			w = 0.530; h = 0.630;
		};


		class CloseLoadMenu : VAS_RscButtonMenu {
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_btnClose";
			onButtonClick = "closeDialog 0; [] spawn VAS_fnc_Stopview;";
			// x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.8 - (1 / 25);
			// w = (6.25 / 40);
			// h = (1 / 25);
			x = -0.2; y = 0.1;
			w = (3.25 / 40);
			h = (1 / 25);
		};


		class GearLoadMenu : VAS_RscButtonMenu {
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Load_btnLoad";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn VAS_fnc_loadGear";
			x = -0.18 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (10 / 40);
			h = (1 / 25);
		};


		class LoadOnRespawnMenu : VAS_RscButtonMenu {
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Load_LOR";
			onButtonClick = "if(vas_onRespawn) then {[] call VAS_fnc_onRespawn;} else {hint ""Disabled""};";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (16 / 40);
			h = (1 / 25);
		};

		class GearDeleteMenu : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Load_btnDelete";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn VAS_fnc_deleteGear";
			x = 0.53 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.9 - (1 / 25);
			w = (10 / 40);
			h = (1 / 25);
		};

		class TransBtn : VAS_RscButtonMenu
		{
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Load_TransferBtn";
			onButtonClick = "[] call VAS_fnc_transferMenu";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1 - (1 / 25);
			w = (18 / 40);
			h = (1 / 25);
		};






	};
};

// partie transfert profil dans sous partie charger
class VAS_TransferMenu
{
	idd = 2560;
	name = "Virtual_Ammobox_sys_transfermenu";
	movingEnable = 1;
	movingEnabled = 1;
	enableSimulation = 1;

	class Controls
	{
		class MainMenu : VAS_RscControlsGroup
		{
			idc = 2600;
			moving = 1;

			class Controls
			{
				class VAS_RscTitleBackground : VAS_RscText
				{
					idc = -1;
					moving = 1;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					x = 0.25;
					y = 0.2;
					w = 0.5;
					h = (1 / 25);
				};

				class MainBackground : VAS_RscText
				{
					colorBackground[] = {0,0,0,0.7};
					idc = -1;
					moving = 1;
					x = 0.25;
					y = 0.2 + (11 / 250);
					w = 0.5;
					h = 0.6 - (22 / 250);
				};

				class Title : VAS_RscTitle
				{
					idc = -1;
					moving = 1;
					text = "$STR_VAS_Transfer_MainMenu";
					x = 0.25;
					y = 0.2;
					w = 0.5;
					h = (1 / 25);
				};

				class UnitsList : VAS_RscListBox
				{
					idc = 2601;
					moving = 1;
					text = "";
					sizeEx = 0.045;
					canDrag = 1;
					x = 0.26; y = 0.26;
					w = 0.47; h = 0.45;
				};

				class TransBtn : VAS_RscButtonMenu
				{
					idc = -1;
					moving = 1;
					text = "$STR_VAS_Load_TransferBtn";
					onButtonClick = "[] call VAS_fnc_transferAction";
					x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
					y = 0.8 - (1 / 25);
					w = (6.25 / 40);
					h = (1 / 25);
				};
			};
		};

		class TransferSaveMenu : VAS_RscControlsGroup
		{
			idc = 2700;
			moving = 1;

			class Controls
			{
				class VAS_RscTitleBackground:VAS_RscText
				{
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
					idc = -1;
					moving = 1;
					x = 0.1;
					y = 0.2;
					w = 0.6;
					h = (1 / 25);
				};

				class MainBackground:VAS_RscText {
					colorBackground[] = {0, 0, 0, 0.7};
					idc = -1;
					moving = 1;
					x = 0.1;
					y = 0.2 + (11 / 250);
					w = 0.6;
					h = 0.6 - (22 / 250);
				};

				class Title : VAS_RscTitle {
					colorBackground[] = {0, 0, 0, 0};
					idc = -1;
					moving = 1;
					text = "$STR_VAS_Save_Title";
					x = 0.1;
					y = 0.2;
					w = 0.6;
					h = (1 / 25);
				};

				class SaveLoadoutList : VAS_RscListBox
				{
					idc = 2711;
					moving = 1;
					text = "";
					sizeEx = 0.035;

					x = 0.12; y = 0.26;
					w = 0.230; h = 0.360;
				};

				class SaveFetchList : VAS_RscListBox
				{
					idc = 2513;
					moving = 1;
					colorBackground[] = {0,0,0,0};
					text = "";
					sizeEx = 0.030;

					x = 0.35; y = 0.26;
					w = 0.330; h = 0.360;
				};

				class SaveLoadEdit : VAS_RscEdit
				{
					idc = 2712;
					moving = 1;
					text = "$STR_VAS_Save_CLN";

					x = -0.05 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
					y = 0.73 - (1 / 25);
					w = (13 / 40);
					h = (1 / 25);
				};

				class GearSaveMenu : VAS_RscButtonMenu
				{
					idc = -1;
					moving = 1;
					text = "$STR_VAS_Save_btnSave";
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
					onButtonClick = "[] call VAS_fnc_transferSaveGear";
					x = 0.35 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
					y = 0.73 - (1 / 25);
					w = (6.25 / 40);
					h = (1 / 25);
				};
			};
		};
	};
};


// partie sauvegarde profil
class VAS_Save_Diag {
	idd = 2510;
	name= "Virtual_Ammobox_Sys Save";
	movingEnable = 1;
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[0] spawn VAS_fnc_SaveLoad";

	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class MainBackground:VAS_RscText {
			// colorBackground[] = {0, 0, 0, 0.7};
			// idc = -1;
			// moving = 1;
			// x = 0.1;
			// y = 0.2 + (11 / 250);
			// w = 0.6;
			// h = 0.6 - (22 / 250);
			colorBackground[] = {0, 0, 0, 0.8};
			idc = -1;
			moving = 1;
			x = -0.2;
			y = 0.1 + (11 / 250);
			w = 1.385;
			h = 1 - (22 / 250);

		};
	};



	class controls
	{
	// titre partie sauvegarde
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0.8};
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Save_Title";
			x = -0.1;
			y = 0.1;
			w = 1.278;
			h = (1 / 25);
		};

		class SaveLoadoutList : VAS_RscListBox
		{
			idc = 2511;
			moving = 1;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[0] spawn VAS_fnc_loadoutInfo";
			x = -0.2; y = 0.2;
			w = 0.430; h = 0.660;
		};

		class SaveFetchList : VAS_RscListBox
		{
			idc = 2513;
			moving = 1;
			colorBackground[] = {0,0,0,0};
			text = "";
			sizeEx = 0.030;
			x = 0.35; y = 0.2;
			w = 0.530; h = 0.660;
		};


		class CloseSaveMenu : VAS_RscButtonMenu {
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Main_btnClose";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.8};
			onButtonClick = "closeDialog 0;";
			// x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			// y = 0.8 - (1 / 25);
			// w = (6.25 / 40);
			// h = (1 / 25);
			x = -0.2; y = 0.1;
			w = (3.25 / 40);
			h = (1 / 25);
		};

		// nom du profil a saisir
		class SaveLoadEdit : VAS_RscEdit
		{
			idc = 2512;
			moving = 1;
			text = "$STR_VAS_Save_CLN";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.95 - (1 / 25);
			w = (15 / 40);
			h = (1 / 25);
		};
		// bouton sauvegarde
		class GearSaveMenu : VAS_RscButtonMenu {
			idc = -1;
			moving = 1;
			text = "$STR_VAS_Save_btnSave";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call VAS_fnc_saveGear";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1.02 - (1 / 25);
			w = (15 / 40);
			h = (1 / 25);
		};
	};
};

class VAS_prompt
{
	idd = 2550;
	name = "Virtual_Ammobox_sys_prompt";
	movingEnable = 1;
	movingEnabled = 1;
	enableSimulation = 1;

	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			moving = 1;
			x = 0.3;
			y = 0.2;
			w = 0.47;
			h = (1 / 25);
		};

		class MainBackground:VAS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			moving = 1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.47;
			h = 0.22 - (22 / 250);
		};
	};

	class controls
	{
		class InfoMsg : VAS_RscStructuredText
		{
			idc = 2551;
			moving = 1;
			sizeEx = 0.020;
			text = "";
			x = 0.287;
			y = 0.2 + (11 / 250);
			w = 0.5; h = 0.12;
		};

		class addtogun : VAS_RscButtonMenu {
			idc = 2552;
			moving = 1;
			text = "$STR_VAS_Prompt_addToWeapon";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "vas_prompt_choice = true; closeDialog 0;";
			x = 0.145 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class addtogear : VAS_RscButtonMenu {
			idc = 2553;
			moving = 1;
			text = "$STR_VAS_Prompt_addToInv";
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "vas_prompt_choice = false; closeDialog 0;";
			x = 0.455 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class blankPHVAS : VAS_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			moving = 1;
			x = 0.304 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (5.9 / 40);
			h = (1 / 25);
		};
	};
};