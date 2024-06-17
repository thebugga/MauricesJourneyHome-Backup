function scr_maurice_normal(){
        image_speed = 0.35
        move = key_right - key_left
		hsp = xscale * movespeed
		if move != 0 
		{
			xscale = move
			movespeed = 6
		if move != 0 && grounded && vsp > 0
		{
			if steppybuffer > 0
				steppybuffer--;
			else
			{
				steppybuffer = 8;
	event_path = fmod_studio_system_get_event("event:/sfx/maurice/step");
	event = fmod_studio_event_description_create_instance(event_path);
	fmod_studio_event_instance_start(event);
			}
		}
	}
		else if move == 0
		{
		steppybuffer = 8;
	event_path = fmod_studio_system_get_event("event:/sfx/maurice/step");
	event = fmod_studio_event_description_create_instance(event_path);
			fmod_studio_event_instance_stop(event)
			hsp = 0
			vsp = 0
			movespeed = 0
		}

		if grounded && sprite_index == spr_fall
		{
			if move == 0
				sprite_index = spr_land
			if move != 0
				sprite_index = spr_land2
		}

		if hsp != 0
			sprite_index = spr_move;
		else
			sprite_index = spr_idle;
		if key_jump2 && grounded 
		{
	event_path = fmod_studio_system_get_event("event:/sfx/maurice/jump");
	event = fmod_studio_event_description_create_instance(event_path);
	fmod_studio_event_instance_start(event);
			image_index = 0
			sprite_index = spr_jump
			vsp = -9
			state = states.jump
		}
		if !grounded 
		{
			sprite_index = spr_fall
			state = states.jump
		}
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_fall || sprite_index == spr_jump) && grounded)
		{
			if move == 0
				sprite_index = spr_land
			else
				sprite_index = spr_land2
			image_index = 0
		}
        if (floor(image_index) == (image_number - 1) && (sprite_index == spr_land || sprite_index == spr_land2) && grounded)
			if move == 0
				sprite_index = spr_idle
			else
				sprite_index = spr_move
		if key_run2
		{
		    move = 1
			image_index = 0
			sprite_index = spr_mach
			machshit = 0
			state = states.mach
			if movespeed != 5
				movespeed = 5
		}
	scr_taunt();

	if key_attack2 && grounded {
		set_spr(choose(spr_nickel1, spr_nickel2))
		hsp = 0
		scr_soundeffect(sfx_sack)
		state = states.nickel;
}
}