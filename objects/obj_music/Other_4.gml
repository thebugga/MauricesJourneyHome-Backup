function add_music(_room, _event, _eventsecret, _continuous, _on_room_start = noone)
{
	var b = 
	{
		continuous: _continuous,
		on_room_start: -4,
		value: 0,
		immediate: false,
		event: -4,
		event_secret: -4
	};
	with (b)
	{
		if (_on_room_start != -4)
			on_room_start = method(self, _on_room_start);
		if (_event != -4)
		{
			event_name = _event;
			event_path = fmod_studio_system_get_event(_event);
			event = fmod_studio_event_description_create_instance(event_path);
		}
		if (_eventsecret != -4)
		{
			event_secret_name = _eventsecret;
			event_secret_path = fmod_studio_system_get_event(_eventsecret);
			event_secret = fmod_studio_event_description_create_instance(event_secret_path);
		}
	}
	ds_map_set(music_map, _room, b);
	return b;
}



add_music(hub_entrance, "event:/music/hub", noone, false);
add_music(hub_tutorial1, "event:/music/tutorial", noone, false);
add_music(wizard_1, "event:/music/wizardry", noone, false);

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
				pos = music_get_pos_wrap(pos, fmod_studio_event_description_get_length(mu.event_name));
				fmod_studio_event_instance_set_timeline_position(mu.event, pos);
			}
			if prevmusic != noone
			{
					fmod_studio_event_instance_stop(prevmusic.event, true);
				if prevmusic.event_secret != noone
					fmod_studio_event_instance_stop(prevmusic.event_secret, true);
			}
			music = mu;
			savedmusicpos = 0;
		}
	}

	if music != noone && music.on_room_start != noone
		music.on_room_start(room, music.event, music.event_secret);
}
if room == rank_room
{
	if music != noone
	{
		fmod_studio_event_instance_stop(music.event, true);
		fmod_studio_event_instance_stop(music.event_secret, true);
	}
}
