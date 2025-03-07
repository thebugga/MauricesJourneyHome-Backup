with obj_parent_player
{
	if state == states.actor
		state = states.normal;
}
gamesave_async_save_options();
fmod_studio_event_instance_stop(global.snd_slidermaster, true);
fmod_studio_event_instance_stop(global.snd_slidermusic, true);
fmod_studio_event_instance_stop(global.snd_slidersfx, true);
