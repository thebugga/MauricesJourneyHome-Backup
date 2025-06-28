with other
{
	if state != states.ball
	{
		xscale = other.image_xscale
		sprite_index = spr_player_ball
		movespeed = 10
		state = states.ball
		x = other.x
		y = other.y
	}
}