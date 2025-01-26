if (active && x != xstart && (!(place_meeting(xstart, ystart, obj_parent_enemy))) && (!(place_meeting(xstart, ystart, obj_parent_player))))
{
	x = xstart
	y = ystart
}
else if (!active)
{
	x = ((xstart - room_width) - 100)
	x = ((ystart - room_height) - 100)
}
