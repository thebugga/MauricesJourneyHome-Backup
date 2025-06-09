function anim_ended(ind = sprite_index, img = image_index,  i_end = sprite_get_number(ind), i_spd = image_speed) {
    return (img + (i_spd) * sprite_get_speed(ind) / (sprite_get_speed_type(ind) == spritespeed_framespergameframe ? 1 : game_get_speed(gamespeed_fps)) >= i_end);    
}

function do_groundpound()
{
	if (key_down.pressed)
	{
		dir = p_move
		state = states.groundpound
		sprite_index = spr_player_bodyslamstart
		image_index = 0
		vsp = -6
	}
}

function do_grab()
{
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		if (!key_up.down)
		{
			if character == p_characters.maurice
			{
				slaphand = 1
				state = states.nicklebag
				image_index = 0
			}
			else
			{
				movespeed = max(movespeed, 5)
				if state == states.normal
					movespeed = 8
				state = states.grab
				reset_anim(spr_player_suplexgrab)
				event_play_oneshot_3d("event:/sfx/player/step", x, y)
				particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
			}
		}
		else
		{
			vsp = grounded ? -14 : -10
			hsp = abs(hsp) * xscale
			state = states.punch
			reset_anim(obj_player.spr_uppercut)
			image_speed = 0.35
			create_effect(x, y, spr_highjumpcloud2)
			event_play_oneshot_3d("event:/sfx/player/uppercut", x, y)
		}
	}
}


function do_taunt()
{
	if key_taunt.pressed
	{
		prev = {
			state: self.state,
			hsp: self.hsp,
			vsp: self.vsp,
			sprite_index: self.sprite_index
		}
		
		particle_create(x, y, particles.taunt)
		state = states.taunt
		
		if !(key_up.down && supertauntshow)
		{
			sprite_index = spr_taunt
			image_index = random_range(0, image_number)
			taunttimer = 20
			event_play_oneshot_3d("event:/sfx/player/taunt", x, y)
			instance_create(x, y, obj_parrybox)
			
			if (place_meeting(x, y, obj_exitgate) && global.panic.active && global.combo.timer > 0 && global.level_data.tauntcount <= 10)
			{
				var t_val = 25
				global.score += t_val
				
				var c = {
					sprite_index: spr_taunteffect,
					image_index: 3,
					x: self.x - obj_camera.campos.x,
					y: self.y - obj_camera.campos.y,
					val: t_val
				}
				
				global.level_data.tauntcount++
				
				array_push(obj_collect_got_visual.collects, c)
				event_play_oneshot("event:/sfx/misc/collect")
				
				with instance_create(x, y, obj_collect_number)
					num = t_val
			}
		}
		else
		{
			taunttimer = 20
			reset_anim(asset_get_index($"spr_player_supertaunt{irandom_range(1, 4)}"))
			var spds = [[0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1]]
			var i = 0
			var spd = 20
			repeat 8
			{
				with particle_create(x, y, particles.sparks)
				{
					hsp = spds[i][0] * spd
					vsp = spds[i][1] * spd
				}
				i++
			}
		}
	}
}

