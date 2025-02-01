function scr_player_gameover()
{
	cutscene = 1
	if obj_timesup.image_xscale < 10
	{
		sprite_index = sp_antonDied
		hsp = 0
		vsp = 0
		grav = 0
		alarm[10] = 90
		scale_xs = obj_timesup.image_xscale / 3
		scale_ys = obj_timesup.image_yscale / 3
	}
	else 
	{
		if sprite_index != sp_antonDiedFaceplant
		{
			sprite_index = sp_antonDiedFaceplant
			scale_xs = 1.55
			scale_ys = 1.55
			with obj_camera
			{
				shake_mag = 20
				shake_mag_acc = 40 / room_speed
			}
		}
		scale_xs = lerp(scale_xs, 1.5, 0.1)
		scale_ys = lerp(scale_ys, 1.5, 0.1)
	}
	if grav == 0
	{
		x = obj_timesup.x + lengthdir_x(timeup_dist * obj_timesup.image_xscale, timeup_angle + obj_timesup.image_angle)
		y = obj_timesup.y + lengthdir_y(timeup_dist * obj_timesup.image_xscale, timeup_angle + obj_timesup.image_angle)
		angle = timeup_anglediff + obj_timesup.image_angle
	}
	flash = 0
	alarm[0] = -1
	alarm[1] = -1
	alarm[3] = -1
	alarm[4] = -1
	alarm[5] = -1
	alarm[6] = -1
	alarm[7] = -1
	alarm[8] = -1
	alarm[9] = -1
	if (floor(image_index) == (image_number - 1))
	{
		if sprite_index == spr_deathstart
			image_index = 3
		else
			image_speed = 0
	}
	hurted = 0
	inv_frames = 0
	if place_meeting((x + floor(hsp)), y, obj_null)
	{
		x = floor(x)
		while (!(place_meeting((x + sign(hsp)), y, obj_null)))
			x += sign(hsp)
		hsp = 0
	}
	x += hsp
	if place_meeting(x, (y + floor(vsp)), obj_null)
	{
		y = floor(y)
		while (!(place_meeting(x, (y + sign(vsp)), obj_null)))
			y += sign(vsp)
		vsp = 0
	}
	y += floor(vsp)
	if (vsp < 30)
		vsp += grav
	exit;
}

