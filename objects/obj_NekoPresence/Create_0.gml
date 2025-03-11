/// @description Initialize Discord.

#macro DISCORD_APP_ID "1251993866530193508"

ready = false;

alarm[0] = room_speed * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}
largeimage = "3aescfat"
moretexta = ""
moretextb = ""
state = ""
details = "Maurice's Journey Home"
smallimage = "3aescfat"