function player_sounds()
{
    with (obj_player)
    {
        if instance_exists(obj_pizzaface)
        {
            if (!event_instance_isplaying(global.snd_pizzafacemoving))
                fmod_studio_event_instance_start(global.snd_pizzafacemoving)
            with (obj_pizzaface)
                fmod_event_set3DPosition(global.snd_pizzafacemoving, x, y)
		}
		else
			fmod_studio_event_instance_stop(global.snd_pizzafacemoving, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		fmod_event_set3DPosition(snd_voiceouttransfo, x, y);
		fmod_event_set3DPosition(snd_voicetransfo, x, y);
		fmod_event_set3DPosition(snd_voiceok, x, y);
		fmod_event_set3DPosition(snd_voicehurt, x, y);
		if state == states.groundpound
		{
			if (!event_instance_isplaying(freefallsnd))
				fmod_studio_event_instance_start(freefallsnd);
			fmod_studio_event_instance_set_paused(freefallsnd, false);
			fmod_event_set3DPosition(freefallsnd, x, y);
		}
		else
			fmod_studio_event_instance_set_paused(freefallsnd, true);
		if ((state == states.mach2 || state == states.mach3 || state == states.climbwall))
		{
			if (!event_instance_isplaying(machsnd))
				fmod_studio_event_instance_start(machsnd);
			fmod_studio_event_instance_set_paused(machsnd, false);
			var s = 0;
			if state == states.mach2 && sprite_index == spr_mach1 && grounded
				s = 1;
			else if ((state == states.mach2 && sprite_index == spr_mach2) || state == states.climbwall)
				s = 2;
			else if state == states.mach3 && sprite_index != spr_mach4
				s = 3;
			else if sprite_index == spr_mach4
				s = 4;
			fmod_event_set3DPosition(machsnd, x, y);
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(machsnd, "state", s, true);
		}
		else
			fmod_studio_event_instance_set_paused(machsnd, true);
		if state == states.grind
		{
			if (!event_instance_isplaying(knightslidesnd))
				fmod_studio_event_instance_start(knightslidesnd);
			fmod_event_set3DPosition(knightslidesnd, x, y);
		}
		else if (event_instance_isplaying(knightslidesnd))
			fmod_studio_event_instance_stop(knightslidesnd, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		
		if state == states.superjump
		{
			if !sjumper && !event_instance_isplaying(superjumpsnd)
			{
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(superjumpsnd, "state", 0, true);
				fmod_studio_event_instance_start(superjumpsnd);
			}
			else if sjumper
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(superjumpsnd, "state", 1, true);
		}
		else
			fmod_studio_event_instance_stop(superjumpsnd, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		if (event_instance_isplaying(superjumpsnd))
			fmod_event_set3DPosition(superjumpsnd, x, y);
		
		if (sprite_index == spr_machroll)
		{
			if (!event_instance_isplaying(machrollsnd))
				fmod_studio_event_instance_start(machrollsnd);
			fmod_event_set3DPosition(machrollsnd, x, y);
		}
		else
			fmod_studio_event_instance_stop(machrollsnd, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		if (event_instance_isplaying(suplexdashsnd))
		{
			if state != states.grab
				fmod_studio_event_instance_stop(suplexdashsnd, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
			fmod_event_set3DPosition(suplexdashsnd, x, y);
		}
		/*if p_characters.pierre
		{
			if state == states.grab
			{
				if (!event_instance_isplaying(ratmountpunchsnd))
					fmod_studio_event_instance_start(ratmountpunchsnd);
				fmod_event_set3DPosition(ratmountpunchsnd, x + hsp, y + vsp);
			}
			else
				fmod_studio_event_instance_stop(ratmountpunchsnd, true);
			if state == states.superjump
			{
				if (!event_instance_isplaying(ratmountgroundpoundsnd))
					fmod_studio_event_instance_start(ratmountgroundpoundsnd);
				s = 0;
				if (instance_exists(superslameffectid))
					s = 1;
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(ratmountgroundpoundsnd, "state", s, true);
				fmod_event_set3DPosition(ratmountgroundpoundsnd, x + hsp, y + vsp);
			}
			else
				fmod_studio_event_instance_stop(ratmountgroundpoundsnd, true);
		}
		else
			fmod_studio_event_instance_stop(ratmountmachsnd, true);*/
	}
}

function decrease_score(val)
{
	var s = global.score - val
	var num = -val
	
	if s < 0
		num += abs(0 - s)
	
	if num < 0
	{
		with instance_create(0, 0, obj_negativenumber)
			number = string(num)
	}
	
	global.score = max(global.score - val, 0)
}

function do_hurt(obj = noone)
{
	if state == states.actor
		return;
		
	if obj != noone
	{
		var xh = lerp(obj.bbox_left, obj.bbox_right, 0.5)
		var goto_xscale = 1
		if x != xh
			goto_xscale = sign(x - xh)
		var facing = xscale == -goto_xscale
		hsp = 8 * goto_xscale
		sprite_index = facing ? spr_player_hurt : spr_player_jumphurt
	}
	else
		sprite_index = spr_player_hurt
	
	flash = 8
	state = states.hurt
	vsp = -12
	global.combo.timer -= 30
	sleep(100)
	decrease_score(50)
	i_frames = 100
	event_play_oneshot("event:/sfx/player/hurt")
	
	particle_create(x, y, particles.parry)
	particle_create(x, y, particles.bang)
	create_effect(x, y, spr_hurtstars)
	
	repeat 5
		particle_create(x, y, particles.hurtstar)
		
	if global.score > 0
	{
		repeat 10
		{
			var spr = choose(
				spr_mushroomcollect, 
				spr_cheesecollect, 
				spr_tomatocollect, 
				spr_sausagecollect, 
				spr_pineapplecollect
			)
			
			with create_debris(x, y, spr)
			{
				hsp = random_range(-10, 10)
				vsp = random_range(-5, 0)
				image_angle = 0
				image_speed = 0.35
			}
		}
	}
	
	scr_tvtopmessage(choose("OW!","DON'T TOUCH THAT!", "YOUCH!", "YOU SUCK!"))
	with obj_tv
		tv_cardboard(3)
}


function scr_hitwall(_x, _y)
{
	return place_meeting(_x, _y, obj_solid) || behind_slope(_x, _y)
}