if other.key_up2 && other.state == states.normal
{
	up = true
	playerid = other.id
	walk_sprite = other.spr_walkfront
	obj_player.state = states.actor
	obj_player.hsp = 0
}
