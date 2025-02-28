if string_copy(room_get_name(room), 1, 3) == "hub"
{
	with (obj_camera)
	{
	    shake_mag = 4
	    shake_mag_acc = (3 / room_speed)
	}
	with obj_parent_player
	{
		y -= 25
		state = states.slipbanan
		visible = true
		Movespeed = 10
		vsp = -10
	}
}
instance_destroy()