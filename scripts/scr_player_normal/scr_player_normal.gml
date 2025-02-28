function state_player_normal()
{
	var maxmovespeed = 8;
	var maxmovespeed2 = 6;
	var accel = 0.5;
	var deccel = 0.1;
	var jumpspeed = -11;
	
	mach2 = 0;
	move = key_left + key_right;
	skateboarding = false;
	momemtum = false;
	jumpstop = false;
	if dir != Xscale
	{
		dir = Xscale;
		movespeed = 2;
		facehurt = false;
	}
	if key_taunt2
	{
		input_finisher_buffer = 60;
		input_attack_buffer = 0;
		input_up_buffer = 0;
		input_down_buffer = 0;
	}
	var idlespr = spr_idle;
	var movespr = spr_move;
	if global.pistol && global.playerCharacter == Characters.Maurice
	{
		idlespr = spr_player_pistolidle;
		movespr = spr_player_pistolwalk;
	}
	var breakdance_max = 10;
	if (key_taunt && !shotgunAnim && (!global.pistol || global.playerCharacter == Characters.Doise))
		breakdance_pressed++;
	else
		breakdance_pressed = 0;
	if breakdance_pressed >= breakdance_max && !shotgunAnim
	{
		breakdance_speed = approach(breakdance_speed, 0.6, 0.005);
	}
	else
		breakdance_speed = 0.25;
	if breakdance_speed >= 0.5
	{
		if (!instance_exists(obj_beatbox))
		{
			instance_create(x, y, obj_genericpoofeffect);
			with (instance_create(x, y, obj_beatbox))
				vsp = -11;
		}
		notecreate--;
	}
	if notecreate <= 0 && !shotgunAnim
	{
		instance_create(x + random_range(-70, 70), y + random_range(-70, 70), obj_notes);
		notecreate = 10;
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
		railmomentum = true;
	}
	hsp = (move * movespeed) + (railmovespeed * raildir);
	if move != 0
	{
        if move != 0
            Xscale = move
		if movespeed < maxmovespeed
			movespeed += accel;
		else if (floor(movespeed) == maxmovespeed)
			movespeed = maxmovespeed2;
		if (movespeed < (floor(maxmovespeed2) / 2) && move != 0)
			image_speed = 0.35;
		else if (movespeed > (floor(maxmovespeed2) / 2) && movespeed < maxmovespeed2)
			image_speed = 0.45;
		else
			image_speed = 0.6;
		if !machslideAnim && !landAnim && !shotgunAnim
		{
			machslideAnim = false;
			idle = 0;
			facehurt = false;
			if shoot
				sprite_index = spr_pistolwalk;
			else if mort
				sprite_index = spr_player_mortwalk;
			else if breakdance_pressed >= breakdance_max
				sprite_index = spr_breakdance;
			else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
				sprite_index = spr_hurtwalk;
			else if ((global.combo >= 25 && global.combo < 50))
			|| (global.noisejetpack)
				sprite_index = spr_3hpwalk;
			else if (global.combo >= 50)
				sprite_index = spr_ragemove;
			else
				sprite_index = movespr;
		}
		if (place_meeting_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope) && Xscale == move && !place_meeting(x, y + 1, obj_slope))
			movespeed = 0;
		if move != 0 && grounded && vsp > 0
		{
			if steppybuffer > 0
				steppybuffer--;
			else if sprite_index != spr_breakdance
			{
				create_particle(x, y + 43, particle.cloudeffect, 0);
				steppybuffer = 12;
					fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
			}
		}
	}
	else
	{
		steppybuffer = 12;
		if sprite_index == spr_breakdance
			image_speed = breakdance_speed;
		else
			image_speed = 0.35;
		movespeed = 0;
		if !machslideAnim && !landAnim && !shotgunAnim
		{
			if idle < 400 && breakdance_pressed < breakdance_max
				idle++;
			if idle >= 150 && breakdance_pressed < breakdance_max
			{
				if (sprite_index != idlespr && animation_end())
				{
					facehurt = false;
					idle = 0;
				}
				if ((!global.pistol || global.playerCharacter == Characters.Doise) && !shotgunAnim && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
				{
					idleanim = random_range(0, 5);
					var idles = 
					[
						spr_idle1,
						spr_idle2,
						spr_idle3,
						spr_idle4,
						spr_idle5,
						spr_idle6
					]
					if (irandom(4) <= 25)
						fmod_event_one_shot_3d("event:/sfx/maurice/ok", x, y);
					image_index = 0;
					sprite_index = idles[idleanim]
				}
			}
			else if !facehurt
			{
				if (windingAnim < 100 || angry|| shoot)
				{
					start_running = true;
					movespeed = 0;
					if shoot
						sprite_index = spr_player_pistolidle;
					else if breakdance_pressed >= breakdance_max
						sprite_index = spr_breakdance;
					else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_hurtidle;
					else if (global.panic && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_panic;
					else if ((global.combo >= 25 && global.combo < 50))
					|| (global.noisejetpack && (global.playerCharacter == Characters.Doise || noisepizzapepper))
						sprite_index = spr_3hpidle;
					else if (global.combo >= 50)
						sprite_index = spr_rageidle;
					else
						sprite_index = idlespr;
				}
				else
				{
					idle = 0;
					windingAnim--;
					sprite_index = spr_winding;
					if breakdance_pressed >= breakdance_max
						sprite_index = spr_breakdance;
				}
			}
			else
			{
				windingAnim = 0;
				sprite_index = spr_facehurt;
				if breakdance_pressed >= breakdance_max
					sprite_index = spr_breakdance;
			}
		}
	}
	if movespeed > maxmovespeed
		movespeed -= deccel;
	if landAnim
	{
		if sprite_index == spr_player_mortland
		{
			if animation_end()
			{
				landAnim = false;
				sprite_index = spr_player_mortidle;
				image_index = 0;
			}
		}

		else if !shotgunAnim
		{
			if move == 0
			{
				movespeed = 0;
				sprite_index = spr_land;
				if animation_end()
					landAnim = false;
			}
			else
			{
				sprite_index = spr_land2;
				if animation_end()
				{
					landAnim = false;
					sprite_index = movespr;
					image_index = 0;
				}
			}
		}
		else
		{
			sprite_index = spr_shotgunland;
			if animation_end()
			{
				landAnim = false;
				sprite_index = spr_shotgunidle;
				if move != 0
					sprite_index = spr_shotgunwalk;
				image_index = 0;
			}
		}
	}
	else if shotgunAnim && sprite_index != spr_shotgunshoot && !machslideAnim
		sprite_index = (move == 0) ? spr_shotgunidle : spr_shotgunwalk;
	if machslideAnim
		sprite_index = spr_machslideend;
	if animation_end()
	{
		switch sprite_index
		{
			case spr_machslideend:
				machslideAnim = false;
				sprite_index = idlespr;
				if shotgunAnim
					sprite_index = spr_shotgunidle;
				break;
			case spr_playerV_revolverend:
				sprite_index = idlespr;
				break;
			case spr_shotgunshoot:
				sprite_index = spr_shotgunidle;
				break;
			case spr_pistolshot:
				sprite_index = idlespr;
				break;
		}
	}
	if grounded
	{
		if ((key_jump || (input_buffer_jump > 0 && !key_attack && vsp > 0)) && !key_down)
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			if sprite_index != spr_shotgunshoot
			{
				sprite_index = spr_jump;
				if shotgunAnim
					sprite_index = spr_shotgunjump;
				else if global.pistol && global.playerCharacter == Characters.Maurice
					sprite_index = spr_player_pistoljump1;
				image_index = 0;
			}
			particle_set_scale(particle.highjumpcloud2, Xscale, 1);
			create_particle(x, y, particle.highjumpcloud2, 0);
			vsp = jumpspeed;
			state = states.jump;
			jumpAnim = true;
			jumpstop = false;
			if (place_meeting(x, y + 1, obj_railparent))
				railmomentum = true;
			freefallstart = 0;
		}
		if (key_down || (grounded && vsp > 0 && place_meeting_solid(x, y - 3) && place_meeting_solid(x, y)) || place_meeting(x, y, obj_solid))
		{
			state = states.crouch;
			landAnim = false;
			crouchAnim = true;
			image_index = 0;
			idle = 0;
		}
	}
	else if !key_jump
	{
		if sprite_index != spr_shotgunshoot
		{
			if !shotgunAnim
				sprite_index = spr_fall;
			else
				sprite_index = spr_shotgunfall;
			if global.pistol && global.playerCharacter == Characters.Maurice
				sprite_index = spr_player_pistoljump2;
			image_index = 0;
			jumpAnim = false;
		}
		else
			jumpAnim = true;
		state = states.jump;
	}
    if (input_buffer_slap > 0 && (!key_up) && shotgunAnim == false && (!global.pistol)) && global.playerCharacter != Characters.MrOrange
    {
		scr_dograb()
    }
    else if (input_buffer_slap > 0 && key_up && shotgunAnim == false && ((!global.pistol)))
    {
        state = states.punch
        input_buffer_slap = 0
        image_index = 0
        sprite_index = spr_breakdanceuppercut
        fmod_event_instance_play(snd_uppercut)
        if global.playerCharacter == Characters.Maurice
            vsp = -14
        else
            vsp = -20
        particle_set_scale((4 << 0), Xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
	if (key_attack && state != states.handstandjump && !place_meeting(x + Xscale, y, obj_solid) && (!place_meeting(x, y + 1, obj_iceblockslope) || !place_meeting(x + (Xscale * 5), y, obj_solid)) && !global.kungfu) && global.playerCharacter != Characters.Clownmato
	{
		sprite_index = spr_mach1;
		image_index = 0;
		state = states.mach2;
		if movespeed < 6
			movespeed = 6;
	}
	if (key_attack && state != states.handstandjump && !place_meeting(x + Xscale, y, obj_solid) && (!place_meeting(x, y + 1, obj_iceblockslope) || !place_meeting(x + (Xscale * 5), y, obj_solid)) && !global.kungfu) && global.playerCharacter == Characters.Clownmato
	{
		sprite_index = spr_mach4;
		image_index = 0;
		state = states.mach3;
		if movespeed < 12
			movespeed = 12;
	}
	scr_dotaunt();
	if sprite_index == spr_shotgunshoot
	{
		landAnim = false;
		machslideAnim = false;
		image_speed = 0.45;
	}
	if key_slap2 && global.playerCharacter == Characters.MrOrange
	{
		vsp = -5;
		state = states.revolver
		image_index = 0;
		sprite_index = spr_playerV_airrevolver;
		image_index = 0;
		with (instance_create(x + (Xscale * 20), y + 20, obj_shotgunbullet))
		{
			is_solid = false;
			image_xscale = other.Xscale;
		}
		fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	}
	if (key_shoot2 && global.playerCharacter == Characters.MrOrange && !instance_exists(dynamite_inst))
	{
		vsp = -5;
		state = states.dynamite;
		image_index = 0;
		sprite_index = spr_playerV_dynamitethrow;
		with (instance_create(x, y, obj_dynamite))
		{
			image_xscale = other.Xscale;
			other.dynamite_inst = id;
			playerid = other.id;
			movespeed = other.movespeed + 4;
			vsp = -6;
		}
	}
}

function scr_player_normal()
{
		state_player_normal();
}
