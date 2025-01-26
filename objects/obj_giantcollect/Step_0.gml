if place_meeting(x, y, obj_destructibles)
	depth = 102
else
	depth = 2
if !visible
{
	with (obj_parent_player)
	{
		sprite_index = spr_machfreefall
		hsp = Approach(hsp, 0, 0.2)
		vsp = Approach(vsp, 0, 0.2)
		if other.alarm[0] < 50
		{
			scale_xs = Approach(scale_xs, 0, 0.05)
			scale_ys = Approach(scale_ys, 0, 0.05)
		}
	}
}