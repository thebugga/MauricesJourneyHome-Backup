optionselected = 0
inputbuffer = 0
pause_image = spr_null
enum optiontypes {
	slider,
	onoff,
	input

}

options = [
	{o_name: "BACK", val: "", o_type: optiontypes.input, func: function(_val) {
		alarm[0] = 2
	}},
	{o_name: "FULLSCREEN: ", val: global.fullscreen, o_type: optiontypes.onoff, func: function(_val) {
		global.fullscreen = _val
		quick_ini_write_real("globalsave.ini", "options", "fullscreen", _val)
		window_set_fullscreen(_val)
		if (!_val)
			window_center()
	}},
	{o_name: "MASTER VOLUME: ", val: global.master_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.master_volume = _val
		quick_ini_write_real("globalsave.ini", "options", "master_volume", _val)
		audio_master_gain(_val)
	}},
	{o_name: "SFX VOLUME: ", val: global.sfx_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.sfx_volume = _val
		audio_group_set_gain(ag_sfx, _val, 0)
		quick_ini_write_real("globalsave.ini", "options", "sfx_volume", _val)
	}},
	{o_name: "MUSIC VOLUME: ", val: global.music_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.music_volume = _val
		audio_group_set_gain(ag_music, _val, 0)
		quick_ini_write_real("globalsave.ini", "options", "music_volume", _val)
	}},
	{o_name: "CHANGE KEYBINDS", val: "", o_type: optiontypes.input, func: function(_val) {
		instance_create(0, 0, obj_keyconfig)
	}}
]