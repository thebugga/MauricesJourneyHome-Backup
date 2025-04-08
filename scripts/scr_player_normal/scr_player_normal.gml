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
    dir = lerp(dir, move, 0.3)
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
	if global.leveltosave == "freezer" && !global.noisejetpack
		idlespr = spr_player_freezeridle;
	if global.pistol && global.playerCharacter != Characters.Doise
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
		Xscale = move;
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
			else if ((global.combo >= 25 && global.combo < 50)
			|| (global.noisejetpack && (global.playerCharacter != Characters.Doise || noisepizzapepper)))
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
				event_play_oneshot_3d("event:/sfx/pep/step", x, y);
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
				if (sprite_index != idlespr && floor(image_index) == image_number - 1)
				{
					facehurt = false;
					idle = 0;
				}
				if ((!global.pistol || global.playerCharacter == Characters.Doise) && !shotgunAnim && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
				{
					idleanim = random_range(0, 100);
					if (irandom(100) <= 25)
						event_play_oneshot_3d("event:/sfx/voice/myea", x, y);
					image_index = 0;
					if idleanim <= 16
						sprite_index = spr_idle1;
					else if idleanim > 16 && idleanim <= 32
						sprite_index = spr_idle2;
					else if idleanim > 32 && idleanim <= 48
						sprite_index = spr_idle3;
					else if idleanim > 48 && idleanim <= 64
						sprite_index = spr_idle4;
					else if idleanim > 64 && idleanim <= 80
						sprite_index = spr_idle5;
					else
						sprite_index = spr_idle6;
				}
			}
			else if !facehurt
			{
				if (windingAnim < 1800 || angry || shoot)
				{
					start_running = true;
					movespeed = 0;
					if shoot
						sprite_index = spr_player_pistolidle;
					else if mort
						sprite_index = spr_player_mortidle;
					else if breakdance_pressed >= breakdance_max
						sprite_index = spr_breakdance;
					else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_hurtidle;
					else if (global.panic && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_panic;
					else if ((global.combo >= 25 && global.combo < 50)
					|| (global.noisejetpack && (global.playerCharacter != Characters.Doise || noisepizzapepper)))
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
			if floor(image_index) == image_number - 1
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
				if floor(image_index) == image_number - 1
					landAnim = false;
			}
			else
			{
				sprite_index = spr_land2;
				if floor(image_index) == image_number - 1
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
			if floor(image_index) == image_number - 1
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
	if floor(image_index) == image_number - 1
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
				else if global.pistol && global.playerCharacter != Characters.Doise
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
			image_index = 0;
			jumpAnim = false;
		}
		else
			jumpAnim = true;
		state = states.jump;
	}
	if input_buffer_shoot > 0
	{
		if shotgunAnim
			scr_shotgunshoot();
	}
	if (input_buffer_slap > 0 && key_up && shotgunAnim == 0 && (!global.pistol || global.playerCharacter == Characters.Doise))
	{
		state = states.punch;
		input_buffer_slap = 0;
		image_index = 0;
		sprite_index = spr_breakdanceuppercut;
		fmod_studio_event_instance_start(snd_uppercut);
		
		if global.playerCharacter != Characters.Doise
			vsp = -14;
		else
			vsp = -20;
		
		movespeed = hsp;
		if key_attack // high jump going left
			movespeed = abs(hsp);
		
		particle_set_scale(particle.highjumpcloud2, Xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
		
		if global.playerCharacter == Characters.Doise
		{
			repeat 4
			{
				with (instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect))
				{
					sprite_index = spr_shineeffect;
					image_speed = 0.35;
				}
			}
		}
	}

	if global.playerCharacter != Characters.Gabbie
	{
            if key_attack
            {
                state = states.mach2
                image_index = 0
                sprite_index = spr_mach1
                if (movespeed < 6)
                    movespeed = 6
            }
            if key_slap2 && !key_up2
            {
                scr_dograb()
            }
            if (key_slap2 && key_up2)
            {
                state = states.punch
                image_index = 0
                sprite_index = spr_breakdanceuppercut
                vsp = -14
                movespeed = hsp
            }
	}
	else
	{
            if pogochargeactive
            {
                if key_attack
                {
                    state = states.Sjumpprep
                    image_index = 0
                    sprite_index = ((!key_up) ? spr_playerN_jetpackstart : spr_superjumpprep)
                    hsp = 0
                    vsp = 0
                }
            }
            else if key_attack
            {
                sprite_index = spr_playerN_pogobounce
                state = states.pogo
                image_speed = 0.35
            }
	}
	if key_slap2 && !key_up && global.playerCharacter == Characters.Mrorange
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
		event_play_oneshot_3d("event:/sfx/enemies/kill", x, y);
	}
	if (key_shoot2 && global.playerCharacter == Characters.Mrorange && !instance_exists(dynamite_inst))
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
    scr_dotaunt()
    image_speed = 0.35
}



