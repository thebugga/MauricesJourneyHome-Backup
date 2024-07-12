if obj_player1.key_up2
{
	if (obj_player1.player_paletteselect[0] < 15)
		obj_player1.player_paletteselect[0] += 1
	else
		obj_player1.player_paletteselect[0] = 1
	quick_ini_write_real(get_savefile_ini(), "Game", "paletteselect" + string(obj_player1.player_index), obj_player1.player_paletteselect[obj_player1.player_index])
}
