function player_wizardcling(){
	sprite_index = place_meeting(x + xscale, y, obj_solid) ? spr_wizardclingwall : spr_wizardclingceil
	image_speed = 0.35
	if wizardclingtimer > 0
		wizardclingtimer--
	else
	{
		movespeed = 0
		state = states.wizard
		reset_anim(spr_wizardbump)
	}
	if key_grab.pressed
	{
		reset_anim(spr_wizardwindup)
		state = states.wizardgrapple
	}
	if (input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		state = states.wizard
		reset_anim(spr_wizarddoublejump)
		vsp = -10
		movespeed = place_meeting(x + xscale, y, obj_solid) ? 6 : 0
		xscale *= -1
	}
}