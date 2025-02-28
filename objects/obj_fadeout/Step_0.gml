if (fadealpha > 1)
{
	obj_camera.lock = false
	fadein = 1
	if instance_exists(obj_parent_player)
	{
		if (custom_level == 0)
		{
	        if gamestart
	        {
	            ini_open_from_string(obj_savesystem.ini_str)
	            global.file_minutes = ini_read_real("Game", "minutes", 0)
	            global.file_seconds = ini_read_real("Game", "seconds", 0)
	            ini_close()
	        }
	        if restarttimer
	        {
	            global.level_minutes = 0
	            global.level_seconds = 0
	        }
			with (obj_parent_player)
			{
				if place_meeting(x, y, obj_goldendoor)
					game_restart()
			}
			if (room != obj_player1.targetRoom or roomreset)
			{
				scr_room_goto(obj_player1.targetRoom)
				with (obj_parent_player)
				{
					if (state == states.ejected or state == states.policetaxi)
					{
						visible = true
						state = states.normal
					}
				}
			}
			if (global.coop == true)
			{
				if (room != obj_player2.targetRoom or roomreset)
					scr_room_goto(obj_player1.targetRoom)
				with (obj_parent_player)
				{
					if (state == states.ejected)
						state = states.normal
				}
				with (obj_player2)
				{
					if instance_exists(obj_swapmodefollow)
						state = states.gotoplayer
				}
			}
		}
	}
}
if (fadein == 0)
	fadealpha += 0.1
else if (fadein == 1)
	fadealpha -= 0.1
if instance_exists(obj_parent_player)
{
	with (obj_player1)
	{
		if (other.fadein == 1 && (obj_player1.state == states.door or obj_player1.state == states.victory) && (sprite_index == spr_victory or place_meeting(x, y, obj_door) or place_meeting(x, y, obj_startgate) or place_meeting(x, y, obj_exitgate)))
		{
			state = states.comingoutdoor
			image_index = 0
			if (global.coop == true)
			{
				obj_player2.state = states.comingoutdoor
				obj_player2.image_index = 0
			}
		}
		if (other.fadein == 1 && obj_player1.state == states.door && (obj_player1.sprite_index == spr_downpizzabox or obj_player1.sprite_index == spr_uppizzabox))
		{
			state = states.crouchjump
			if (global.coop == true)
				obj_player2.state = states.crouchjump
		}
		if (other.fadein == 1 && obj_player1.lastroom == characterselect && obj_player1.state != states.machslide)
		{
			Xscale = 1
			movespeed = 12
			sprite_index = spr_machslidestart;
			if global.playerCharacter == Characters.Maurice
				fmod_event_one_shot_3d("event:/sfx/maurice/break", x, y);
			else
				fmod_event_one_shot_3d("event:/sfx/playerN/break", x, y);
			state = states.machslide;
			image_index = 0;
			launched = false;
			if (global.coop == true)
			{
				obj_player2.Xscale = 1
				obj_player2.movespeed = 12
				obj_player2.sprite_index = spr_machslidestart;
				if global.playerCharacter == Characters.Maurice
					fmod_event_one_shot_3d("event:/sfx/maurice/break", x, y);
				else
					fmod_event_one_shot_3d("event:/sfx/playerN/break", x, y);
				obj_player2.state = states.machslide;
				obj_player2.image_index = 0;
				obj_player2.launched = false;
			}
		}
	}
	if instance_exists(obj_player2)
	{
		with (obj_player2)
		{
			if (other.fadein == 1 && (obj_player2.state == states.door or obj_player2.state == states.victory) && (place_meeting(x, y, obj_door) or place_meeting(x, y, obj_startgate)))
			{
				state = states.comingoutdoor
				image_index = 0
				if (global.coop == true)
				{
					obj_player1.state = states.comingoutdoor
					obj_player1.image_index = 0
				}
			}
			if (other.fadein == 1 && obj_player2.state == states.door && (obj_player2.sprite_index == spr_downpizzabox or obj_player2.sprite_index == spr_uppizzabox))
			{
				state = states.crouchjump
				if (global.coop == true)
					obj_player1.state = states.crouchjump
			}
		}
	}
	with (obj_player2)
	{
		if instance_exists(obj_swapmodefollow)
			state = states.gotoplayer
	}
}
if (fadein == 1 && fadealpha < 0)
	instance_destroy()
