if sprite_index != spr_bigmushroom_bounce
{
	other.jumpstop = true;
	with other
	{
		grounded = false;
		if (state == states.normal || state == states.groundpound)
			state = states.jump;
		if state == states.climbwall
			state = states.mach2;
	}
	if (sprite_index != spr_bigmushroom_bounce || image_index > 5)
		fmod_event_one_shot_3d("event:/sfx/misc/mushroombounce", x, y);
	sprite_index = spr_bigmushroom_bounce;
	image_index = 0;
	other.vsp = -14;
}
