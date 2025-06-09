get_input(other.player)

if (other.bbox_bottom <= bbox_bottom + 1 && other.bbox_bottom >= bbox_bottom - 1 && key_up.down && other.state != states.actor)
{
	with (other)
	{
		reset_anim(spr_enterdoor)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
		prev.room = room
	}
	if !obj_fade.fade 
		event_play_oneshot("event:/sfx/misc/door")
	do_fade(t_room, t_door, fade_types.door)
}

if (other.sprite_index = other.spr_enterdoor)
	other.x = approach(other.x, x + sprite_width / 2, 2)
