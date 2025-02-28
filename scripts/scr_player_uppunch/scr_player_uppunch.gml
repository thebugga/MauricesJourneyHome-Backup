function scr_player_uppunch()
{
	Move = (key_left + key_right)
	if grounded
	{
		if (dir != Xscale)
		{
			dir = Xscale
			Movespeed = 2
			facehurt = 0
		}
		jumpstop = 0
		anger = 100
		if (!(place_meeting(x, (y + 1), obj_railparent)))
			hsp = (Move * Movespeed)
		else
		{
			var _railinst = instance_place(x, (y + 1), obj_railparent)
			hsp = ((Move * Movespeed) + (_railinst.Movespeed * _railinst.dir))
		}
		if (Move != 0)
		{
			if (Movespeed < 7)
				Movespeed += 0.5
			else if (floor(Movespeed) == 7)
				Movespeed = 7
		}
		else
			Movespeed = 0
		if (Movespeed > 7)
			Movespeed -= 0.1
		if (Move != 0)
		{
			if (Movespeed < 3 && Move != 0)
				image_speed = 0.35
			else if (Movespeed > 3 && Movespeed < 6)
				image_speed = 0.45
			else
				image_speed = 0.6
		}
		else
			image_speed = 0.35
	}
	if (!grounded)
	{
		if (momemtum == 0)
			hsp = (Move * Movespeed)
		else
			hsp = (Xscale * Movespeed)
		if (Move != Xscale && momemtum == 1 && Movespeed != 0)
			Movespeed -= 0.05
		if (Movespeed == 0)
			momemtum = 0
		if ((Move == 0 && momemtum == 0) or place_meeting_solid((x + hsp), y))
		{
			Movespeed = 0
			mach2 = 0
		}
		if (Move != 0 && Movespeed < 7)
			Movespeed += 0.25
		if (Movespeed > 7)
			Movespeed -= 0.05
		if ((place_meeting_solid((x + 1), y) && Move == 1) or (place_meeting_solid((x - 1), y) && Move == -1))
			Movespeed = 0
		if (dir != Xscale)
		{
			mach2 = 0
			dir = Xscale
			Movespeed = 0
		}
		if (Move == (-Xscale))
		{
			mach2 = 0
			Movespeed = 0
			momemtum = 0
		}
		landAnim = 1
		if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
		{
			vsp /= 5
			jumpstop = 1
		}
		if (ladderbuffer > 0)
			ladderbuffer--
		if (place_meeting_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
		{
			vsp = grav
			jumpstop = 1
		}
	}
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	MoveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (floor(image_index) == (image_number - 1) or Move == (-Xscale))
		state = states.normal
	sprite_index = spr_uppunch
	image_speed = 0.35
	exit;
}

