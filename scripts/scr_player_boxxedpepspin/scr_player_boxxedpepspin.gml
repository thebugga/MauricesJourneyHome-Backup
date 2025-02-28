function scr_player_boxxedpepspin()
{
	image_speed = 0.5
	hsp = (Xscale * Movespeed)
	doublejump = 1
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railMovespeed = _railinst.Movespeed
		raildir = _railinst.dir
	}
	Move = (key_left + key_right)
	hsp = (Movespeed + (railMovespeed * raildir))
	if (Move != 0)
	{
		if (abs(Movespeed) <= 8)
			Movespeed += (Move * 0.3)
	}
	else
		Movespeed = approach(Movespeed, 0, 0.25)
	if grounded
	{
		vsp = -6
		instance_create(x, y, obj_stompeffect)
	}
	if (place_meeting_solid((x + sign(hsp)), y) && (!(place_meeting((x + hsp), y, obj_destructibles))) && ((!(place_meeting((x + hsp), y, obj_slope))) or place_meeting_slope((x + hsp), y)))
		Movespeed = (-((sign(hsp) * 6)))
	instance_destroy(instance_place((x + hsp), y, obj_destructibles))
	if (!key_slap)
	{
		state = states.boxxedpepjump
		sprite_index = spr_boxxedpepair
	}
	exit;
}

