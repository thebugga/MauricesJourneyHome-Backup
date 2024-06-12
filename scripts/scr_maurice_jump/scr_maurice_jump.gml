function scr_maurice_roll()
{
	image_speed = 0.35
	if grounded || groundedSlope
		sprite_index = spr_roll
	else
		sprite_index = spr_dive
	hsp = movespeed * xscale
	if !key_down && (!(place_meeting_collision((x + 27), (y - 32)))) && (!(place_meeting_collision((x - 27), (y - 32)))) && (!(place_meeting_collision(x, (y - 32)))) && (!(place_meeting_collision(x, (y - 16))))
	{
		if movespeed < 11 && key_attack && sprite_index != spr_dive
		{
			state = states.mach
			sprite_index = spr_mach
		}
		if movespeed > 11 && key_attack && sprite_index != spr_dive
		{
			state = states.mach3
			sprite_index = spr_mach3
		}
		if !key_attack && sprite_index != spr_dive
		{
			state = states.slide
			image_index = 0
			sprite_index = spr_machslide
		}
	}
	if place_meeting_collision(x + (1 * xscale), y, obj_slope)
	{
		state = states.normal
		sprite_index = spr_idle
	}
	if !grounded && !groundedSlope
	{
		vsp = 26
	}
	scr_taunt();
}