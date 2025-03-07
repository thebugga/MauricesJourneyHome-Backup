function scr_player_shoulderbash()
{
	movespeed = (sprite_index == spr_mach1 ? shoulderbash_mspeed_start : approach(movespeed, shoulderbash_mspeed_loop, 0.5))
	hsp = (Xscale * movespeed)
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create((x + 5), (y - 5), obj_chargeeffect))
		{
			playerid = other.object_index
			other.chargeeffectid = id
			depth = (other.depth - 1)
		}
	}
	if (sprite_index == spr_mach1 && animation_end())
		sprite_index = spr_mach4
	if (sprite_index == spr_mach4 && (!key_attack))
	{
		state = states.normal
		image_index = 0
	}
	if key_jump
		input_buffer_jump = 0
	if grounded
		jumpstop = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = 1
	}
	if (input_buffer_jump < 8 && grounded)
	{
		vsp = (-shoulderbash_jumpspeed)
		//scr_soundeffect(sfx_jump)
	}
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, (y - 5), obj_dashcloud))
		{
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	if place_meeting((x + Xscale), y, obj_solid)
		state = states.normal
	exit;
}

