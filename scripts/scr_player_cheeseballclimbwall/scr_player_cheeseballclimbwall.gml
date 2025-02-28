function scr_player_cheeseballclimbwall()
{
	hsp = 0
	vsp = (-WallMovespeed)
	if (place_meeting_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
	{
		//scr_soundeffect(sfx_groundpound)
		image_index = 0
		Movespeed = 0
		cheesepeptimer = 2
		state = states.cheesepepjump
		sprite_index = spr_cheesepepfall
		repeat (8)
			create_debris((x + random_range(-8, 8)), (y + random_range(-8, 8)), spr_cheesechunk)
	}
	WallMovespeed = approach(WallMovespeed, 12, 1)
	if (!(place_meeting_solid((x + Xscale), y)))
	{
		if (Movespeed > 8)
			Movespeed = 8
		instance_create(x, y, obj_jumpdust)
		vsp = 0
		state = states.cheeseball
		Movespeed = WallMovespeed
		hsp = (Xscale * Movespeed)
	}
	if key_jump
	{
		vsp = -6
		Movespeed = 6
		state = states.cheeseball
		repeat (4)
			create_debris((x + (Xscale * 30)), (y + random_range(-8, 8)), spr_slimedebris)
		Xscale *= -1
	}
	if (grounded && (floor(image_index) % 4) == 0)
		create_debris((x + (Xscale * 30)), y, spr_slimedebris)
	exit;
}

