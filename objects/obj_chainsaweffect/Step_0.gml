image_xscale = obj_parent_player.Xscale
if (obj_parent_player.state == states.chainsaw)
{
	x = obj_parent_player.x
	y = obj_parent_player.y
}
if (obj_parent_player.state == states.chainsawpogo)
{
	x = (obj_parent_player.x + ((-obj_parent_player.image_xscale) * 20))
	y = (obj_parent_player.y + 30)
}
if (obj_parent_player.state != states.chainsaw && obj_parent_player.state != states.chainsawpogo)
	instance_destroy()
image_speed = 0.35
