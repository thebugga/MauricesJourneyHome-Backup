function scr_playerN_machcancelstart()
{
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	image_speed = 0.5;
	if animation_end()
	{
		state = states.machcancel;
		sprite_index = spr_playerN_jetpackboost;
		instance_create(x, y, obj_jumpdust);
		movespeed = 15;
	}
}
function scr_playerN_machcancel()
{
	noisemachcancelbuffer = 10;
	hsp = movespeed;
	move = key_right + key_left;
	if move != 0
		savedmove = move;
	if (sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombland || sprite_index == spr_playerN_divebombfall)
	{
		if move != 0
		{
			if (abs(movespeed) < 12)
				movespeed = approach(movespeed, move * 12, 1);
			else
				movespeed = approach(movespeed, move * abs(movespeed), 1);
		}
		else
			movespeed = approach(movespeed, 0, 0.25);
		var xx = movespeed;
		if xx == 0
			xx = xscale;
		if (grounded && place_meeting(x + xx, y, obj_solid))
		{
			mask_index = spr_crouchmask;
			if (!place_meeting(x + xx, y, obj_solid) || place_meeting(x + xx, y, obj_destructibles))
			{
				state = states.tumble;
				sprite_index = spr_machroll;
				image_index = 0;
				instance_destroy(instance_place(x + xx, y, obj_destructibles));
				if movespeed != 0
					xscale = sign(movespeed);
				movespeed = abs(movespeed);
				if movespeed < 6
					movespeed = 6;
			}
		}
	}
	else if move != 0
		movespeed = approach(movespeed, move * 8, 1);
	else
		movespeed = approach(movespeed, 0, 0.5);
	if (scr_noise_machcancel_grab())
		exit;
	if (scr_check_groundpound2() && sprite_index != spr_playerN_divebombfall && !place_meeting(x, y, obj_ventilator) && !grounded)
	{
		sprite_index = spr_playerN_divebombfall;
		state = states.machcancel;
		vsp = 20;
		input_buffer_slap = 0;
		input_buffer_jump = 0;
		image_index = 0;
		exit;
	}
	if grounded && key_attack && vsp >= 0
	{
		fmod_event_one_shot_3d("event:/sfx/playerN/wallbounceland", x, y);
		input_buffer_slap = 0;
		if move != 0
			xscale = move;
		else if savedmove != 0
			xscale = savedmove;
		jumpstop = true;
		mach2 = 35
		movespeed = wallspeed
		state = states.mach2
		image_index = 0;
		if movespeed >= 12
		{
			with (instance_create(x, y, obj_noiseeffect))
			{
				sprite_index = spr_noisegrounddasheffect;
				image_xscale = other.xscale;
			}
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.xscale;
		}
	}
	noisedoublejump = true;
    if (input_buffer_slap > 0 && key_up && shotgunAnim == false && ((!global.pistol) || (!ispeppino)))
    {
        state = states.punch
        input_buffer_slap = 0
        image_index = 0
        sprite_index = spr_breakdanceuppercut
        fmod_event_instance_play(snd_uppercut)
        vsp = -20
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
	if grounded && !key_attack && vsp >= 0
	{
		state = 0;
		movespeed = abs(hsp);
	}
	image_speed = 0.5;
	if punch_afterimage > 0
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		instance_create(x + random_range(5, -5), y + random_range(20, -20), obj_tornadoeffect);
		create_noise_afterimage(x, y, sprite_index, image_index, xscale);
	}
	scr_dotaunt();
}
function scr_noise_machcancel_grab()
{
	image_speed = 0.5;
	move = key_left + key_right;
	if input_buffer_slap > 0 && !key_up
	{
		if (!shotgunAnim || move != 0)
		{
			input_buffer_shoot = 0;
			if move != 0
				xscale = move;
			input_buffer_slap = 0;
			key_slap = false;
			key_slap2 = false;
			jumpstop = true;
			if vsp > -5
				vsp = -5;
			state = states.mach2;
			movespeed = 12;
			sprite_index = spr_playerN_sidewayspin;
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.xscale;
			image_index = 0;
			particle_set_scale(particle.jumpdust, xscale, 1);
			create_particle(x, y, particle.jumpdust, 0);
		}
		else
		{
			if savedmove != 0
				xscale = savedmove;
			scr_shotgunshoot();
		}
		return true;
	}
	return false;
}