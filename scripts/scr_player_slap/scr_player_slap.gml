function scr_player_slap()
{
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	else
	{
		hsp = (Xscale * movespeed)
	}
	landAnim = 0
	if (slaphand == 1)
		sprite_index = spr_player_slap1
	if (slaphand == 2)
		sprite_index = spr_player_slap2
	if animation_end()
	{
		if input_buffer_slap == 0
		{
			if (move != 0)
				dir = move
			if grounded
			{
				if key_attack
					state = states.mach2
				if !key_attack
					state = states.normal
			}
			else
			{
				sprite_index = spr_player_fall
				state = states.jump
			}
		}
		else
		{
			input_buffer_slap = 0
			if slaphand >= 2
			{
		        suplexmove = true
		        fmod_studio_event_instance_start(suplexdashsnd)
		        state = states.handstandjump
				sprite_index = spr_player_lungestart
				movespeed = 10
			}
			else
			{
				movespeed = 6
				slaphand++
			}
			image_index = 0
		}
	}
	if (scr_mach_check_dive() && grounded)
	{
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.Xscale;
		movespeed = 12;
		crouchslipbuffer = 25;
		grav = 0.5;
		sprite_index = spr_crouchslip;
		image_index = 0;
		machhitAnim = false;
		state = states.tumble;
		fmod_studio_event_instance_start(snd_crouchslide);
	}
	image_speed = 0.35
	exit;
}
