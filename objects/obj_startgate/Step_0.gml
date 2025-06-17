if surface_exists(bg_surf)
{
	for (var i = 0; i < array_length(bg_parallax); i++) 
	{
		with bg_parallax[i] // with the current layer
			x += spd // increment its x with its speed
	}
}

if obj_player.visible && save_exists
{
	if (level_name_ext != "" && distance_to_object(obj_player) < 50)
		msgy = approach(msgy, screen_h - 50, 5)
		else
		msgy = approach(msgy, screen_h + 10, 5)
	if distance_to_object(obj_player) < 50 && !spanwed_score
	{
		spanwed_score = true
		alarm[0] = 1
	}
}

var flick = 0
with obj_player
{
	if (sprite_index == spr_startgate && !obj_fade.fade && image_speed > 0 && anim_ended())
	{
		flick++
		image_speed = 0
	}
	
}

if flick == instance_number(obj_player)
{
	reset_level()
	global.level_data.level_name = level_name
	do_fade(t_room, t_door, fade_types.door)
	with instance_create(0, 0, obj_titlecard)
		image_index = other.card_index
}


