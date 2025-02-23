if place_meeting(x, y, obj_destructibles)
	depth = 102
else
	depth = 2
if !visible
{
	with (obj_parent_player)
	{
		sprite_index = spr_machfreefall
		hsp = approach(hsp, 0, 0.2)
		vsp = approach(vsp, 0, 0.2)
		if other.alarm[0] < 50
		{
			scale_xs = approach(scale_xs, 0, 0.05)
			scale_ys = approach(scale_ys, 0, 0.05)
		}
	}
}