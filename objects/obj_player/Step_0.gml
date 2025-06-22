if !obj_shell.isOpen
	get_input(player)

struct_foreach(aftimg_timers, function(_name, _data)
{
	_data.do_it = false
})

if grounded
	coyote_time = 10
else if vsp < 0
	coyote_time = 0

#macro p_move (-key_left.down + key_right.down)

instakill = false

prevstate = state

input_buffers.grab = max(input_buffers.grab - 1, 0)
input_buffers.jump = max(input_buffers.jump - 1, 0)

if key_grab.pressed
	input_buffers.grab = 15
	
if key_jump.pressed
	input_buffers.jump = 15

if warping
	exit;

break_destroyables()

if hitstun > 0
{
	hitstun--
	image_index = prev.image_index
	exit;
}


switch (state)
{
	case states.taunt:
		player_taunt()
		break;
	case states.normal:
		player_normal()
		break;
	case states.jump:
		player_jump()
		break;
	case states.mach2:
		player_mach2()
		break;
	case states.mach3:
		player_mach3()
		break;
	case states.tumble:
		player_tumble()
		break;
	case states.slide:
		player_slide()
		break;
	case states.climbwall:
		player_climbwall()
		break;
	case states.wallspin:
		playerN_wallspin()
		break;
	case states.bump:
		player_bump()
		break;
	case states.groundpound:
		player_groundpound()
		break;
	case states.grab:
		player_grab()
		break;
	case states.nicklebag:
		player_nicklebag()
		break;
	case states.superjump:
		player_superjump()
		break;
	case states.crouch:
		player_crouch()
		break;
	case states.actor:
		player_actor()
		break;
	case states.ladder:
		player_ladder()
		break;
	case states.punch:
		player_punch()
		break;
	case states.hold:
		player_hold()
		break;
	case states.punchenemy:
		player_punchenemy()
		break;
	case states.piledriver:
		player_piledriver()
		break;
	case states.swingding:
		player_swingding()
		break;
	case states.grind:
		player_grind()
		break;
	case states.hurt:
		player_hurt()
		break;
	case states.parry:
		player_parry()
		break;
	case states.slipnslide:
		player_slipnslide()
		break;
	case states.swim:
		player_swim()
		break;
	case states.backtohub:
		player_backtohub()
		break;
	case states.noclip:
		player_noclip()
		break;
	case states.wizard:
		player_wizard()
		break;
	case states.wizardgrapple:
		player_wizardgrapple()
		break;
	case states.wizarddash:
		player_wizarddash()
		break;
	case states.wizardcling:
		player_wizardcling()
		break;
	case states.bounce:
		player_bounce()
		break;
	case states.fireass:
		player_fireass()
		break;
	case states.shotgunshoot:
		player_shotgunshoot()
		break;
	case states.ball:
		player_ball()
		break;
}

if (state != states.normal)
{
	breakdance_secret.buffer = 0
	breakdance_secret.spd = 0.25
	idletimer = 300
}

if has_pistol && (state == states.normal || state == states.jump || state == states.shotgunshoot)
{
	if pistolcooldown > 0
		pistolcooldown--
	
	if (key_grab.down && overwriteanim != spr_pistolshot) || pistolchargeshooting
        pistolcharge += 0.5
    else
        pistolcharge = 0
	
    if (pistolcharge > 0)
    {
        var ixa = [1, 9, 17, 25, 33]
        for (var i = 0; i < array_length(ixa); i++)
        {
            if (pistolcharge == ixa[i])
				event_play_oneshot_3d("event:/sfx/pep/revolvercharge", x, y)
        }
    }
    if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 12) && !pistolchargeshooting)
    {
        if (state != states.taunt && hitstun == 0)
        {
			pistolchargeshooting = true
			//scr_sound_3d(sfx_killenemy, x, y)
			//scr_sound_3d(sfx_shotgunshot, x, y)
			with create_effect(x, y, spr_guneffect)
			    image_xscale = other.xscale
			state = states.shotgunshoot
			if grounded
			    movespeed = 0
			reset_anim(spr_pistolshot)
			with instance_create(x + xscale * 46, (y + 6), obj_shotgunblast)
			{
				image_xscale = other.xscale
				depth = other.depth - 10
			}
        }
    }
    if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 1))
    {
        pistolchargeshooting = false
        pistolcharge = 0
    }
}
else
{
	pistolcooldown = 0
    pistolchargeshooting = false
    pistolcharge = 0
	
}

if coyote_time > 0
	coyote_time--
	
if flash > 0
	flash--
	
if state != states.jump
	fallingtimer = 0
	
if (idletimer > 0 && state == states.normal)
	idletimer--

if (i_frames > 0 && state != states.hurt)
	i_frames--

if (state == states.tumble || state == states.ball || state == states.crouch || (character == p_characters.mandrek && sprite_index == spr_mandrek_duck) || (state == states.superjump && !sjumper))
	mask_index = mask_player_small
else
	mask_index = mask_player
		
if room != rm_timesup
{
	if character != p_characters.mandrek
	{
		grav = 0.5
		if (((state == states.mach2 || state == states.mach3 || state == states.tumble) && character == p_characters.maurice) || (state == states.wallspin && character == p_characters.undoised)) && key_down.down && !grounded
			grav = 2
		if (state == states.ladder || state == states.wizardcling || (state == states.superjump && sjumper && sjumptimer > 0))
			grav = 0
		if (state == states.wizardgrapple)
			grav = 0.05
	}
	
	if state == states.fireass || state == states.ball
		instance_destroy(instance_place(x + hsp, y + vsp, obj_ratblock))
	
	if (state != states.noclip && state != states.backtohub)
		collide()
	
	var spd = 0.05
	if secret_cutscene
		visual_size = max(visual_size - spd, 0)
	else
		visual_size = min(visual_size + spd, 1)
}
	
if ((y > room_height + 200 || y < -200) && state != states.actor && state != states.backtohub)
{
	shake_camera()
	instance_create(0, 0, obj_technicaldifficulty)
	state = states.actor
	hsp = 0
	vsp = 0
	sprite_index = spr_idle
}


struct_foreach(aftimg_timers, function(_name, _data)
{
	if (_data.timer > 0)
		_data.timer--
	else if _data.do_it
	{
		afterimage_create(_data.effect)
		_data.timer = _data.resetpoint
	}
})

if ladderbuffer > 0
	ladderbuffer--

if supertauntcount >= 10
{
	supertauntcount = 10
	if !supertauntshow
	{
		event_play_oneshot("event:/sfx/misc/gotsupertaunt")
		supertauntshow = true
	}
	
	if supertauntbuffer > 0
		supertauntbuffer--;
	else if (state == states.normal || state == states.jump || state == states.mach2 || state == states.mach3)
	{
		supertauntbuffer = 4;
		create_effect(x + irandom_range(-25, 25), y + irandom_range(-10, 35), asset_get_index($"spr_supertauntspark{irandom_range(1, 5)}"))
	}
}

if room == treasure_room && x >= 320 && hasgerome
{
	hasgerome = false
	state = states.actor
	hsp = 0
	sprite_index = spr_idle
	image_speed = 0.35
	with obj_followerhandler
	{
		for (var i = 0; i < array_length(followers); i++) 
		{
			var follower = followers[i]
			if follower.sprs.idle == spr_gerome_keyidle
			{
				instance_create(follower.x, follower.y, obj_geromeanim)
				array_delete(followers, i, 1)
				i--
			}
		}
	}
}