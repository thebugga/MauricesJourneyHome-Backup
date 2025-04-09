function player_bump() 
{
	image_speed = 0.35
	if (sprite_index == spr_wallsplat || sprite_index == spr_ceilinghit)
	{
		hsp = 0
		vsp = 0
	}
	movespeed = 0
	if (grounded)
		hsp = 0
	if anim_ended()
	{
		state = states.normal
		if (sprite_index == spr_bodyslamland || sprite_index == spr_fallfarland)
			reset_anim(obj_player.spr_facehurt)
		else if (sprite_index == spr_ceilinghit)
		{
			reset_anim(obj_player.spr_superjumpfall)
			state = states.jump
		}
		else
			sprite_index = spr_idle
	}
}