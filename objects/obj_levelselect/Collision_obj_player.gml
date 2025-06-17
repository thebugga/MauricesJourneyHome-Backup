if other.state != states.actor && other.key_up.pressed && other.grounded
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
	}
	active = true
}