function scr_maurice_roll()
{
	image_speed = 0.35
	if grounded || groundedSlope
		sprite_index = spr_roll
	else
		sprite_index = spr_dive
	hsp = movespeed * xscale
	if place_meeting_collision(x + (1 * xscale), y, obj_slope)
	{
		state = states.normal
		sprite_index = spr_idle
	}
	scr_taunt();
}