function scr_player_ratmount() //gml_Script_scr_player_ratmount
{
    if (global.swapmode && key_attack && key_fightball && ratmount_movespeed >= 12 && (!instance_exists(obj_swapmodegrab)) && (!instance_exists(obj_swapdeatheffect)) && (!instance_exists(obj_noiseanimatroniceffect)) && obj_swapmodefollow.animatronic <= 0)
    {
        sprite_index = spr_fightball
        jump_p2 = 0
        instance_create_unique(x, y, obj_swapgusfightball)
        state = states.mach3
        movespeed = abs(hsp)
        if (movespeed < 12)
            movespeed = 12
        if (hsp != 0)
            Xscale = sign(hsp)
        return;
    }
    move = (key_left + key_right)
    doublejump = 0
    if (ratgrabbedID != noone && (!instance_exists(ratgrabbedID)))
        ratgrabbedID = noone
    hsp = movespeed
    var r = ratmount_movespeed
    if ((place_meeting((x + Xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) or (abs(movespeed) < 8 && move != Xscale) or (!key_attack) or abs(movespeed) <= 6)
    {
        gustavodash = 0
        ratmount_movespeed = 8
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && gustavodash != 51)
    {
        movespeed = 0
        if (r >= 12)
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                event_play_oneshot_3d("event:/sfx/maurice/groundpound", x, y)
                state = states.bump
                if brick
                    sprite_index = spr_player_ratmountbump
                else
                    sprite_index = spr_lonegustavo_bump
                image_index = 0
                instance_create((x + (Xscale * 15)), (y + 10), obj_bumpeffect)
                hsp = ((-Xscale) * 4)
                vsp = -5
                with (obj_camera)
                {
                    shake_mag = 4
                    shake_mag_acc = (5 / room_speed)
                }
                return;
            }
        }
    }
    if (ratmount_movespeed >= 12 && gustavodash != 51)
    {
        instance_create(x, y, obj_jumpdust)
        gustavodash = 51
    }
    if (ratmount_movespeed >= 12 or gusdashpadbuffer > 0)
    {
        if (!instance_exists(chargeeffectid))
        {
            with (instance_create(x, y, obj_chargeeffect))
            {
                playerid = other.object_index
                other.chargeeffectid = id
            }
        }
    }
    if (move != Xscale && move != 0 && gusdashpadbuffer <= 0 && sprite_index != spr_lonegustavo_kick)
    {
        Xscale = move
        if (abs(movespeed) > 2 && abs(hsp) > 2 && grounded)
        {
            event_play_oneshot_3d("event:/sfx/maurice/backslide", x, y)
            state = states.ratmountskid
            movespeed = abs(movespeed)
        }
    }
    if (gusdashpadbuffer > 0 && movespeed != 0)
        Xscale = sign(movespeed)
    if (gusdashpadbuffer > 0)
        gusdashpadbuffer--
    if (gusdashpadbuffer <= 0)
    {
        if (move != 0)
        {
            if (move == Xscale)
                movespeed = approach(movespeed, (Xscale * ratmount_movespeed), 0.5)
            else
                movespeed = approach(movespeed, 0, 0.5)
        }
        else
            movespeed = approach(movespeed, 0, 0.5)
    }
    else
    {
        ratmount_movespeed = 12
        movespeed = (Xscale * ratmount_movespeed)
    }
    if (abs(movespeed) > 2)
        image_speed = (abs(movespeed) / 12)
    else
        image_speed = 0.35
    if (sprite_index == spr_player_ratmountmach3 or sprite_index == spr_lonegustavo_mach3)
        image_speed = 0.4
    var front = (place_meeting_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	if sprite_index != spr_player_haulingstart
	{
	    if brick
	    {
	        if (!landAnim)
	        {
	            if (hsp != 0 && (!front))
	            {
	                if riderispeetzy && ratgrabbedID != noone
						sprite_index = spr_player_ratmountmove2
					else
					{
						if (ratmount_movespeed >= 12 or gusdashpadbuffer > 0)
		                    sprite_index = spr_player_ratmountmach3
		                else if key_attack
		                    sprite_index = spr_player_ratmountattack
		                else
		                    sprite_index = spr_player_ratmountmove
					}
	            }
	            else
	            {
	                image_speed = 0.35
	                if (sprite_index != spr_player_ratmountidleanim)
	                {
	                    if riderispeetzy && ratgrabbedID != noone
							sprite_index = spr_player_ratmountidle2
						else
	                    {
							sprite_index = spr_player_ratmountidle
	                        if (idle < 400)
	                            idle++
	                        if (idle >= 150)
	                        {
	                            sprite_index = spr_player_ratmountidleanim
	                            image_index = 0
	                        }
	                    }
	                }
	                else if (animation_end())
	                {
	                    idle = 0
	                    sprite_index = spr_player_ratmountidle
	                }
	            }
	        }
	        if (animation_end())
	        {
	            landAnim = 0
	            if (sprite_index == spr_player_ratmountland)
	                sprite_index = spr_player_ratmountidle
	        }
	        if (sprite_index == spr_player_ratmountland)
	            image_speed = 0.35
	    }
	    else
	    {
	        if (hsp != 0 && (!front))
	        {
	            if (ratmount_movespeed >= 12 or gusdashpadbuffer > 0)
	                sprite_index = spr_lonegustavo_mach3
	            else if key_attack
	                sprite_index = spr_lonegustavo_dash
	            else
	                sprite_index = spr_lonegustavo_walk
	        }
	        else
	            sprite_index = spr_lonegustavo_idle
	        image_speed = 0.35
	    }
	}
	else if (animation_end())
	    sprite_index = spr_player_ratmountidle2
    if (hsp != 0 && grounded && vsp > 0 && (!front))
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 18
            if (sprite_index != spr_player_ratmountattack)
                event_play_oneshot_3d("event:/sfx/maurice/step", x, y)
        }
    }
    if (input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && state != states.ratmountskid && sprite_index != spr_player_haulingstart)
    {
        input_buffer_jump = 0
        particle_set_scale((4 << 0), Xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        scr_fmod_soundeffect(jumpsnd, x, y)
        if brick
        {
            if ((ratmount_movespeed >= 12 && key_attack) or gusdashpadbuffer > 0)
                sprite_index = spr_player_ratmountdashjump
            else if riderispeetzy && ratgrabbedID != noone
				sprite_index = spr_player_ratmountjump2
			else
                sprite_index = spr_player_ratmountjump
        }
        else if ((ratmount_movespeed >= 12 && key_attack) or gusdashpadbuffer > 0)
            sprite_index = spr_lonegustavo_dashjump
        else
            sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        jumpAnim = 1
        state = states.ratmountjump
        vsp = -11
        jumpstop = 0
    }
    if ((!grounded) && sprite_index != spr_player_ratmountswallow && sprite_index != spr_player_haulingstart)
    {
        state = states.ratmountjump
        jumpAnim = 0
        if (ratmount_movespeed >= 12)
        {
            if brick
	             sprite_index = spr_player_ratmountdashjump
            else
                sprite_index = spr_lonegustavo_dashjump
        }
        else if brick
		{
			if riderispeetzy && ratgrabbedID != noone
				sprite_index = spr_player_ratmountfall2
			else
	            sprite_index = spr_player_ratmountfall
		}
        else
            sprite_index = spr_player_ratmountgroundpoundfall
    }
    if (key_attack && grounded && (!(place_meeting((x + Xscale), y, obj_solid))) && !(riderispeetzy && ratgrabbedID != noone))
    {
        move = Xscale
		var truespeed = brick ? (riderispeetzy ? 12 : 10) : 11
        if (ratmount_movespeed < truespeed)
            ratmount_movespeed = approach(ratmount_movespeed, truespeed, 0.15)
    }
	if (scr_check_superjump() && fightball == 0 && ratmount_movespeed >= 12 && grounded && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
	{
		sprite_index = spr_superjumpprep;
		state = states.Sjumpprep;
		hsp = 0;
		image_index = 0;
	}
    if (((input_buffer_slap > 0 && key_up) or key_shoot2) && brick && !riderispeetzy && gusdashpadbuffer == 0)
    {
        input_buffer_slap = 0
        ratmount_kickbrick()
        if (state == states.ratmountskid)
        {
            movespeed = (-movespeed)
            hsp = movespeed
        }
    }
    if (input_buffer_slap > 0 && (!key_up) && gusdashpadbuffer == 0)
    {
        input_buffer_slap = 0
		if !brick
		{
			particle_set_scale((5 << 0), Xscale, 1)
	        create_particle(x, y, (5 << 0), 0)
	        input_buffer_slap = 0
	        if (brick == 1)
	        {
	            with (instance_create(x, y, obj_brickcomeback))
				{
					playerid = other.id
					ispeetzy = other.riderispeetzy
	                wait = 1
				}
	        }
	        brick = 0
	        ratmountpunchtimer = 25
	        gustavohitwall = 0
	        state = states.ratmountpunch
	        image_index = 0
	        if (move != 0)
	            Xscale = move
	        movespeed = (Xscale * 12)
	        sprite_index = spr_lonegustavo_punch
		}
		else
		{
			if riderispeetzy
			{
				if (ratgrabbedID != noone)
		        {
		            state = states.ratmountspit
		            sprite_index = spr_player_ratmountspit
		            image_index = 0
		        }
		        else
		        {
		            state = states.ratmountattack
		            movespeed = 10
		            sprite_index = spr_player_ratmountattack
		            image_index = 0
		        }
			}
		}
    }
    if ((!instance_exists(dashcloudid)) && grounded && ratmount_movespeed >= 12)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.Xscale
            other.dashcloudid = id
        }
    }
    if ((key_down && grounded && vsp > 0 && gusdashpadbuffer <= 0) or place_meeting_solid(x, y))
    {
		if key_attack
			state = states.ratmounttumble
		else
			state = states.ratmountcrouch
        if (brick == 1)
        {
            with (instance_create(x, y, obj_brickcomeback))
			{
				playerid = other.id
				ispeetzy = other.riderispeetzy
                wait = 1
			}
        }
        brick = 0
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_shootpowerup()
    ratmount_dotaunt()
}

