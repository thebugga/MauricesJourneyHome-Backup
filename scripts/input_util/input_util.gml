function get_input(_input = 0)
{
	/*
	var keybinds = {
		left: vk_left,
		right: vk_right,
		up: vk_up,
		down: vk_down,
		jump: ord("Z"),
		grab: ord("X"),
		dash: vk_shift,
		taunt: ord("C"),
		ui_left: vk_left,
		ui_right: vk_right,
		ui_up: vk_up,
		ui_down: vk_down,
		ui_accept: [vk_enter, vk_space, ord("Z")],
		ui_deny: [vk_backspace, vk_escape, ord("X")]
	}
	*/
	key_left = setkey(global.keybinds[_input].left)
	key_right = setkey(global.keybinds[_input].right)	
	key_up = setkey(global.keybinds[_input].up)
	key_down = setkey(global.keybinds[_input].down)	
	key_jump = setkey(global.keybinds[_input].jump)
	key_grab = setkey(global.keybinds[_input].grab)
	key_dash = setkey(global.keybinds[_input].dash)
	key_taunt = setkey(global.keybinds[_input].taunt)

	uikey_left = setkey(global.keybinds[_input].ui_left)
	uikey_right = setkey(global.keybinds[_input].ui_right)
	uikey_up = setkey(global.keybinds[_input].ui_up)
	uikey_down = setkey(global.keybinds[_input].ui_down)
	uikey_accept = setkey(global.keybinds[_input].ui_accept)
	uikey_deny = setkey(global.keybinds[_input].ui_deny)
}

function setkey(keybind)
{
	var k = {
		down: false,
		pressed: false,
		released: false
	}
	
	if is_array(keybind)
	{
		for (var i = 0; i < array_length(keybind); i++) {
			var noneedtocheck = false
			if keyboard_check(keybind[i])
			{
				k.down = true
				noneedtocheck = true
			}
			if keyboard_check_pressed(keybind[i])
				k.pressed = true
			if keyboard_check_released(keybind[i])
				k.released = true
			
			if noneedtocheck
				break;
		}
	}
	else
	{
		k = {
			down: keyboard_check(keybind),
			pressed: keyboard_check_pressed(keybind),
			released: keyboard_check_released(keybind)
		}
	}
	return k
}