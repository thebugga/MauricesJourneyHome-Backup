function scr_player_slam()
{
	if (windingAnim < 200)
		windingAnim += 5
	Move = (key_left + key_right)
	if (!grounded)
		hsp = (Move * Movespeed)
	if ((place_meeting_solid((x + 1), y) && Xscale == 1) or (place_meeting_solid((x - 1), y) && Xscale == -1))
		Movespeed = 0
	if (Move == 0)
		Movespeed = 0
	if (Move != 0 && Movespeed < 4)
		Movespeed += 0.5
	if (Xscale == 1 && Move == -1)
		Movespeed = 0
	if (Xscale == -1 && Move == 1)
		Movespeed = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	MoveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	if (floor(image_index) == 8)
		state = states.normal
	if (Move != 0)
		Xscale = Move
	if (floor(image_index) == 3 && (!grounded))
		image_speed = 0
	else if (grounded && slamming == 0 && vsp > 0)
	{
		slamming = 1
		hsp = 0
		image_speed = 0.35
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		with (obj_parent_enemy)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				vsp = -7
				hsp = 0
			}
		}
	}
	sprite_index = spr_player_slam
	exit;
}

