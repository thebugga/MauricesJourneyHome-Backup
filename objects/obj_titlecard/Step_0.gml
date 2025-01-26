if (!fadedin || fadeout)
	fadealpha = Approach(fadealpha, 1, 0.1)
else
	fadealpha = Approach(fadealpha, 0, 0.1)
if (fadealpha == 1)
	fadedin = true
if titlestate == 1
{
	if !titlecredit[image_index][3]
		titlealpha = Approach(titlealpha, 0, 0.1)
	layoutalpha = Approach(layoutalpha, 1, 0.1)
	skipalpha = Approach(skipalpha, 1, 0.1)
}
if titlestate == 2
{
	layoutalpha = Approach(layoutalpha, 0, 0.1)
	artalpha = Approach(artalpha, 1, 0.1)
}
if titlestate == 3
{
	artalpha = Approach(artalpha, 0, 0.1)
	musicalpha = Approach(musicalpha, 1, 0.1)
}
if titlecredit[image_index][4] & wipshow
{
	if wipscale > 1
	{
		wipscale -= 0.2
		wipangle += 5
		if wipscale == 1
		{
			wipshake = 20
			audio_play_sound(sfx_breakmetal, 1, false, (audio_sound_get_gain(titlecardmu) * 0.8) * global.option_sfx_volume)
		}
	}
	else
		wipshake = Approach(wipshake, 0, 1)
}
if titlestate != 0 && obj_player1.key_jump2 && !instance_exists(obj_fadeout)
{
	with obj_parent_player
	{
		input_buffer_jump = 0
		with (instance_create_unique(0, 0, obj_fadeout))
			restarttimer = true;
	}
	fadeout = true
}