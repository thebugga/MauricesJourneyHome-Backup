function scr_player_blockstance()
{
	hsp = approach(hsp, 0, 0.5)
	movespeed = 0
	if (sprite_index == spr_player_airattackstart && animation_end())
		sprite_index = spr_player_airattack
	if ((!key_attack) && sprite_index != spr_player_airattackstart)
	{
		state = states.normal
		landAnim = 0
	}
	exit;
}

