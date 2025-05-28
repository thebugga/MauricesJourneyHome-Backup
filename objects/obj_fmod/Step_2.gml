updateFFT();
attributes3D.position = 
{
    x: camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2),
    y: camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2),
    z: 0
};
fmod_studio_system_set_listener_attributes(0, attributes3D);

fmod_studio_system_set_parameter_by_name("masterVolume", global.master_volume, true);
fmod_studio_system_set_parameter_by_name("musicVolume", global.music_volume, true);
fmod_studio_system_set_parameter_by_name("sfxVolume", global.sfx_volume, true);

fmod_studio_system_update();