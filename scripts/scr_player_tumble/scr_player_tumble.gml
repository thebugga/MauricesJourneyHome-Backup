function scr_player_tumble()
{
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = _railinst.movespeed
		raildir = _railinst.dir
	}
	hsp = ((Xscale * movespeed) + (railmovespeed * raildir))
	move = (key_right + key_left)
	mask_index = spr_crouchmask
	if (sprite_index == spr_tumblestart)
		movespeed = 6
	if !grounded && (sprite_index == spr_crouchslip || sprite_index == spr_machroll || sprite_index == spr_mach2jump || sprite_index == spr_player_backslide || sprite_index == spr_player_backslideland)
	{
		if global.playerCharacter == Characters.Doise
		{
			sprite_index = spr_playerN_divebomb;
			state = states.machcancel;
			savedmove = Xscale;
			vsp = 20;
			movespeed = hsp;
			input_buffer_slap = 0;
			input_buffer_jump = 0;
			image_index = 0;
			exit;
		}
		else
		{
			vsp = 10;
			sprite_index = spr_dive;
			fmod_studio_event_instance_start(snd_dive);
		}
	}
	if sprite_index == spr_tumble && grounded
	{
		if move == Xscale
			movespeed = approach(movespeed, 12, 0.25);
		else if move == -Xscale
			movespeed = approach(movespeed, 8, 0.25);
		else
			movespeed = approach(movespeed, 10, 0.25);
	}
	if grounded && sprite_index == spr_dive
	{
		sprite_index = spr_machroll;
		image_index = 0;
	}
	if sprite_index == spr_dive && key_jump
	{
		if global.playerCharacter != Characters.Doise
		{
			sprite_index = spr_player_poundcancel1;
			image_index = 0;
			state = states.freefall;
			dir = Xscale;
			vsp = -6;
		}
		else
		{
			sprite_index = spr_playerN_divebomb;
			state = states.machcancel;
			vsp = 20;
			hsp = 0;
			savedmove = Xscale;
			movespeed = 0;
			input_buffer_slap = 0;
			input_buffer_jump = 0;
			image_index = 0;
			exit;
		}
	}
	if (movespeed <= 2 && sprite_index != spr_player_breakdance)
	{
		state = states.normal
	}
	if ((!slopeCheck(x + Xscale, y)) && sprite_index == spr_tumblestart && floor(image_index) < 11)
		image_index = 11
	if (sprite_index == spr_mach2jump && grounded)
	{
		image_index = 0
		sprite_index = spr_machroll
	}
	if (sprite_index == spr_player_mach2jump && grounded)
	{
		image_index = 0
		sprite_index = spr_machroll
	}
	if (sprite_index == spr_player_Sjumpcancelland && animation_end())
		sprite_index = spr_player_Sjumpcancelslide
	if (animation_end() && sprite_index == spr_player_machroll)
	{
		sprite_index = spr_player_backslideland
		image_index = 0
	}
	if (sprite_index == spr_machroll && (!grounded))
		sprite_index = spr_player_mach2jump
	if (animation_end() && sprite_index == spr_player_backslideland)
		sprite_index = spr_player_backslide
	if (sprite_index == spr_player_Sjumpcancel && grounded)
		sprite_index = spr_player_Sjumpcancelland
	if (animation_end() && sprite_index == spr_player_Sjumpcancelland)
		sprite_index = spr_player_Sjumpcancelslide
	if (animation_end() && sprite_index == spr_player_breakdance)
	{
		particle_set_scale(particle.jumpdust, Xscale, 1)
		create_particle(x, y, particle.jumpdust, 0)
		movespeed = 12
		sprite_index = spr_breakdancesuper
	}
	if (sprite_index == spr_tumblestart && animation_end())
	{
		sprite_index = spr_tumble
		movespeed = 14
	}
	if (((place_meeting((x + Xscale), y, obj_solid) || slopeCheck(x + Xscale, y)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && ((!(place_meeting((x + hsp), y, obj_rattumble))) || sprite_index != spr_tumble) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
	{
		hsp = 0;
		movespeed = 0;
		if (sprite_index == spr_tumble || sprite_index == spr_tumblestart)
		{
			state = states.bump
			landAnim = false
			sprite_index = spr_tumbleend
			image_index = 0
			hsp = -Xscale * 2
			vsp = -3
			jumpstop = true
		}
		else
		{
			state = states.bump
			image_index = 0
			sprite_index = spr_player_wallsplat
			event_play_oneshot_3d("event:/sfx/pep/splat", x, y);
		}
	}
if (sprite_index == spr_crouchslip && global.playerCharacter == Characters.Pierre && input_buffer_jump > 0 && global.attackstyle != 2)
    {
        input_buffer_jump = 0
        particle_set_scale((5 << 0), Xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        sprite_index = spr_player_jumpdive1
        vsp = -9
    }
    if (animation_end() && sprite_index == spr_player_jumpdive1)
        sprite_index = spr_player_jumpdive2
    if (sprite_index == spr_player_jumpdive2 && key_attack && grounded) && global.playerCharacter != Characters.Pierre
    {
        sprite_index = spr_rollgetup
        state = states.mach3
    }
    if (sprite_index == spr_player_jumpdive2 && key_attack && grounded) && global.playerCharacter == Characters.Pierre
    {
		ratmount_movespeed = 12
        sprite_index = spr_lonegustavo_mach3
        state = states.ratmount
    }

	if key_jump
		input_buffer_jump = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if (input_buffer_jump < 8 && grounded && hsp != 0 && sprite_index == spr_tumble)
	{
		with (instance_create(x, y, obj_highjumpcloud2))
			image_xscale = other.Xscale
		vsp = -11
		image_index = 0
	}
	if (crouchslipbuffer > 0)
		crouchslipbuffer--
	if ((!key_down) && key_attack && grounded && sprite_index != spr_tumble && (!(place_meeting_solid(x, (y - 16)))) && (!(place_meeting_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance) && global.playerCharacter != Characters.Pierre
	{
		if (crouchslipbuffer == 0)
		{
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.Xscale
			if (movespeed >= 12)
				state = states.mach3
			else
				state = states.mach2
			image_index = 0
			sprite_index = spr_rollgetup
			fmod_studio_event_instance_start(rollgetupsnd)
		}
	}
    if ((!key_down) && key_attack && grounded && sprite_index != spr_tumble && (!(place_meeting_solid(x, (y - 16)))) && (!(place_meeting_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance) && global.playerCharacter == Characters.Pierre
    {
		ratmount_movespeed = 12
        sprite_index = spr_lonegustavo_mach3
        state = states.ratmount
    }
	if (!key_down && !key_attack && grounded && vsp > 0 && state != states.bump && (sprite_index != spr_tumble && sprite_index != spr_tumbleend) && !place_meeting_solid(x, y - 16) && !place_meeting_solid(x, y - 32) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			if (movespeed > 6)
			{
				state = states.machslide
				sprite_index = spr_machslidestart
				image_index = 0
			}
			else
				state = states.normal
		}
	}
	if (sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_breakdancesuper || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_machroll || sprite_index == spr_player_mach2jump)
		image_speed = (abs(movespeed) / 15)
	else if (animation_end() && sprite_index == spr_mach2jump)
		image_speed = 0
	else if (animation_end() && sprite_index == spr_player_Sjumpcancel)
		image_speed = 0
	else
		image_speed = 0.35
	if (animation_end() && sprite_index == spr_playerV_divekickstart)
		sprite_index = spr_playerV_divekick
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	exit;
}

