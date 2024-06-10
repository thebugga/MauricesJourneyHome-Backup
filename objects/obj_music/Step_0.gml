if global.panic
{
	if music != sng_escape
	{
		music = sng_escape;
		audio_stop_sound(musicID);
		musicID = scr_music(music);
		if pillarmusicID != -4
			audio_stop_sound(pillarmusicID);
		pillarmusicID = -4;
	}
}
