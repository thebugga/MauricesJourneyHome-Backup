for (var i = 0; i < array_length(pause_menu); i++)
	array_delete(pause_menu, i, 3)
if (room == characterselect or room == rm_levelselect or string_copy(room_get_name(room), 1, 3) == "hub")
{
	pause_menu[0] = ["RESUME", spr_player_idle, function()
	{
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout)
		exit;
	}
	]
	pause_menu[1] = ["OPTIONS", spr_player_bossintro, function()
	{
		//scr_soundeffect(sfx_enemyprojectile)
		instance_create(x, y, obj_option)
		exit;
	}
	]
	pause_menu[2] = ["EXIT TO MENU", spr_peppinoswitch1, function()
	{
		pause = 0
		instance_activate_all()
		room = Mainmenu
		scr_playerreset()
		obj_player1.targetDoor = "A"
		if instance_exists(obj_player2)
			obj_player2.targetDoor = "A"
		global.cowboyhat = 0
		global.coop = false
		exit;
	}
	]
}
else
{
	pause_menu[0] = ["RESUME", spr_player_idle, function()
	{
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout)
		exit;
	}
	]
	pause_menu[1] = ["OPTIONS", spr_player_bossintro, function()
	{
		//scr_soundeffect(sfx_enemyprojectile)
		instance_create(x, y, obj_option)
		exit;
	}
	]
	pause_menu[2] = ["RESTART", spr_player_panic, function()
	{
		var roomname = room_get_name(room)
		if (!global.snickchallenge)
		{
			var rm = -4
			rm = global.leveltorestart
			ds_list_clear(global.saveroom)
			ds_list_clear(global.baddieroom)
			if (rm != -4 && rm != -1)
			{
				instance_activate_all()
				global.levelreset = 0
				scr_playerreset()
				global.levelreset = 1
				scr_room_goto(rm)
				pause = 0
				obj_player1.targetDoor = "A"
				obj_player1.input_buffer_jump = 0
				if instance_exists(obj_player2)
				{
					obj_player2.targetDoor = "A"
					obj_player2.input_buffer_jump = 0
				}
			}
		}
		exit;
	}
	]
	pause_menu[3] = ["EXIT", spr_player_winding, function()
	{
		pause = 0
		instance_activate_all()
		scr_playerreset()
		global.levelreset = 1
		obj_player1.targetDoor = "N"
		obj_player1.x = obj_player1.backtohubstartx
		obj_player1.y = obj_player1.backtohubstarty
		if instance_exists(obj_player2)
		{
			obj_player2.targetDoor = "N"
			obj_player2.x = obj_player2.backtohubstartx
			obj_player2.y = obj_player2.backtohubstarty
		}
		room = obj_player1.backtohubroom
		exit;
	}
	]
}