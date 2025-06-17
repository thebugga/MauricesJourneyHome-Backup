if !active || obj_fade.fade
	exit
	
get_input()
var _m = (key_down.pressed - key_up.pressed)
selected_world = clamp(selected_world + _m, 0, array_length(world_array) - 1)
if _m != 0
	selected_level = 0
selected_level = clamp(selected_level + (key_right.pressed - key_left.pressed), 0, array_length(level_array[selected_world]) - 1)
	
if key_jump.pressed
{
	var _levelinfo = level_array[selected_world][selected_level]
	with obj_player
	{
		restart_location = {
			room: _levelinfo[1],
			door: "a",
			title: _levelinfo[0],
			name: _levelinfo[2]
		}
		reset_level()
		global.level_data.level_name = _levelinfo[2]
		do_fade(_levelinfo[1], "a", fade_types.door)
		with instance_create(0, 0, obj_titlecard)
			image_index = _levelinfo[0]
	}
}

if key_grab.pressed
{
	obj_player.state = states.normal
	active = false
}