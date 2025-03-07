function scr_fakepeppino_idle()
{
	hsp = (image_xscale * movespeed)
	if (x != obj_parent_player.x)
		image_xscale = (-(sign((x - obj_parent_player.x))))
	if (sprite_index == spr_fakepeppino_land && animation_end())
	{
		image_index = 0
		sprite_index = spr_fakepeppino_idle
	}
	if (sprite_index == spr_fakepeppino_idle && animation_end())
	{
		movespeed = 8
		image_index = 0
		sprite_index = spr_fakepeppino_walk
		state = states.walk
	}
	exit;
}

