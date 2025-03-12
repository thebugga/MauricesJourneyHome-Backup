function scr_player_ratmountattack()
{
	image_speed = 0.35
	hsp = (Xscale * movespeed)
	vsp = 0
	move = (key_left + key_right)
	landAnim = 0
	if (movespeed < 10 && grounded)
		movespeed += 0.5
	else if (!grounded)
		movespeed = 10
	if (key_jump)
	{
		state = states.ratmountgroundpound
	    sprite_index = spr_lonegustavo_jumpstart
	    image_index = 0
	    image_speed = 0.35
	    gustavokicktimer = 2
	    brick = false
	    with (instance_create((x - Xscale * 10), (y + 60), obj_ratmountgroundpound))
	    {
	        image_xscale = other.Xscale
	        image_index = 0
	    }
	}
	if (animation_end())
	{
		state = states.ratmount
		movespeed *= Xscale
	}
	if (place_meeting_solid((x + Xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x + Xscale), y, obj_destructibles))))
		ledge_bump((vsp >= 0 ? 32 : 22))
	exit;
}

