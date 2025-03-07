function state_player_jump()
{
	
	var maxmovespeed = 8;
	var maxmovespeed2 = 6;
	var turnmovespeed = 2;
	var accel = 0.5;
	var deccel = 0.1;
	var jumpspeed = -11;
	var machspeed = 6;
	
	landAnim = true;
	if !momemtum
		hsp = move * movespeed;
	else
		hsp = Xscale * movespeed;
	hsp += railmovespeed * raildir;
	if key_taunt2
	{
		input_finisher_buffer = 60;
		input_attack_buffer = 0;
		input_up_buffer = 0;
		input_down_buffefr = 0;
	}
	if dir != Xscale
	{
		dir = Xscale;
		movespeed = turnmovespeed;
		facehurt = false;
	}
	if move != Xscale
		movespeed = turnmovespeed;
	move = key_left + key_right;
	if movespeed == 0
		momemtum = false;
	if (place_meeting_solid(x + hsp, y))
	{
		movespeed = 0;
		mach2 = 0;
	}
	if move != 0
	{
		Xscale = move;
		if movespeed < maxmovespeed
			movespeed += accel;
		else if (floor(movespeed) == maxmovespeed)
			movespeed = maxmovespeed2;
		if (place_meeting_solid(x + Xscale, y) && move == Xscale)
			movespeed = 0;
	}
	else
		movespeed = 0;
	if movespeed > maxmovespeed
		movespeed -= deccel;
	if ladderbuffer > 0
		ladderbuffer--;
	if !jumpstop
	{
		if !key_jump2 && vsp < 0.5 && !stompAnim
		{
			vsp /= 20;
			jumpstop = true;
		}
		else if (place_meeting_solid(x, y - 1) && !jumpAnim)
		{
			vsp = grav;
			jumpstop = true;
		}
	}
	if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
	{
		if vsp > 6
			vsp = 6;
		if !key_jump2
		{
			grav = 0.5;
			sprite_index = spr_fall;
		}
	}
	if key_jump
	{
		if global.mort && sprite_index != spr_mortdoublejump
		{
			repeat 6
				create_debris(x, y, spr_feather);
			sprite_index = spr_mortdoublejump;
			image_index = 0;
			jumpstop = false;
			grav = 0.25;
			mort = true;
		}
	}
	if (can_jump && input_buffer_jump > 0 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		stompAnim = false;
		vsp = jumpspeed;
		state = states.jump;
		jumpAnim = true;
		jumpstop = false;
		freefallstart = 0;
		railmomentum = false;
		if (place_meeting(x, y + 1, obj_railparent))
			railmomentum = true;
		if sprite_index != spr_shotgunshoot
		{
			sprite_index = spr_jump;
			if shotgunAnim
				sprite_index = spr_shotgunjump;
			if global.pistol && global.playerCharacter == Characters.Maurice
				sprite_index = spr_pistoljump1;
			image_index = 0;
		};
	}
	if !can_jump && global.playerCharacter == Characters.Doise && key_up && noisedoublejump && input_buffer_jump > 0 && !key_down && !key_attack
	{
		freefallstart = 0;
		railmomentum = false;
		if (place_meeting(x, y + 1, obj_railparent))
			railmomentum = true;
		scr_player_do_noisecrusher();
	}
	if grounded && vsp > 0
	{
		if vsp > 0 && (!key_attack || sprite_index == spr_suplexbump)
		{
			event_play_oneshot_3d("event:/sfx/maurice/step", x, y);
			if (key_attack || sprite_index == spr_shotgunshoot)
				landAnim = false;
			if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
				sprite_index = spr_player_mortland;
			if sprite_index != spr_shotgunshoot
				image_index = 0;
			if global.pistol && global.playerCharacter != Characters.Doise
				sprite_index = spr_pistolland;
			input_buffer_secondjump = 0;
			state = states.normal;
			jumpAnim = true;
			jumpstop = false;
			freefallstart = 0;
		}
	}
	if vsp > 5 && sprite_index != spr_mortdoublejump
		fallinganimation++;
	if fallinganimation >= 40 && fallinganimation < 80
		sprite_index = spr_facestomp;
	else if fallinganimation >= 80
		sprite_index = spr_freefall;
	if !stompAnim
	{
		if !jumpAnim
		{
			switch sprite_index
			{
				case spr_mortdoublejumpstart:
					sprite_index = spr_mortdoublejump;
					break;
				case spr_suplexland:
					sprite_index = spr_fall;
					break;
				case spr_playerN_doublejump:
					sprite_index = spr_playerN_doublejumpfall;
					break;
				case spr_playerN_doublejumpOLD:
					sprite_index = spr_playerN_doublejumpfallOLD;
					break;
				case spr_airdash1:
					sprite_index = spr_airdash2;
					break;
				case spr_player_pistolshot:
					sprite_index = shoot ? spr_player_pistoljump2 : spr_fall;
					break;
				case spr_shotgunjump:
					sprite_index = spr_shotgunfall;
					break;
				case spr_playerV_superjump:
					sprite_index = spr_playerV_fall;
					break;
				case spr_jump:
					sprite_index = spr_fall;
					break;
				case spr_suplexcancel:
					sprite_index = spr_fall;
					break;
				case spr_player_backflip:
					sprite_index = spr_fall;
					break;
				case spr_player_Sjumpstart:
					sprite_index = spr_player_Sjump;
					break;
				case spr_player_shotgunjump1:
					sprite_index = spr_player_shotgunjump2;
					break;
				case spr_shotgun_shootair:
					sprite_index = spr_shotgunfall;
					break;
				case spr_shotgunshoot:
					sprite_index = spr_shotgunfall;
					break;
				case spr_stompprep:
					sprite_index = spr_stomp;
					break;
				case spr_player_groundpoundjump:
					sprite_index = spr_fall;
					break;
			}
		}
	}
	else if (sprite_index == spr_stompprep && animation_end())
		sprite_index = spr_stomp;
	if (scr_check_groundpound() && !global.kungfu)
	{
		input_buffer_slap = 0;
		if !shotgunAnim
		{
			sprite_index = spr_bodyslamstart;
			image_index = 0;
			state = states.freefall;
			pistolanim = -4;
			vsp = -6;
		}
		else if global.playerCharacter != Characters.Doise
		{
			event_play_oneshot_3d("event:/sfx/enemies/killingblow", x, y);
			sprite_index = spr_shotgunjump1;
			image_index = 0;
			state = states.freefall;
			vsp = -11;
			with (instance_create(x, y, obj_shotgunblast))
			{
				sprite_index = spr_shotgunblastdown;
				with bulletID
				{
					sprite_index = other.sprite_index;
					mask_index = other.mask_index;
				}
			}
		}
		else
		{
			notification_push(notifs.shotgunblast_start, [room]);
			state = states.shotgunshoot;
			minigunshot = 3;
			minigunbuffer = 0;
			sprite_index = spr_playerN_minigundown;
			image_index = 0;
		}
	}
	if sprite_index == spr_player_suplexcancel
		image_speed = 0.4;
	else
		image_speed = 0.35;
	if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		event_play_oneshot_3d("event:/sfx/maurice/groundpound", x, y);
		image_index = 0;
		sprite_index = spr_bodyslamland;
		state = states.freefallland;
		with obj_parent_enemy
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
	}
	if (input_buffer_slap > 0 && (!key_up) && shotgunAnim == false && (!global.pistol))
    {
		scr_dograb()
    }
    else if input_buffer_slap > 0 && key_up && shotgunAnim == 0 && (!global.pistol || global.playerCharacter == Characters.Doise)
	{
		input_buffer_slap = 0;
		state = states.punch;
		image_index = 0;
		sprite_index = spr_breakdanceuppercut;
		fmod_studio_event_instance_start(snd_uppercut);
		if global.playerCharacter == Characters.Maurice
			vsp = -10;
		else
			vsp = -21;
		movespeed = hsp;
	}
	if key_attack && grounded && fallinganimation < 40
	{
		sprite_index = spr_mach1;
		image_index = 0;
		state = states.mach2;
		if movespeed < machspeed
			movespeed = machspeed;
	}
	if (!key_attack || move != Xscale)
		mach2 = 0;
	if animation_end()
		jumpAnim = false;
	scr_dotaunt();
	if sprite_index == spr_shotgunshoot
	{
		landAnim = false;
		machslideAnim = false;
		image_speed = 0.45;
		if (image_index > image_number - 1)
			sprite_index = spr_shotgunfall;
	}
	if (place_meeting(x, y, obj_solid))
	{
		state = states.crouch;
		landAnim = false;
		crouchAnim = true;
		image_index = 0;
		idle = 0;
	}
}
function state_pepperman_jump()
{
	
	pepperman_grab_reset();
	move = key_left + key_right;
	if (move != 0 && move == sign(Xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel_air;
	else if (move != 0 && move != sign(Xscale) && movespeed > 0)
		movespeed -= pepperman_deccel_air;
	else if move == 0
		movespeed -= pepperman_deccel_air;
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal;
	if movespeed > pepperman_maxhsp_normal
		movespeed -= 0.3;
	else if movespeed < 0
		movespeed = 0;
	if move != 0 && movespeed == 0
		Xscale = move;
	hsp = Xscale * movespeed;
	if (sprite_index == spr_jump && animation_end())
		sprite_index = spr_fall;
	if (sprite_index == spr_player_pistoljump1 && animation_end())
		sprite_index = spr_player_pistoljump2;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5
	{
		vsp /= 20;
		jumpstop = true;
	}
	if grounded && vsp > 0
	{
		state = states.normal;
		instance_create(x, y - 5, obj_landcloud);
	}
	if (scr_check_groundpound() && !grounded)
	{
		state = states.freefall;
		freefallsmash = 12;
		vsp = 14;
		sprite_index = spr_bodyslamfall;
	}
	if (key_attack && (!place_meeting(x + Xscale, y, obj_solid) || place_meeting(x + Xscale, y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_mach1)
	{
		if move != 0
			Xscale = move;
		state = states.shoulderbash;
		sprite_index = spr_mach1;
		image_index = 0;
	}
	if (sprite_index == spr_mach1 && animation_end())
		sprite_index = spr_fall;
	if ladderbuffer > 0
		ladderbuffer--;
	if key_taunt2
	{
		event_play_oneshot_3d("event:/sfx/maurice/taunt", x, y);
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredvsp = vsp;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		state = states.backbreaker;
		if supercharged == 1
		{
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
		}
		else
		{
			taunttimer = 20;
			image_index = random_range(0, 11);
			sprite_index = spr_taunt;
		}
		with (instance_create(x, y, obj_taunteffect))
			player = other.id;
	}
}
function scr_player_jump()
{
	
	if global.playerCharacter != Characters.Clownmato
		state_player_jump();
	else
		state_pepperman_jump();
}
