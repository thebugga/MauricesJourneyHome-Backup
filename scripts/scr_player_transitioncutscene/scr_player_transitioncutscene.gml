function scr_player_transitioncutscene()
{
	costumercutscenetimer--
	global.heattime = 60
	if (sprite_index == spr_player_knock && costumercutscenetimer < 0)
	{
		Xscale *= -1
		hsp = 5
		sprite_index = spr_player_move
		costumercutscenetimer = 35
	}
	if (sprite_index == spr_player_move && costumercutscenetimer < 0)
	{
		with (obj_costumerdoor)
		{
			image_index = 1
			instance_create(x, y, obj_costumer)
		}
		image_index = 0
		hsp = 0
		Xscale *= -1
		sprite_index = spr_player_givepizza
	}
	if (sprite_index == spr_player_levelcomplete && costumercutscenetimer < 0)
	{
		if (grounded && x > (other.x + 32) && x < (other.x + 160) && key_up && (state == states.normal or state == states.mach1 or state == states.mach2 or state == states.mach3))
		{
				if ((global.collect + global.collectN) >= global.srank)
	{
		global.rank = "s"
		if (scr_is_prank())
			global.rank = "p"
		if (global.snickchallenge == 1)
			global.SAGEsnicksrank = 1
	}
	else if ((global.collect + global.collectN) > global.arank)
		global.rank = "a"
	else if ((global.collect + global.collectN) > global.brank)
		global.rank = "b"
	else if ((global.collect + global.collectN) > global.crank)
		global.rank = "c"
	else
		global.rank = "d"
			ini_open("saveData.ini")
			if (!instance_exists(obj_endlevelfade))
				instance_create(x, y, obj_endlevelfade)
			if (state != states.door)
			{
				audio_stop_all()
				state = states.door
				obj_endlevelfade.alarm[0] = 235
				image_index = 0
			}
		}
	}
	if (sprite_index == spr_player_givepizza && animation_end())
		image_speed = 0
	if (sprite_index == spr_player_levelcomplete && animation_end())
		image_speed = 0
	exit;
}

