pause = false;
var rm = room;
if !hub
{
	gamesave_async_save()
	room = Mainmenu;
	with obj_player1
	{
		character = "P";
		scr_characterspr();
	}
	global.leveltosave = noone;
	global.leveltorestart = noone;
	scr_playerreset();
	alarm[0] = 2;
	with obj_parent_player
	{
		targetRoom = Mainmenu;
		targetDoor = "A";
		state = states.titlescreen;
	}
	global.cowboyhat = false;
	global.coop = false;
}
else
{
	global.levelreset = false;
	scr_playerreset();
	with obj_player1
		swap_player();
	global.levelreset = true;
	with obj_parent_player
	{
		room = backtohubroom;
		targetDoor = "HUB";
	}
	global.leveltorestart = noone;
	global.leveltosave = noone;
}
/*
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
*/