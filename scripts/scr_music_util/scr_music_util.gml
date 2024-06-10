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
			event = fmod_event_create_instance(_event);
		}
		if (_eventsecret != -4)
		{
			event_secret_name = _eventsecret;
			event_secret = fmod_event_create_instance(_eventsecret);
		}
	}
	ds_map_set(music_map, _room, b);
	return b;
}
function stop_music()
{
	with (obj_music)
	{
		if (music != -4)
		{
			if (obj_pause.pause)
			{
				fmod_event_instance_stop(music.event, true);
				fmod_event_instance_stop(music.event_secret, true);
			}
			else
			{
				fmod_event_instance_stop(music.event, false);
				fmod_event_instance_stop(music.event_secret, false);
			}
		}
		fmod_event_instance_stop(pillarmusicID, true);
		fmod_event_instance_stop(panicmusicID, true);
	}
}
function music_get_pos_wrap(_pos, _length)
{
	while (_pos > _length)
		_pos -= _length;
	if (_pos < 1)
		_pos = 1;
	return _pos;
}
