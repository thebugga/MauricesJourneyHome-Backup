with (other)
{
	if (bbox_bottom <= other.bbox_bottom + 1 && bbox_bottom >= other.bbox_bottom - 1 && key_up.down && state != states.actor)
	{
		reset_anim(spr_enterdoor)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
		prev.room = room
		other.state = states.actor
		other.playerid = id
	}
}
if (other.sprite_index = other.spr_enterdoor)
	other.x = approach(other.x, x + sprite_width / 2, 2)