function ratmount_dotaunt() //gml_Script_ratmount_dotaunt
{
    if (key_taunt2 && state != states.backbreaker && gusdashpadbuffer == 0)
    {
        if brick
		{
			notification_push((55 << 0), [room])
	        tauntstoredisgustavo = 1
	        taunttimer = 20
	        tauntstoredmovespeed = movespeed
	        tauntstoredratmount_movespeed = ratmount_movespeed
	        tauntstoredsprite = sprite_index
	        tauntstoredstate = state
	        tauntstoredvsp = vsp
	        state = states.backbreaker
	        if ((!supercharged) or (!key_up))
	        {
	            scr_create_parryhitbox()
	            event_play_oneshot_3d("event:/sfx/maurice/taunt", x, y)
	            sprite_index = spr_player_ratmounttaunt
	            image_index = irandom((sprite_get_number(sprite_index) - 1))
	            with (instance_create(x, y, obj_taunteffect))
	                player = other.id
	        }
	        else if (supercharged && key_up)
	        {
	            ini_open_from_string(obj_savesystem.ini_str)
	            ini_write_real("Game", "supertaunt", 1)
	            obj_savesystem.ini_str = ini_close()
	            event_play_oneshot_3d("event:/sfx/maurice/supertaunt", x, y)
	            sprite_index = spr_player_ratmountsupertaunt
	            image_index = 0
	        }
		}
		else
		{
			riderispeetzy = !riderispeetzy
			obj_pierrefriendfollow.visible = false
			with (instance_create(obj_pierrefriendfollow.x, obj_pierrefriendfollow.y, obj_brickcomeback))
			{
				playerid = other.id
				ispeetzy = other.riderispeetzy
	            comeback = 1
			}
		}
    }
}

