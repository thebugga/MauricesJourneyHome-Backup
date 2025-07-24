function player_slide() 
{
	image_speed = 0.35
	
	if sprite_index == spr_machslidestart
	{
		hsp = movespeed * xscale
		movespeed = approach(movespeed, 0, 0.4)
		if anim_ended()
			image_speed = 0;
		if (scr_hitwall(x + xscale, y, obj_solid))
		{
			reset_anim(spr_wallsplat)
			event_play_oneshot_3d("event:/sfx/player/splat", x, y)
			state = states.bump
		}
		if !movespeed
		{
			reset_anim(obj_player.spr_machslideend)
			state = states.normal
		}
	}
	else
	{
		if grounded
			hsp = approach(hsp, (movespeed + 1) * -xscale, 0.5)
		
		var ismach2 = movespeed < 10

		if anim_ended()
			image_index = image_number - 3
		if (scr_hitwall(x - xscale, y, obj_solid))
		{
			reset_anim(spr_wallsplat)
			event_play_oneshot_3d("event:/sfx/player/splat", x, y)
			state = states.bump
		}
		if (hsp * -xscale) >= min(movespeed, 10)
		{
			sprite_index = ismach2 ? spr_mach2 : spr_mach3
			state = ismach2 ? states.mach2 : states.mach3
			movespeed = min(movespeed, 10)
			xscale *= -1
		}
	}
	instakill = sprite_index == spr_machslideboost3;
}