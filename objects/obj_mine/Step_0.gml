if (place_meeting(x, y, obj_parent_player) && image_speed == 0)
{
	//scr_soundeffect(sfx_mine)
	image_speed = 0.35
}
if (animation_end())
	instance_destroy()
