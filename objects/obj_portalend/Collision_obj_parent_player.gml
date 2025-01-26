if (obj_parent_player.state != states.portal && global.panic == true)
{
	obj_parent_player.hsp = 0
	sprite_index = spr_pizzaportalend
	image_index = 0
	obj_parent_player.state = states.portal
	obj_parent_player.grav = 0
	obj_parent_player.visible = false
}
