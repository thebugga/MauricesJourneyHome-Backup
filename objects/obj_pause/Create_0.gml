create_image = false
pause = false
pause_image = spr_null
optionselected = 0

enum optiontypes {
	slider,
	onoff
}

ini_open("globalsave.ini")
global.fullscreen = ini_read_real("options", "fullscreen", false)
global.option_master_volume = ini_read_real("options", "option_master_volume", false)
global.option_sfx_volume = ini_read_real("options", "option_sfx_volume", 1)
global.option_music_volume = ini_read_real("options", "option_music_volume", 1) //these being global are kinda unneccesary...
ini_close()

options = [
	{o_name: "FULLSCREEN: ", val: global.fullscreen, o_type: optiontypes.onoff, func: function(_val) {
		global.fullscreen = _val
		quick_ini_write_real("globalsave.ini", "options", "fullscreen", _val)
		window_set_fullscreen(_val)
		if (!_val)
			window_center()
		}},
	{o_name: "MASTER VOLUME: ", val: global.option_master_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.option_master_volume = _val
		fmod_studio_system_set_parameter_by_name("masterVolume", _val, true);
		quick_ini_write_real("globalsave.ini", "options", "option_master_volume", _val)
		audio_master_gain(_val)
		}},
	{o_name: "SFX VOLUME: ", val: global.option_sfx_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.option_sfx_volume = _val
		fmod_studio_system_set_parameter_by_name("musicVolume", _val, true);
		quick_ini_write_real("globalsave.ini", "options", "option_sfx_volume", _val)
		}},
	{o_name: "MUSIC VOLUME: ", val: global.option_music_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.option_music_volume = _val
		fmod_studio_system_set_parameter_by_name("sfxVolume", _val, true);
		quick_ini_write_real("globalsave.ini", "options", "option_music_volume", _val)
		}}
]

window_set_fullscreen(global.fullscreen)
audio_master_gain(global.option_master_volume)
audio_group_set_gain(ag_sfx, global.option_sfx_volume, 0)
audio_group_set_gain(ag_music, global.option_music_volume, 0)
