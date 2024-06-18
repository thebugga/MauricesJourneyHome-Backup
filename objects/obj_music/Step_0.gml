panic_instance = fmod_studio_system_get_event("event:/music/pizzatime");
panic_instance_ref = fmod_studio_event_description_create_instance(panic_instance);
if global.panic
{
	if !panicstart
	{
		trace("Starting panic music: step");
		panicstart = true;
		fmod_studio_event_instance_start(panic_instance_ref);
		
		if music != noone
		{
			fmod_studio_event_instance_stop(music.event, true);
			fmod_studio_event_instance_stop(music.event_secret, true);
		}
	}

}
else if global.panic == false
{
	panicstart = false;
	panic_instance = fmod_studio_system_get_event("event:/music/escape");
    panic_instance_ref = fmod_studio_event_description_create_instance(panic_instance);
	fmod_studio_event_instance_set_paused(panic_instance_ref, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
}