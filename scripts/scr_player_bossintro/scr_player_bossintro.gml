function scr_player_bossintro()
{
	hsp = 0
	Xscale = 1
	hurted = 0
	inv_frames = 0
	if (sprite_index == spr_player_bossintro && animation_end())
	{
		state = states.normal
		image_index = 0
	}
	if (sprite_index == spr_player_levelcomplete && animation_end())
		image_speed = 0
	else
		image_speed = 0.35
	exit;
}

