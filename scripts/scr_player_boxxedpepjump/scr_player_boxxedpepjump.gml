function scr_player_boxxedpepjump()
{
	Move = (key_left + key_right)
	if (boxxeddash == 1)
		image_speed = (abs(Movespeed) / 15)
	else
		image_speed = 0.5
	if (abs(hsp) <= 2)
		boxxeddash = 0
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railMovespeed = _railinst.Movespeed
		raildir = _railinst.dir
	}
	hsp = (Movespeed + (railMovespeed * raildir))
	if (place_meeting_solid((x + sign(hsp)), y) && Xscale == Move && ((!(place_meeting((x + Xscale), y, obj_slope))) or place_meeting_slope((x + Xscale), y)))
		Movespeed = 0
	if ((!key_jump2) && (!jumpstop) && vsp < 0)
	{
		jumpstop = 1
		vsp /= 5
	}
	if (Move != 0)
	{
		if (((Xscale > 0 && Movespeed < 8) or (Xscale < 0 && Movespeed > -8)) && Move == Xscale)
			Movespeed += (Xscale * 0.8)
		if (boxxeddash == 0)
			Xscale = Move
		else if (Move != Xscale)
			Movespeed = approach(Movespeed, 0, 0.8)
	}
	else if (boxxeddash == 0)
		Movespeed = approach(Movespeed, 0, 0.8)
	else
		Movespeed = approach(Movespeed, 0, 0.25)
	if grounded
	{
		state = states.boxxedpep
		sprite_index = spr_boxxedpepidle
	}
	if (key_jump && boxxedpepjump > 4)
	{
		jumpstop = 0
		sprite_index = spr_boxxedpep_flap
		image_index = 0
		repeat (7)
		{
			with (instance_create((x + random_range(-50, 50)), (y + random_range(0, 50)), obj_highjumpcloud2))
			{
				vspeed = 2
				sprite_index = spr_cloudeffect
			}
		}
		state = states.boxxedpepjump
		boxxedpepjump *= 0.9
		vsp = (-boxxedpepjump)
	}
	if (sprite_index == spr_boxxedpep_flap && floor(image_index) == (image_number - 1))
		sprite_index = spr_boxxedpepair
	if key_slap2
	{
		state = states.boxxedpepspin
		sprite_index = spr_boxxedpep_spin
		image_index = 0
	}
	exit;
}

