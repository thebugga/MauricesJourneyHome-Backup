function scr_player_meteorpep()
{
	mach2 = 0
	landAnim = 1
	vsp = 0
	if (sprite_index == spr_meteorpep_impact && animation_end())
		sprite_index = spr_meteorpep_flying
	if (sprite_index == spr_meteorpep_flying)
	{
		if (movespeed <= 20)
			movespeed += 1
		hsp = floor(((-Xscale) * movespeed))
	}
	else
		hsp = 0
	if (place_meeting_solid((x - 1), y) && Xscale == 1 && hsp != 0)
	{
		movespeed = 0
		with (obj_parent_enemy)
		{
			if point_in_camera(x, y, view_camera[0])
			{
				vsp = -7
				hsp = 0
			}
		}
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		image_index = 0
		sprite_index = spr_meteorpep_land
	}
	if (place_meeting_solid((x + 1), y) && Xscale == -1 && hsp != 0)
	{
		movespeed = 0
		if point_in_camera(x, y, view_camera[0])
		{
			vsp = -7
			hsp = 0
		}
		with (obj_camera)
		{
			shake_mag = 10
			shake_mag_acc = (30 / room_speed)
		}
		image_index = 0
		sprite_index = spr_meteorpep_land
	}
	if (sprite_index == spr_meteorpep_land && animation_end())
		state = states.normal
	image_speed = 0.35
	exit;
}

