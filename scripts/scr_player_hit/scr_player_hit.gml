function scr_player_hit()
{
	hsp = 0
	vsp = 0
	x = (hitX + random_range(-4, 4))
	y = (hitY + random_range(-4, 4))
	hitLag--
	Xscale = hitXscale
	image_speed = 0
	if (hitLag <= 0)
	{
		//scr_soundeffect(sfx_pephurt)
		image_speed = 0.35
		x = hitX
		y = hitY
		if (!(place_meeting(x, (y - 1), obj_solid)))
		{
			y--
			grounded = false
		}
		if place_meeting_solid(x, y)
			y -= 5
		Movespeed = abs(hithsp)
		vsp = hitvsp
		state = states.thrown
		stunned = hitstunned
	}
	exit;
}

