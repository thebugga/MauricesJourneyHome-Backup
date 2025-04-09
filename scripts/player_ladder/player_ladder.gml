function player_ladder()
{
	var move_v = (-key_up.down + key_down.down)
	
	vsp = move_v * 6
	
	if (move_v != 0)
		sprite_index = vsp <= 0 ? spr_laddermove : spr_ladderdown
	else
		sprite_index = spr_ladder
		
	image_speed = 0.35
	
	if (!place_meeting(x, y + 1, obj_ladder) || place_meeting(x, y + sign(vsp), obj_solid))
	{
		state = states.normal
		vsp = 0
	}
	
	if sprite_index == spr_laddermove
	{
		if particle_timer > 0
			particle_timer--;
		else
		{
			particle_timer = 12;
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y, spr_cloudeffect)
		}
	}
	
	if input_buffers.jump > 0
	{
		input_buffers.jump = 0
		vsp = -12
		state = states.jump
		reset_anim(obj_player.spr_jump)
		jumpstop = false
		ladderbuffer = 20
	}
}