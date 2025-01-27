if (vsp > 0)
{
	instance_destroy()
	instance_destroy(obj_pizzaballblock)
	obj_parent_player.state = states.backbreaker
	if (global.playerCharacter == Characters.Maurice)
		obj_parent_player.sprite_index = spr_player_levelcomplete
	else
		obj_parent_player.sprite_index = spr_playerN_victory
	obj_parent_player.image_index = 0
}
