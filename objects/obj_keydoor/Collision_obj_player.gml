get_input()

var canenter = ds_list_find_index(global.ds_saveroom, id) != -1 || other.haskey

if (other.bbox_bottom <= bbox_bottom + 1 && other.bbox_bottom >= bbox_bottom - 1 && key_up.down && other.state != states.actor && canenter)
{
	var enterspr = other.spr_enterkeydoor
	
	if other.haskey
	{
		image_index++
		other.haskey = false
		event_play_oneshot("event:/sfx/misc/keyunlock")
		event_play_oneshot("event:/sfx/misc/winrace")
		ds_list_add(global.ds_saveroom, id)
		instance_create(x, y, obj_lockdebris)
	}
	else
	{
		enterspr = other.spr_enterdoor
		event_play_oneshot("event:/sfx/misc/door")
		do_fade(t_room, t_door, fade_types.door)
	}
	
	with other
	{
		reset_anim(enterspr)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
	}
}

if (other.sprite_index = other.spr_enterdoor || other.sprite_index = other.spr_enterkeydoor)
	other.x = approach(other.x, x + sprite_width / 2, 2)
