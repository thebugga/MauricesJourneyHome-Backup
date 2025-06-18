with (obj_player)
{
	state = states.actor
	x = -100
	y = -100
	visible = false
	sprite_index = spr_idle
}

if player_index > -1
{
	get_input(player_index)
	#macro bp_move (-key_left.down + key_right.down)
}

invincible = false
switch state
{
	case states.actor:
		state_boss_arenaround()
		invincible = true
		break
	case states.normal:
		if player_index > -1
			scr_bossplayer_normal()
		break
	case states.mach3:
		scr_bossplayer_spinkick()
		break
	case states.grab:
		scr_bossplayer_roundabout()
		break
	case states.stun:
		grav = 0.5
		state_boss_hitlag()
		break
	case states.taunt:
		state_boss_taunt()
		invincible = true
		break
	case states.parry:
		state_boss_parry()
		invincible = true
		break
	case states.hit:
		state_boss_stun()
		break
}

if character == p_characters.maurice
{
	if string_ends_with(input_text, "ZDLX")
	{
		reset_anim(spr_player_kungfuair2transition)
		state = states.mach3
		input_text = ""
	}
	if string_ends_with(input_text, "RDLRX")
	{
		reset_anim(spr_lonegustavo_punch)
		hsp = image_xscale * 15
		state = states.grab
		input_text = ""
	}
}