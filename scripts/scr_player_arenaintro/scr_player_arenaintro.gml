function scr_player_arenaintro()
{
	hsp = 0
	hurted = 0
	inv_frames = 0
	if (sprite_index == spr_player_bossintro && animation_end())
		image_index = 3
	if (sprite_index == spr_player_levelcomplete && animation_end())
		image_speed = 0
	else
		image_speed = 0.35
	exit;
}

