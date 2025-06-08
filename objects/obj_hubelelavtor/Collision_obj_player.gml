with (obj_player)
{
	if (state == states.normal && obj_player.grounded && obj_player.key_up.pressed)
	{
		reset_anim(obj_player.spr_enterdoor)
		state = states.actor
		hsp = 0
		movespeed = 0
		image_speed = 0.35
		other.state = states.actor
		other.playerid = obj_player.id
	}
}
if (obj_player.sprite_index = obj_player.spr_enterdoor)
	obj_player.x = approach(obj_player.x, x + sprite_width / 2, 2)