if !pause || instance_exists(obj_options) || instance_exists(obj_characterselect)
	exit;

get_input()

var movev = -uikey_up.pressed + uikey_down.pressed

selected = clamp(selected + movev, 0, array_length(pausearray) - 1)

if uikey_accept.pressed or keyboard_key_press(ord("L"))
{
	uikey_accept.pressed = false
	if pausearray[selected][1] != -4
		pausearray[selected][1]()
}

if movev != 0
    event_play_oneshot("event:/sfx/ui/step")
