function scr_player_bazooka()
{
	hsp = movespeed * Xscale
	var spd = key_up ? 0.5 : 1
	vsp = approach(vsp, 0, spd)
	movespeed = approach(movespeed, 0, 0.2)
	image_speed = 0.35
	if ((floor(image_index) == 7 || vsp >= 0) && sprite_index != spr_playerV_bazooka)
	{
		image_index = 0
		sprite_index = spr_playerV_bazooka
	}
	if (floor(image_index) == 12 && sprite_index == spr_playerV_bazooka)
	{
		jumpAnim = 1
		jumpstop = 1
		hsp = -10 * Xscale
		movespeed = -10
		vsp = -6
		with (instance_create(x + (Xscale * 10), y, obj_vigilantebazooka))
			image_xscale = other.Xscale
		state = states.jump
	}
}