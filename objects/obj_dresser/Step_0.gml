if up
{
	walk_index += 0.35
	if floor(walk_index) == sprite_get_number(walk_sprite) - 1
		walk_index = 0
	selected = clamp(selected + (playerid.key_right2 + playerid.key_left2), 0, 15)
	if playerid.key_jump
	{
		playerid.player_paletteselect[0] = selected
		quick_ini_write_real(get_savefile_ini(), "Game", "paletteselect" + string(playerid.player_index), playerid.player_paletteselect[playerid.player_index])
		up = false
		playerid = noone
		obj_player.state = states.normal
	}
}