function stop_panic_music()
{
	with (obj_music){
		panic_instance = fmod_studio_system_get_event("event:/music/escape");
        panic_instance_ref = fmod_studio_event_description_create_instance(panic_instance);
		fmod_studio_event_instance_stop(panic_instance_ref, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		fmod_studio_event_instance_set_paused(panic_instance_ref, true)

	}
}
function stop_elevator_music()
{
		panic_instance = fmod_studio_system_get_event("event:/music/levator");
        panic_instance_ref = fmod_studio_event_description_create_instance(panic_instance);
		fmod_studio_event_instance_stop(panic_instance_ref, FMOD_STUDIO_STOP_MODE.IMMEDIATE);
		fmod_studio_event_instance_set_paused(panic_instance_ref, true)
}
function stop_music()
{
	with (obj_music){
	    var mu = ds_map_find_value(music_map, room);
		fmod_studio_event_instance_stop(mu.event, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
		fmod_studio_event_instance_stop(mu.event_secret, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
		panic_instance = fmod_studio_system_get_event("event:/music/escape");
        panic_instance_ref = fmod_studio_event_description_create_instance(panic_instance);
		fmod_studio_event_instance_stop(panic_instance_ref, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);;
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
