function scr_player_skateboard()
{
	machhitAnim = 0
	crouchslideAnim = 1
	hsp = (Xscale * Movespeed)
	if key_jump
	{
		state = states.mach2
		vsp = -6
		with (instance_create((x + (Xscale * Movespeed)), y, obj_skateboard))
		{
			Xscale = other.Xscale
			hsp = other.hsp
			vsp = -5
		}
	}
	if (place_meeting_solid((x + 1), y) && Xscale == 1)
	{
		machhitAnim = 0
		state = states.bump
		hsp = -2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		instance_create((x + 10), (y + 10), obj_bumpeffect)
		instance_create(x, (y + 10), obj_skateboarddebris1)
		instance_create(x, (y + 10), obj_skateboarddebris2)
	}
	else if (place_meeting_solid((x - 1), y) && Xscale == -1)
	{
		machhitAnim = 0
		state = states.bump
		hsp = 2.5
		vsp = -3
		mach2 = 0
		image_index = 0
		instance_create((x - 10), (y + 10), obj_bumpeffect)
		instance_create(x, (y + 10), obj_skateboarddebris1)
		instance_create(x, (y + 10), obj_skateboarddebris2)
	}
	sprite_index = spr_player_skateboard
	image_speed = 0.35
	exit;
}

