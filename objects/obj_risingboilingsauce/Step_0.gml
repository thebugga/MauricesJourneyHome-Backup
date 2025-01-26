if place_meeting(x, (y - 1), obj_parent_player)
{
	obj_parent_player.state = states.fireass
	obj_parent_player.image_index = 0
	obj_parent_player.vsp = -25
	obj_parent_player.sprite_index = spr_player_fireass
}
if (global.panic == true)
	y -= 0.5
