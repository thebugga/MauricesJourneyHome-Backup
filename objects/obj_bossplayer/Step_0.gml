with (obj_parent_player)
{
	state = states.actor
	x = -100
	y = -100
	visible = false
}
scr_getinput()
switch state
{
	case states.normal:
		scr_bossplayer_normal()
		break
	case states.blockstance:
		scr_bossplayer_spinkick()
		break
	case states.ratmountpunch:
		scr_bossplayer_roundabout()
		break
	case states.chainsaw:
		state_boss_chainsaw()
		break
	case states.arenaround:
		state_player_arenaround()
		break
}
if -key_left2
{
	if image_xscale == 1
		input_text += "L"
	else
		input_text += "R"
}
if key_right2
{
	if image_xscale == 1
		input_text += "R"
	else
		input_text += "L"
}
if key_up2
	input_text += "U"
if key_down2
	input_text += "D"
if key_jump
	input_text += "Z"
if key_slap2
	input_text += "X"
if global.playerCharacter == Characters.Maurice
{
	if string_ends_with(input_text, "ZDLX")
	{
		sprite_index = spr_player_kungfuair2transition
		image_index = 0
		state = states.blockstance
		input_text = ""
	}
	if string_ends_with(input_text, "RDLRX")
	{
		sprite_index = spr_lonegustavo_punch
		image_index = 0
		hsp = image_xscale * 15
		state = states.ratmountpunch
		input_text = ""
	}
}