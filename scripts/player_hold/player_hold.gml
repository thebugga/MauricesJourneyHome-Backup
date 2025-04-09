function player_hold()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 6, 0.5)
		xscale = p_move
	}
	else
		movespeed = 0
		
	hsp = movespeed * xscale
	
	if grounded
	{
		if (sprite_index == spr_holdjump || sprite_index == spr_holdfall)
			reset_anim(obj_player.spr_holdland)
		if (sprite_index != spr_holdland && sprite_index != spr_holdrise)
			sprite_index = p_move != 0 ? spr_holdmove : spr_holdidle
	}
	else
	{
		if (sprite_index != spr_holdjump && sprite_index != spr_holdfall)
			reset_anim(obj_player.spr_holdjump)
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		vsp = -12
		jumpstop = false
		scr_sound_3d(sfx_jump, x, y)
	}
		
	if p_move != 0
		xscale = p_move
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_holdland:
		case spr_holdrise:
			reset_anim_on_end(spr_holdidle)
			break;
		case spr_holdjump:
			reset_anim_on_end(spr_holdfall)
			break;
	}
	
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		state = states.punchenemy
		var str = string_concat("spr_finishingblow_", string(irandom_range(1, 5)))
		reset_anim(asset_get_index(str))
		if (key_up.down)
			reset_anim(obj_player.spr_finishingblowup)
	}
}