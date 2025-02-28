function scr_player_tumble()
{
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railMovespeed = _railinst.Movespeed
		raildir = _railinst.dir
	}
	hsp = ((Xscale * Movespeed) + (railMovespeed * raildir))
	Move = (key_right + key_left)
	mask_index = spr_crouchmask
	if (sprite_index == spr_tumblestart)
		Movespeed = 6
	if ((!grounded) && (sprite_index == spr_machroll or sprite_index == spr_playerV_divekick or sprite_index == spr_crouchslip or sprite_index == spr_mach2jump or sprite_index == spr_player_backslide or sprite_index == spr_player_backslideland))
	{
		vsp = 10
		sprite_index = spr_dive
		//scr_soundeffectpitched(sfx_dive, 1.1, 1.2)
	}
	if (grounded && sprite_index == spr_dive)
	{
		sprite_index = spr_machroll
		image_index = 0
	}
	if (sprite_index == spr_dive && key_jump)
	{
		sprite_index = spr_player_poundcancel1
		image_index = 0
		state = states.freefall
		dir = Xscale
		vsp = -6
	}
	if (Movespeed <= 2 && sprite_index != spr_player_breakdance)
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
	if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_Sjumpcancelslide
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_machroll)
	{
		sprite_index = spr_player_backslideland
		image_index = 0
	}
	if (sprite_index == spr_machroll && (!grounded))
		sprite_index = spr_player_mach2jump
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_backslideland)
		sprite_index = spr_player_backslide
	if (sprite_index == spr_player_Sjumpcancel && grounded)
		sprite_index = spr_player_Sjumpcancelland
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
		sprite_index = spr_player_Sjumpcancelslide
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
	{
		particle_set_scale(particle.jumpdust, Xscale, 1)
		create_particle(x, y, particle.jumpdust, 0)
		Movespeed = 12
		sprite_index = spr_breakdancesuper
	}
	if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_tumble
		Movespeed = 14
	}
	if (((place_meeting((x + Xscale), y, obj_solid) or place_meeting_slope((x + Xscale), y)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && ((!(place_meeting((x + hsp), y, obj_rattumble))) or sprite_index != spr_tumble) && (!(place_meeting((x + hsp), y, obj_destructibles)))) or place_meeting(x, y, obj_timedgate))
	{
		hsp = 0;
		Movespeed = 0;
		if (sprite_index == spr_tumble or sprite_index == spr_tumblestart)
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
			//scr_soundeffectpitched(sfx_splat)
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
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_jumpdive1)
        sprite_index = spr_player_jumpdive2
    if (sprite_index == spr_player_jumpdive2 && key_attack && grounded)
    {
        sprite_index = spr_rollgetup
        state = states.mach3
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
	if ((!key_down) && key_attack && grounded && sprite_index != spr_tumble && (!(place_meeting_solid(x, (y - 16)))) && (!(place_meeting_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.Xscale
			if (Movespeed >= 12)
				state = states.mach3
			else
				state = states.mach2
			image_index = 0
			sprite_index = spr_rollgetup
			//scr_soundeffect(sfx_rollgetup)
		}
	}
	if (!key_down && !key_attack && grounded && vsp > 0 && state != states.bump && (sprite_index != spr_tumble && sprite_index != spr_tumbleend) && !place_meeting_solid(x, y - 16) && !place_meeting_solid(x, y - 32) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			if (Movespeed > 6)
			{
				state = states.machslide
				sprite_index = spr_machslidestart
				image_index = 0
			}
			else
				state = states.normal
		}
	}
	if (sprite_index == spr_player_Sjumpcancelslide or sprite_index == spr_breakdancesuper or sprite_index == spr_machroll or sprite_index == spr_tumble or sprite_index == spr_tumblestart or sprite_index == spr_machroll or sprite_index == spr_player_mach2jump)
		image_speed = (abs(Movespeed) / 15)
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
		image_speed = 0
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
		image_speed = 0
	else
		image_speed = 0.35
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_divekickstart)
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

