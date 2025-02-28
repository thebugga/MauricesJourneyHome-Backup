function scr_player_noisecrusher()
{
	image_speed = 0.35;
	if sprite_index == spr_playerN_noisecrusherland
	{
		hsp = 0;
		vsp = 0;
		Movespeed = 0;
		if (animation_end())
			state = 0;
		exit;
	}
	if vsp > 0
		vsp += 0.5;
	hsp = Movespeed;
	Move = key_left + key_right;
	if Move != 0
		Movespeed = approach(Movespeed, Move * 8, 0.5);
	else
		Movespeed = approach(Movespeed, 0, 0.5);
	if sprite_index != spr_playerN_noisecrusherstart && sprite_index != spr_playerN_noisecrusherland && sprite_index != spr_playerN_noisecrusherfall
	{
		sprite_index = spr_playerN_noisecrusherstart;
		image_index = 0;
	}
	if (sprite_index == spr_playerN_noisecrusherstart && animation_end())
		sprite_index = spr_playerN_noisecrusherfall;
	if ((key_attack2 || input_buffer_slap > 0) && !grounded)
	{
		image_speed = 0.5;
		input_buffer_shoot = 0;
		if Move != 0
			Xscale = Move;
		input_buffer_slap = 0;
		key_slap = false;
		key_slap2 = false;
		jumpstop = true;
		vsp = -5;
		state = states.mach2;
		Movespeed = 12;
		sprite_index = spr_playerN_sidewayspin;
		image_index = 0;
		with (instance_create(x, y, obj_crazyrunothereffect))
			image_xscale = other.Xscale;
		particle_set_scale(particle.jumpdust, Xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		return true;
	}
	if (grounded && vsp > 0 && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + 15, obj_destructibles) && !place_meeting(x, y + 15, obj_metalblock) && !place_meeting(x, y + vsp + 5, obj_metalblock) && !place_meeting(x, y + 15, obj_grindrail))
	{
		with (instance_create(x - 10, y, obj_parryeffect))
		{
			sprite_index = spr_ratdust;
			hspeed = -5;
		}
		with (instance_create(x + 10, y, obj_parryeffect))
		{
			image_xscale = -1;
			sprite_index = spr_ratdust;
			hspeed = 5;
		}
		with obj_parent_enemy
		{
			if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && !invincible && groundpound)
			{
				state = states.stun;
				if stunned < 60
					stunned = 60;
				vsp = -11;
				image_xscale *= -1;
				hsp = 0;
				momentum = 0;
			}
		}
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		fmod_event_one_shot_3d("event:/sfx/maurice/groundpound", x, y);
		sprite_index = spr_playerN_noisecrusherland;
		image_index = 0;
	}
	scr_dotaunt();
}
function scr_player_do_noisecrusher()
{
	input_buffer_jump = 0;
	Movespeed = hsp;
	state = states.ratmountbounce;
	sprite_index = spr_playerN_noisecrusherstart;
	image_index = 0;
	vsp = -16;
	scr_fmod_soundeffect(snd_noisedoublejump, x, y);
	particle_set_scale(5, Xscale, 1);
	create_particle(x, y, 5, 0);
}
