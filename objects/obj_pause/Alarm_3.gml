pause = false;
var rm = room;
if !hub
{
	obj_player1.targetRoom = ObjectnMacroloadinRoom;
	obj_player2.targetRoom = ObjectnMacroloadinRoom;
	room = ObjectnMacroloadinRoom;
	with obj_player1
	{
		character = "P";
		scr_characterspr();
	}
	global.leveltosave = noone;
	global.leveltorestart = noone;
	scr_playerreset();
	alarm[0] = 2;
	obj_player1.state = states.titlescreen;
	obj_player2.state = states.titlescreen;
	obj_player1.targetDoor = "A";
	obj_player2.targetDoor = "A";
	global.cowboyhat = false;
	global.coop = false;
}
else
{
	global.levelreset = false;
	scr_playerreset();
	with (instance_create(0, 0, obj_backtohub_fadeout))
		fadealpha = 0.9
	with obj_player1
		swap_player();
	global.levelreset = true;
	obj_player1.targetDoor = "HUB";
	if instance_exists(obj_player2)
		obj_player2.targetDoor = "HUB";
	global.leveltorestart = noone;
	global.leveltosave = noone;
}
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
