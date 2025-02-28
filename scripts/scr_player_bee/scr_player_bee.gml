function scr_player_bee()
{
	image_speed = 0.8
	sprite_index = spr_hurtwalk
	movespeed = 10
	hsp = (Xscale * movespeed)
	if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
		Xscale *= -1
	if (bee_buffer > 0)
		bee_buffer--
	else
		state = states.normal
}
