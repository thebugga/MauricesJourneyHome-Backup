function scr_player_mach3()
{
	if sprite_index == spr_fightball
	{
		scr_player_fightball();
		exit;
	}										 
			var slopeaccel = 0.1;
			var slopedeccel = 0.2;
			var mach4movespeed = 20;
			var mach3movespeed = 16;
			var accel = 0.025;
			var mach4accel = 0.1;
			var jumpspeed = -11;
			var machrollspeed = 10;
			
			var mach3_spr = spr_mach4;
			if (global.swapmode && key_attack && obj_swapmodefollow.key_attack && !instance_exists(obj_swapmodegrab) && !instance_exists(obj_swapdeatheffect) && obj_swapmodefollow.animatronic <= 0)
			{
				sprite_index = spr_fightball;
				jump_p2 = false;
				//if noisecrusher
				//	instance_create_unique(x, y, obj_swapgusfightball);
				exit;
			}
			if global.playerCharacter == Characters.Doise && grounded && vsp > 0
			{
				if (sprite_index == spr_mach4 && place_meeting(x, y + 1, [obj_dangerwater, obj_water]))
					sprite_index = spr_playerN_mach3water;
				else if (sprite_index == spr_playerN_mach3water && !place_meeting(x, y + 1, obj_dangerwater))
					sprite_index = spr_mach4;
			}
			
			if windingAnim < 2000
				windingAnim++;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				railmovespeed = _railinst.movespeed;
				raildir = _railinst.dir;
			}
			hsp = (Xscale * movespeed) + (railmovespeed * raildir);
			if grounded
			{
				if ((slopeCheck(x + Xscale, y) && hsp != 0) && movespeed > 10 && movespeed < 18)
					scr_player_addslopemomentum(slopeaccel, slopedeccel);
			}
			if move == Xscale && grounded
			{
				if movespeed < mach4movespeed
				{
					if mach4mode == 0
						movespeed += accel;
					else
						movespeed += mach4accel;
				}
			}
			if grounded && sprite_index == spr_playerN_skateboarddoublejump
			{
				sprite_index = mach3_spr;
				event_play_oneshot_3d("event:/sfx/playerN/wallbounceland", x, y);
			}
			
			mach2 = 100;
			momemtum = true;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if fightball == 1 && global.coop == 1
			{
				if object_index == obj_player1
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if object_index == obj_player2
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
	if input_buffer_slap > 0 && !key_up && !skateboarding && shotgunAnim == 0 && !global.pistol && sprite_index != spr_player_jumpdive1 && sprite_index != spr_player_jumpdive2
	{
		scr_dograb()
	}
			if sprite_index == spr_crazyrun
			{
				if flamecloud_buffer > 0
					flamecloud_buffer--;
				else
				{
					flamecloud_buffer = 10;
					with (instance_create(x, y, obj_dashcloud))
					{
						image_xscale = other.Xscale;
						sprite_index = spr_flamecloud;
					}
				}
			}
			crouchslideAnim = true;
			
			if (animation_end() && sprite_index == spr_playerN_skateboarddoublejump)
				image_index = image_number - 3;
			if sprite_index == spr_mach2jump && grounded && vsp > 0
				sprite_index = mach3_spr;
			
			if !key_jump2 && jumpstop == 0 && vsp < 0.5
			{
				vsp /= 20;
				jumpstop = true;
			}
			if grounded && vsp > 0
				jumpstop = false;
			if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && Xscale == -1) && !(move == -1 && Xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				particle_set_scale(particle.jumpdust, Xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				if sprite_index != spr_fightball
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				if global.playerCharacter == Characters.Maurice
					vsp = jumpspeed;
				else
					vsp = -13;
			}
			if fightball == 0
			{
				if (sprite_index == spr_mach3jump && animation_end())
					sprite_index = mach3_spr;
				if sprite_index == spr_rockethitwall && grounded
					sprite_index = mach3_spr;
				if (animation_end() && (sprite_index == spr_rollgetup or sprite_index == spr_mach3hit or sprite_index == spr_dashpadmach))
					sprite_index = mach3_spr;
				if sprite_index == spr_mach2jump && grounded && vsp > 0
					sprite_index = mach3_spr;
				if (sprite_index == spr_playerN_sidewayspin && animation_end())
					sprite_index = spr_playerN_sidewayspinend;
				if (grounded && (sprite_index == spr_playerN_sidewayspin or sprite_index == spr_playerN_sidewayspinend))
					sprite_index = mach3_spr;
				
				if movespeed > mach3movespeed && sprite_index != spr_crazyrun && sprite_index != spr_rockethitwall && sprite_index != spr_taunt
				{
					mach4mode = true;
					flash = true;
					sprite_index = spr_crazyrun;
				}
				else if movespeed <= mach3movespeed && sprite_index == spr_crazyrun
					sprite_index = mach3_spr;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, obj_crazyrunothereffect))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (sprite_index == mach3_spr or sprite_index == spr_fightball)
				image_speed = 0.4;
			else if sprite_index == spr_crazyrun
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup or sprite_index == spr_mach3hit or sprite_index == spr_dashpadmach)
				image_speed = 0.4;
			
			if (((!key_attack && fightball == 0 && !launched) && sprite_index != spr_dashpadmach && grounded && vsp > 0))
			{
				sprite_index = spr_machslidestart;
				if global.playerCharacter == Characters.Maurice
					event_play_oneshot_3d("event:/sfx/maurice/break", x, y);
				else
					event_play_oneshot_3d("event:/sfx/playerN/break", x, y);
				state = states.machslide;
				image_index = 0;
				launched = false;
			}
			if (move == -Xscale && grounded && vsp > 0 && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				if global.playerCharacter == Characters.Maurice
					event_play_oneshot_3d("event:/sfx/maurice/machslideboost", x, y);
				else
					event_play_oneshot_3d("event:/sfx/playerN/machslide", x, y);
				sprite_index = spr_mach3boost;
				state = states.machslide;
				image_index = 0;
			}
			//if global.playerCharacter == Characters.Doise
			//{
			//	if key_down
			//	state = states.freefallprep
			//}
			if (scr_mach_check_dive() && fightball == 0 && (sprite_index != spr_dashpadmach or dropboost) && sprite_index != spr_rockethitwall)
			{
				particle_set_scale(particle.jumpdust, Xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
				flash = false;
				state = states.tumble;
				image_index = 0;
				vsp = machrollspeed;
				if !grounded
					sprite_index = spr_mach2jump;
				else
					sprite_index = spr_machroll;
				if global.playerCharacter == Characters.Mrorange
					sprite_index = spr_playerV_divekickstart;
			}
			if ((grounded && (place_meeting(x + hsp, y, obj_solid) or slopeCheck(x + Xscale, y)) && !place_meeting(x + hsp, y, obj_destructibles)))
			{
				var _climb = true;
				if global.playerCharacter == Characters.Doise
					_climb = ledge_bump(40);
				if _climb
				{
					machhitAnim = false
					if movespeed < 1
						Wallmovespeed = 1; 
					else
					{
						vsp -= 0.5
						Wallmovespeed = movespeed;
					}
					state = states.climbwall
				}
			}
			if input_buffer_jump > 0 && !can_jump && key_up && global.playerCharacter == Characters.Doise && noisedoublejump
				scr_player_do_noisecrusher();
			if ((!grounded && (place_meeting(x + hsp, y, obj_solid) or slopeCheck(x + Xscale, y)) && !place_meeting(x + hsp, y, obj_destructibles)))
			{
				var _climb = true;
				if global.playerCharacter == Characters.Doise
					_climb = ledge_bump(40);
				if _climb
				{
					if global.playerCharacter == Characters.Clownmato
					{
						state = states.hang
					}
					machhitAnim = false
					if movespeed < 1
						Wallmovespeed = 1;
					else
					{
						vsp -= 0.5
						Wallmovespeed = movespeed;
					}
					state = states.climbwall
				}
			}
			if (input_buffer_slap > 0 && key_up && shotgunAnim == 0 && sprite_index != spr_dashpadmach)
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
				particle_set_scale(particle.highjumpcloud2, Xscale, 1);
				create_particle(x, y, particle.highjumpcloud2, 0);
			}
			if input_buffer_shoot > 0 && sprite_index != spr_dashpadmach
			{
				if shotgunAnim
					scr_shotgunshoot();
				else if global.pistol
					scr_pistolshoot(states.mach3);
			}
			if ((place_meeting_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid)) && !slopeCheck(x + Xscale, y) && (place_meeting_slope(x + sign(hsp), y) or place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
			{
				var _bump = true;
				if (global.playerCharacter == Characters.Maurice or noisemachcancelbuffer <= 0)
					_bump = ledge_bump((vsp >= 0) ? 32 : 22);
				if _bump
				{
					with obj_camera
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					with obj_parent_enemy
					{
						if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
						{
							stun = true;
							alarm[0] = 200;
							ministun = false;
							vsp = -5;
							hsp = 0;
						}
					}
					if !fightball
					{
						sprite_index = spr_hitwall;
						event_play_oneshot_3d("event:/sfx/maurice/groundpound", x, y);
						event_play_oneshot_3d("event:/sfx/maurice/bumpwall", x, y);
						hsp = 0;
						flash = false;
						state = states.bump;
						hsp = -6 * Xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + (Xscale * 15), y + 10, obj_bumpeffect);
					}
					else
					{
						fightball = false;
						with obj_parent_player
						{
							sprite_index = spr_hitwall;
							instance_create(x + 10, y + 10, obj_bumpeffect);
							event_play_oneshot_3d("event:/sfx/maurice/groundpound", x, y);
							event_play_oneshot_3d("event:/sfx/maurice/bumpwall", x, y);
							hsp = 0;
							flash = false;
							state = states.bump;
							hsp = -6 * Xscale;
							vsp = -6;
							mach2 = 0;
							image_index = 0;
						}
					}
				}
			}
	var b = false;
	if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_dangerwater) && !b)
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if other.fightball == 1
				instance_create(obj_parent_player.x, obj_parent_player.y, obj_slapstar);
			image_xscale = other.Xscale;
			other.dashcloudid = id;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_dangerwater) && !b)
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if other.fightball == 1
				instance_create(obj_parent_player.x, obj_parent_player.y, obj_slapstar);
			image_xscale = other.Xscale;
			sprite_index = spr_watereffect;
			other.dashcloudid = id;
		}
	}
	scr_dotaunt();
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
		}
	}
	if (sprite_index == mach3_spr or sprite_index == spr_fightball)
		image_speed = 0.4;
	else if sprite_index == spr_crazyrun
		image_speed = 0.75;
	else if (sprite_index == spr_rollgetup or sprite_index == spr_mach3hit)
		image_speed = 0.4;
	else
		image_speed = 0.4;
	if (scr_check_superjump() && fightball == 0 && state == states.mach3 && grounded && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
	{
		sprite_index = spr_superjumpprep;
		state = states.Sjumpprep;
		hsp = 0;
		image_index = 0;
	}
	if global.attackstyle == 2 && key_slap2
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
		image_index = 0;
		state = states.lungeattack;
	}
}

