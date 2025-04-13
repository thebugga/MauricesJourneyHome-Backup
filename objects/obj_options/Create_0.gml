optionselected = 0

enum optiontypes {
	slider,
	onoff
}

options = [
	{o_name: "FULLSCREEN: ", val: global.fullscreen, o_type: optiontypes.onoff, func: function(_val) {
		global.fullscreen = _val
		quick_ini_write_real("globalsave.ini", "options", "fullscreen", _val)
		window_set_fullscreen(_val);
		var tempwinvar = [960, 540]
		if (!_val) {
            window_set_size(tempwinvar[0], tempwinvar[1]);
			window_center();
        } else
            tempwinvar[0] = window_get_width();
            tempwinvar[1] = window_get_height();
            window_center()
		}},
	{o_name: "MASTER VOLUME: ", val: global.option_master_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.option_master_volume = _val
		quick_ini_write_real("globalsave.ini", "options", "option_master_volume", _val)
		audio_master_gain(_val)
		}},
	{o_name: "SFX VOLUME: ", val: global.option_sfx_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.option_sfx_volume = _val
		quick_ini_write_real("globalsave.ini", "options", "option_sfx_volume", _val)
		}},
	{o_name: "MUSIC VOLUME: ", val: global.option_music_volume * 100, o_type: optiontypes.slider, func: function(_val) {
		_val /= 100
		global.option_music_volume = _val
		quick_ini_write_real("globalsave.ini", "options", "option_music_volume", _val)
		}}
]