function ratmount_kickbrick() //gml_Script_ratmount_kickbrick
{
    var _pad = 32
    event_play_oneshot_3d("event:/sfx/enemies/killingblow", (x + (image_xscale * _pad)), y)
    with (instance_create((x + (image_xscale * _pad)), y, obj_brickball))
    {
        playerid = other.id
		if (other.state == states.ratmountjump or other.state == states.ratmountbounce)
            up = 1
        image_xscale = other.Xscale
        xoffset = _pad
    }
    state = states.ratmountgroundpound
    sprite_index = spr_lonegustavo_kick
    image_index = 0
    image_speed = 0.35
    gustavokicktimer = 5
    brick = 0
}

function ratmount_shootpowerup() //gml_Script_ratmount_shootpowerup
{
    if (key_shoot2 && ratpowerup != -4 && ratshootbuffer <= 0)
    {
        switch ratpowerup
        {
            case 738:
                with (instance_create((x + (20 * Xscale)), y, obj_playernoisearrow))
                    direction = point_direction(x, y, (x + (other.Xscale * 4)), y)
                break
            case 434:
                with (instance_create((x + (20 * Xscale)), (y + 20), obj_playersmokehitbox))
                {
                    spd += (other.movespeed / 2)
                    image_xscale = other.Xscale
                }
                break
            case 754:
                with (instance_create((x + (20 * Xscale)), y, obj_playerspikecheese))
                {
                    spd += other.movespeed
                    image_xscale = other.Xscale
                }
                break
        }

        ratshootbuffer = 30
    }
}

function scr_player_normal()
{
	if global.playerCharacter != Characters.Pierre
		state_player_normal();
	else
	scr_player_ratmount()
}
