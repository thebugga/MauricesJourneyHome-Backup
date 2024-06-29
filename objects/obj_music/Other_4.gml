if !global.panic
{
	var mu = ds_map_find_value(music_map, room);
	if !is_undefined(mu)
	{
		var prevmusic = music;
		if (prevmusic == noone || mu.event_name != prevmusic.event_name)
		{
			fmod_event_instance_play(mu.event);
			fmod_event_instance_set_paused(mu.event, false);
			if mu.continuous && prevmusic != -4
			{
				var pos = fmod_event_instance_get_timeline_pos(prevmusic.event);
				pos = music_get_pos_wrap(pos, fmod_event_get_length(mu.event_name));
				fmod_event_instance_set_timeline_pos(mu.event, pos);
			}
			if prevmusic != noone
			{
					fmod_event_instance_stop(prevmusic.event, true);
				if prevmusic.event_secret != noone
					fmod_event_instance_stop(prevmusic.event_secret, true);
			}
			music = mu;
			savedmusicpos = 0;
		}
	}
	if instance_exists(obj_hungrypillar)
	{
		fmod_event_instance_play(pillarmusicID);
		fmod_set_parameter("pillarfade", 0, true);
	}
	else
		fmod_event_instance_stop(pillarmusicID, true);
	if music != noone && music.on_room_start != noone
		music.on_room_start(room, music.event, music.event_secret);
}
