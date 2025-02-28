function scr_player_boots()
{
	landAnim = 0
	hsp = (Move * Movespeed)
	if (dir != Xscale)
	{
		dir = Xscale
		Movespeed = 2
		facehurt = 0
	}
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20
		jumpstop = 1
	}
	if (place_meeting_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
	{
		vsp = grav
		jumpstop = 1
	}
	if (grounded && input_buffer_jump < 8 && (!key_down) && vsp > 0)
	{
		jumpstop = 0
		//scr_soundeffect(sfx_jump)
		sprite_index = spr_playerV_bootsjump
		instance_create(x, y, obj_highjumpcloud2)
		vsp = -11
		image_index = 0
	}
	if key_jump
		input_buffer_jump = 0
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_bootsjump)
		sprite_index = spr_playerV_bootsfall
	Move = (key_left + key_right)
	if (Move != 0)
		Xscale = Move
	if (place_meeting_solid((x + sign(hsp)), y) && Xscale == 1 && Move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
		Movespeed = 0
	if (place_meeting_solid((x + sign(hsp)), y) && Xscale == -1 && Move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
		Movespeed = 0
	if (grounded && Move != 0 && sprite_index == spr_playerV_bootsidle)
		sprite_index = spr_playerV_bootsMove
	else if (grounded && Move == 0 && sprite_index == spr_playerV_bootsMove)
		sprite_index = spr_playerV_bootsidle
	if ((!grounded) && sprite_index != spr_playerV_bootsjump && sprite_index != spr_playerV_bootsfall)
		sprite_index = spr_playerV_bootsfall
	if (grounded && (sprite_index == spr_playerV_bootsfall or sprite_index == spr_playerV_bootsjump) && vsp > 0)
	{
		sprite_index = spr_playerV_bootsland
		image_index = 0
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_bootsland)
		sprite_index = spr_playerV_bootsidle
	if (!key_attack)
		state = states.normal
	if grounded
	{
		if (Move != 0)
		{
			if (Movespeed < 20)
				Movespeed += 0.35
			else if (floor(Movespeed) == 20)
				Movespeed = 14
		}
		else
			Movespeed = 0
		if (Movespeed > 20)
			Movespeed -= 0.1
	}
	if (Move != 0 && grounded)
	{
		Xscale = Move
		if (Movespeed < 6 && Move != 0)
			image_speed = 0.35
		else if (Movespeed > 6 && Movespeed < 8)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else
		image_speed = 0.35
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_bootsout)
		sprite_index = spr_playerV_bootsidle
	if (key_down && Movespeed > 12)
	{
		image_index = 0
		grav = 0.5
		sprite_index = spr_playerV_divekickstart
		machhitAnim = 0
		state = states.crouchslide
	}
	if (key_shoot2 && global.playerCharacter == Characters.MrOrange)
	{
		state = states.dynamite
		image_index = 0
		sprite_index = spr_playerV_dynamitethrow
		with (instance_create(x, y, obj_dynamite))
		{
			image_xscale = other.Xscale
			Movespeed = 6
			vsp = -6
		}
	}
	if (key_slap2 && global.playerCharacter == Characters.MrOrange)
	{
		state = states.revolver
		image_index = 0
		sprite_index = spr_playerV_revolverstart
		vsp = -5
	}
	if (Movespeed == 12 && (!instance_exists(speedlineseffectid)))
	{
		with (instance_create(x, y, obj_speedlines))
		{
			playerid = other.object_index
			other.speedlineseffectid = id
		}
	}
	if ((!instance_exists(dashcloudid)) && grounded && Move != 0)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	exit;
}

