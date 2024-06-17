function scr_fmod_soundeffect(sound_instance, _x, _y)
{
	stupid_attributes = {
	position: {x: _x, y: _y, z: 0},
	velocity: {x: _x, y: _y, z: 0},
	forward: {x:_x,y:_y,z:1.0},
	up: {x:_x,y:1.0,z:0},
}
	event_path = fmod_studio_system_get_event(sound_instance);
	event = fmod_studio_event_description_create_instance(event_path);
	fmod_studio_event_instance_set_3d_attributes(sound_instance, stupid_attributes);
	fmod_studio_event_instance_start(event);
}
