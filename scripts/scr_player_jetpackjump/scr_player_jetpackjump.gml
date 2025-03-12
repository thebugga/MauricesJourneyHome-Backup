function scr_player_jetpackjump()
{
	alarm[5] = 2
	alarm[7] = 60
	landAnim = 0
	if (grounded && vsp > 0 && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, (y + vsp), obj_iceblock_breakable))))
		state = states.normal
	with (obj_iceblock_breakable)
	{
		if (place_meeting((x - other.hsp), y, other) || place_meeting((x - other.Xscale), y, other) || place_meeting(x, (y - other.vsp), other))
		{
			instance_destroy()
			if (other.vsp < 0)
				other.vsp = -14
			else if (other.vsp > -11)
				other.vsp = -11
			jumpstop = 0
		}
	}
	with (obj_destructibles)
	{
		if (place_meeting((x - other.hsp), y, other) || place_meeting((x - other.Xscale), y, other) || place_meeting(x, (y - other.vsp), other))
		{
			instance_destroy()
			if (other.vsp < 0)
				other.vsp = -14
			else if (other.vsp > -11)
				other.vsp = -11
			jumpstop = 0
		}
	}
	with (instance_place((x + Xscale), y, obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	with (instance_place(x, (y + 1), obj_tntblock))
	{
		instance_destroy()
		if (other.vsp > -11)
			other.vsp = -11
		jumpstop = 0
	}
	move = (key_left + key_right)
	dir = Xscale
	if (sprite_index != spr_rockethitwall || (!jetpackdash))
	{
		dir = Xscale
		if (sprite_index == spr_player_jetpackstart)
		{
			sprite_index = spr_player_jetpackmid
			image_index = 0
		}
		else if (sprite_index == spr_player_jetpackmid && animation_end())
			sprite_index = spr_player_jetpackend
		if (move != 0)
		{
			if (move != Xscale)
			{
				if (movespeed > 0)
					movespeed -= 0.75
				if (movespeed <= 0)
					Xscale = move
			}
			else if (movespeed < 8)
				movespeed += 0.75
		}
		if ((!doublejump) && key_slap2)
		{
			doublejump = 1
			//scr_soundeffect(sfx_explosion)
			instance_create(x, y, obj_playerexplosion)
			sprite_index = spr_rockethitwall
			jetpackbounce = 1
			image_index = 0
			if (move != 0)
				Xscale = move
			dir = Xscale
			movespeed = 12
			jetpackdash = 1
		}
		hsp = (Xscale * movespeed)
	}
	else if jetpackdash
	{
		image_speed = 0.35
		hsp = (Xscale * movespeed)
		vsp = 0
		if (animation_end())
			jetpackdash = 0
	}
	if (place_meeting((x + Xscale), y, obj_solid) && (!(place_meeting((x + Xscale), y, obj_destructibles))))
		movespeed = 0
	if (sprite_index == spr_rockethitwall && jetpackbounce == 1 && place_meeting((x + Xscale), y, obj_solid) && (!(place_meeting((x + Xscale), y, obj_destructibles))))
	{
		jetpackdash = 0
		instance_create((x + (Xscale * 10)), y, obj_bangeffect)
		jetpackbounce = 0
		vsp = -11
		image_index = 0
	}
	hsp = (Xscale * movespeed)
	if (firemouth_afterimage > 0)
		firemouth_afterimage--
	else
	{
		firemouth_afterimage = 8
		create_firemouth_afterimage(x, y, sprite_index, (image_index - 1), Xscale)
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = (8 + irandom_range(-4, 2))
		create_heatpuff((x - (Xscale * 2)), y)
	}
	exit;
}