function scr_player_fightball() //gml_Script_scr_player_fightball
{
    image_speed = 0.4
    if (noisecrusher or global.playerCharacter == Characters.Pierre)
        instance_create_unique(x, y, obj_swapgusfightball)
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = Xscale * movespeed + railmovespeed * raildir
    if (movespeed <= 20)
        movespeed += 0.1
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
    {
        instance_create((x + 10 * Xscale), (y + 10), obj_bumpeffect)
        //event_play_oneshot_3d("event:/sfx/maurice/bumpwall", x, y)
        Xscale *= -1
        if (obj_swapmodefollow.key_jump2 or key_jump2)
        {
            scr_fmod_soundeffect(jumpsnd, x, y)
            jumpstop = false
            vsp = -14
        }
    }
    if (!key_attack or !obj_swapmodefollow.key_attack)
    {
        if (!key_attack)
            swap_player(false)
        state = states.mach3
        sprite_index = spr_mach4
        if global.playerCharacter == Characters.Pierre
        {
            state = states.ratmount
            ratmount_movespeed = abs(movespeed)
            if (ratmount_movespeed < 12)
                ratmount_movespeed = 12
            movespeed = ratmount_movespeed * Xscale
        }
        with (obj_tv)
        {
            state = (250 << 0)
            tv_trans = 0
            expressionsprite = -4
        }
    }
    if ((!jumpstop) && vsp < 0 && ((jump_p2 && !obj_swapmodefollow.key_jump) or (!jump_p2 && !key_jump2)))
    {
        jumpstop = true
        vsp /= 20
    }
    if (obj_swapmodefollow.key_jump or key_jump)
    {
        if obj_swapmodefollow.key_jump
            jump_p2 = true
        else
            jump_p2 = false
        input_buffer_jump = 10
    }
    if (can_jump && input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        vsp = -11
        jumpstop = false
        scr_fmod_soundeffect(jumpsnd, x, y)
        particle_set_scale((5 << 0), Xscale, 1)
        create_particle(x, y, (5 << 0), 0)
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        var water = place_meeting(x, (y + 1), obj_dangerwater)
        with (instance_create(x, y, obj_superdashcloud))
        {
            instance_create(obj_parent_player.x, obj_parent_player.y, obj_slapstar)
            image_xscale = other.Xscale
            if water
                sprite_index = spr_watereffect
            other.dashcloudid = id
        }
    }
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index
            other.chargeeffectid = id
        }
    }
    if (fightball_snd_buffer > 0)
        fightball_snd_buffer--
    else
    {
        fightball_snd_buffer = 15
        //event_play_oneshot_3d("event:/sfx/playerN/fightball", x, y)
    }
    if (fightball_buffer1 > 0)
        fightball_buffer1--
    else
    {
        fightball_buffer1 = 20 + irandom(8)
        repeat (irandom(4) + 1)
            instance_create((x + (irandom_range(-60, 60))), (y + (irandom_range(-20, 60))), obj_gusbrickcloud)
    }
    if (fightball_buffer2 > 0)
        fightball_buffer2--
    else
    {
        fightball_buffer2 = 8 + irandom(5)
        with (create_debris(x, y, spr_slapstar))
            vsp = (-(irandom_range(5, 10)))
        with (create_debris(x, y, spr_baddiegibs))
            vsp = (-(irandom_range(5, 10)))
    }
}
