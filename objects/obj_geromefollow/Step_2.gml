event_inherited()
if room == treasureroom && playerid.x >= 320
{
	instance_create(x, y, obj_geromeanim)
	with obj_parent_player
	{
		state = states.actor
		hsp = 0
		sprite_index = spr_idle
		image_speed = 0.35
	}
	instance_destroy()
}