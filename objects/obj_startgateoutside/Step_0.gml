get_input()

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
	do_fade(tower_hallway, "a", fade_types.door)
