function scr_player_ratmountattack()
{
	image_speed = 0.35
	hsp = (xscale * Movespeed)
	vsp = 0
	Move = (key_left + key_right)
	landAnim = 0
	if (Movespeed < 10 && grounded)
		Movespeed += 0.5
	else if (!grounded)
		Movespeed = 10
	if (key_jump && (!doublejump))
	{
		doublejump = 1
		vsp = -11
		state = states.ratmountjump
		jumpstop = 0
		sprite_index = spr_player_ratmountwalljump
	}
	if (floor(image_index) == (image_number - 1))
		state = states.ratmount
	if (place_meeting_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
		ledge_bump((vsp >= 0 ? 32 : 22))
	exit;
}

