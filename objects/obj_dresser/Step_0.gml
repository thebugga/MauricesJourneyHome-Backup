if up
{
	walk_index += 0.35
	if floor(walk_index) == sprite_get_number(walk_sprite) - 1
		walk_index = 0
	v_select = clamp(v_select + (playerid.key_down2 - playerid.key_up2), 0, 2)
	h_select[v_select] = clamp(h_select[v_select] + (playerid.key_right2 + playerid.key_left2), 0, h_selectmax[v_select])
	if playerid.key_jump
	{
		playerid.player_paletteselect[0] = h_select[0] + 1
		with obj_playerhat
		{
			if playerid == other.playerid
				instance_destroy()
		}
		if h_select[1] != 0
		{
			with instance_create(x, y, obj_playerhat)
				playerid = other.playerid
		}
		quick_ini_write_real(get_savefile_ini(), "Game", "paletteselect" + string(playerid.player_index), playerid.player_paletteselect[playerid.player_index])
		up = false
		playerid = noone
		obj_parent_player.state = states.normal
	}
}