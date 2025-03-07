while (surface_get_target() != -1 && surface_get_target() != application_surface)
	surface_reset_target();
if !start_sound
{
	fmod_studio_system_set_parameter_by_name("masterVolume", global.option_master_volume, true);
	fmod_studio_system_set_parameter_by_name("musicVolume", global.option_music_volume, true);
	fmod_studio_system_set_parameter_by_name("sfxVolume", global.option_sfx_volume, true);
}
