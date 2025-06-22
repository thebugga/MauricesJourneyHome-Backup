if scr_can_enter_door(other.state) && other.key_up.pressed && other.grounded
{
	stop_music()
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