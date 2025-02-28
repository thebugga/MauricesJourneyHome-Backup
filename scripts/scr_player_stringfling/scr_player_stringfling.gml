function scr_player_stringfling()
{
	sprite_index = spr_player_mrpinch
	hsp = (Move * Movespeed)
	Movespeed = 2
	vsp = 2
	Move = (key_left + key_right)
	if (Move != 0)
		Xscale = Move
	exit;
}

