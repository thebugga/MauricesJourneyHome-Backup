function scr_player_ratmountballoon()
{
	sprite_index = spr_player_ratmountballoon
	hsp = Movespeed
	Move = (key_left + key_right)
	if (vsp < 2)
		vsp += 0.1
	else
		vsp = 2
	if (Move != 0)
		Movespeed = approach(Movespeed, (Move * 8), 0.5)
	else
		Movespeed = approach(Movespeed, 0, 0.5)
	var _jump = 0
	if (balloonbuffer > 0)
		balloonbuffer--
	else
		_jump = 1
	if key_jump
		_jump = 1
	if _jump
	{
		create_particle(x, y, particle.ratmountballooncloud, 0)
		state = states.ratmountjump
		sprite_index = spr_player_ratmountballoonend1
		image_index = 0
		jumpAnim = 1
		vsp = -20
		jumpstop = 1
	}
	exit;
}

