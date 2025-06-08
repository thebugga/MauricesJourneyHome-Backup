function player_bounce()
{
	image_speed = 0.35;
	sprite_index = spr_mach2jump;
	hsp = xscale * movespeed;
	movespeed += 0.1;
	if movespeed >= 12
	{
		state = states.mach3;
		sprite_index = spr_mach3;
		movesped = 12;
	}
	
	if (key_down.down) && character == p_characters.maurice
	{
		sprite_index = spr_poundcancel1
		state = states.groundpound
		freefallsmash = movespeed
		hsp = 0
		vsp = movespeed
		dir = xscale
		event_play_oneshot_3d("event:/sfx/player/dive", x, y)
	}
}