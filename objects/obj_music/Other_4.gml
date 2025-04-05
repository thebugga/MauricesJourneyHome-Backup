if !global.panic
{
	var mu = ds_map_find_value(music_map, room);
	if !is_undefined(mu)
	{
		var prevmusic = music;
		if (prevmusic == noone || mu.event_name != prevmusic.event_name)
		{
			fmod_studio_event_instance_start(mu.event);
			fmod_studio_event_instance_set_paused(mu.event, false);
			if mu.continuous && prevmusic != -4
			{
				var pos = fmod_studio_event_instance_get_timeline_position(prevmusic.event);
				pos = music_get_pos_wrap(pos, fmod_event_get_length(mu.event_name));
				fmod_studio_event_instance_set_timeline_position(mu.event, pos);
			}
			if prevmusic != noone
			{
				if room == Mainmenu
					fmod_studio_event_instance_stop(prevmusic.event, false);
				else
					fmod_studio_event_instance_stop(prevmusic.event, true);
				if prevmusic.event_secret != noone
					fmod_studio_event_instance_stop(prevmusic.event_secret, true);
			}
			music = mu;
			savedmusicpos = 0;
			/*
			if room == war_1 || room == tower_finalhallway
				fmod_studio_event_instance_stop(music.event, true);
			*/
		}
	}
	if instance_exists(obj_totemsteve)
	{
		fmod_studio_event_instance_start(pillarmusicID);
		fmod_studio_system_set_parameter_by_name("pillarfade", 0, true);
	}
	else
		fmod_studio_event_instance_stop(pillarmusicID, true);
	if music != noone && music.on_room_start != noone
		music.on_room_start(room, music.event, music.event_secret);
}
	if secret
	{
		if music != noone && music.event_secret != noone
		{
			fmod_studio_event_instance_start(music.event_secret);
			fmod_studio_event_instance_set_paused(music.event_secret, false);
			pos = fmod_studio_event_instance_get_timeline_position(music.event);
			savedmusicpos = pos;
			pos = music_get_pos_wrap(pos, fmod_getEventLength(music.event_secret_name));
			fmod_studio_event_instance_set_timeline_position(music.event_secret, pos);
			fmod_studio_event_instance_set_paused(music.event, true);
		}
		if global.panic
		{
			trace("Pausing panic music: room_start");
			savedpanicpos = fmod_studio_event_instance_get_timeline_position(panicmusicID);
			fmod_studio_event_instance_set_paused(panicmusicID, true);
		}
	}
	else if secretend
	{
		secretend = false;
		if music != -4
		{
			fmod_studio_event_instance_stop(music.event_secret, true);
			fmod_studio_event_instance_set_paused(music.event, false);
			fmod_studio_event_instance_set_timeline_position(music.event, savedmusicpos);
		}
		if global.panic
		{
			fmod_studio_event_instance_set_timeline_position(panicmusicID, savedpanicpos);
			fmod_studio_event_instance_set_paused(panicmusicID, false);
			trace("Resuming panic music: room_start");
		}
	}
if room == rank_room 
{
	if music != noone
	{
		fmod_studio_event_instance_stop(music.event, true);
		fmod_studio_event_instance_stop(music.event_secret, true);
	}
}