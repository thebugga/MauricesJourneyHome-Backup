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
	with b
	{
		if _on_room_start != noone
			on_room_start = method(self, _on_room_start);
		if _event != noone
		{
			event_name = _event;
			event = fmod_createEventInstance(_event);
		}
		if _eventsecret != noone
		{
			event_secret_name = _eventsecret;
			event_secret = fmod_createEventInstance(_eventsecret);
		}
	}
	ds_map_set(music_map, _room, b);
	return b;
}
function stop_music()
{
	with obj_music
	{
		if music != noone
		{
			fmod_studio_event_instance_stop(music.event, false);
			fmod_studio_event_instance_stop(music.event_secret, false);
		}
		fmod_studio_event_instance_stop(pillarmusicID, true);
		fmod_studio_event_instance_stop(panicmusicID, true);
	}
}
function hub_state(_room, _sound, _secretsound)
{
	var s = 0;
	fmod_studio_event_instance_set_parameter_by_name_multiplatform(_sound, "hub", s, false);
}
function music_get_pos_wrap(_pos, _length)
{
	while _pos > _length
		_pos -= _length;
	if _pos < 1
		_pos = 1;
	return _pos;
}