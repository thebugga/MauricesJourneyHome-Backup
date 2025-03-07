gameframe_update();
if global.option_unfocus_mute
{
	if (window_has_focus())
		fmod_studio_system_set_parameter_by_name("focus", 1, false);
	else
		fmod_studio_system_set_parameter_by_name("focus", 0, false);
}
else
	fmod_studio_system_set_parameter_by_name("focus", 1, false);
