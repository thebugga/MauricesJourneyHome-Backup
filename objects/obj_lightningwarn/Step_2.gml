if instance_exists(baddieID)
{
	if baddieID.state != states.shoot
		instance_destroy()
	if baddieID.image_index < 3 && followID != -4
	{
		x = followID.x
		y = followID.y
		depth = followID.depth - 1
	}
	else if baddieID.image_index >= 7
	{
		with instance_place(x, y, obj_player)
			do_hurt(other)
		instance_destroy()
	}
}
else
	instance_destroy()