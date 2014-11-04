in missions.pbo open the init.sqf

 

add this to the variables

DZE_AsReMix_PLAYER_HUD = true;

Search for 

if (!isDedicated) then {

after that add this

    if (DZE_AsReMix_PLAYER_HUD) then {
        execVM "Scripts\Player_Hud\playerHud.sqf"

creat a folder Scripts
