function scr_player_pizzathrow()
{
	movespeed = 0
	mach2 = 0
	hsp = 0
	Xscale = -1
	jumpstop = 0
	if (array_equals(global.goochlinggot, [0, 0, 0, 0, 0]))
	{
		state = states.normal
		landAnim = 0
		mach2 = 0
		image_index = 0
	}
	exit;
}

