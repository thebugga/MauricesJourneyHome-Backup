if other.key_up2 && other.state == states.normal
{
	up = true
	playerid = other.id
	walk_sprite = other.spr_idle
	h_select[0] = other.player_paletteselect[0] - 1
	obj_parent_player.state = states.actor
	obj_parent_player.hsp = 0
}
