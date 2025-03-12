function scr_player_lungegrab()
{
	hsp = (Xscale * movespeed)
	vsp = 0
	image_speed = 0.35
	if (place_meeting_solid((x + Xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x + Xscale), y, obj_destructibles))))
	{
		var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
		if _bump
		{
			jumpstop = 1
			state = states.jump
			vsp = -4
			sprite_index = spr_suplexbump
			instance_create((x + (Xscale * 10)), (y + 10), obj_bumpeffect)
		}
	}
	if (animation_end())
		state = states.normal
	exit;
}

