get_input()

if !surface_exists(bg_surf)
	exit;
	
for (var i = 0; i < array_length(bg_parallax); i++) 
{
	with bg_parallax[i] // with the current layer
		x += spd // increment its x with its speed
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

if (place_meeting(x, y, obj_player) && obj_player.state != states.actor && key_up.down && obj_player.grounded)
{
	with obj_player
	{
		reset_anim(obj_player.spr_startgate)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
		spawn = noone
		return_location = {
			x: x,
			y: y,
			room: room
		}
		restart_location = {
			room: other.t_room,
			door: other.t_door,
			title: other.card_index,
			name: other.level_name
		}
	}
}

var flick = false
with obj_player
{
	if (sprite_index == spr_startgate && !obj_fade.fade && image_speed > 0 && anim_ended())
	{
		flick = true
		image_speed = 0
	}
}

if flick
{
	global.level_minutes = 0
	global.level_seconds = 0
	with obj_player
	{
		global.level_data.level_name = restart_location.name
		do_fade(restart_location.room, restart_location.door, fade_types.door)
		with instance_create(0, 0, obj_titlecard)
			image_index = other.restart_location.title
	}
}
