function scr_player_balloon()
{
	sprite_index = spr_player_ratballoon
	hsp = Movespeed
	Move = (key_left + key_right)
	vsp = -5
	
	if (Move != 0)
		Movespeed = approach(Movespeed, (Move * 6), 0.35)
	else
		Movespeed = approach(Movespeed, 0, 0.35)
	
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
		Movespeed = 0
	
	if (balloonbuffer > 0)
		balloonbuffer--
	else
	{
		create_particle(x, (y - 20), particle.genericpoofeffect, 0)
		instance_create(x, (y - 20), obj_balloongrabbableeffect)
		state = states.jump
		sprite_index = spr_fall
		jumpAnim = 0
	}
	
	if key_jump
	{
		create_particle(x, (y - 20), particle.genericpoofeffect, 0)
		instance_create(x, (y - 20), obj_balloongrabbableeffect)
		state = states.jump
		sprite_index = spr_jump
		image_index = 0
		jumpAnim = 1
		Movespeed = abs(Movespeed)
		vsp = -11
		jumpstop = 0
	}
}
