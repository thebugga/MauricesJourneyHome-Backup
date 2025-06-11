function get_input(_input = 0)
{
	var innerputs = global.controlings[_input]
	if innerputs == -4
	{
		key_left = setkey(vk_nokey)
		key_right = setkey(vk_nokey)
		key_up = setkey(vk_nokey)
		key_down = setkey(vk_nokey)
		key_jump = setkey(vk_nokey)
		key_grab = setkey(vk_nokey)
		key_dash = setkey(vk_nokey)
		key_taunt = setkey(vk_nokey)

		uikey_left = setkey(vk_nokey)
		uikey_right = setkey(vk_nokey)
		uikey_up = setkey(vk_nokey)
		uikey_down = setkey(vk_nokey)
		uikey_accept = setkey(vk_nokey)
		uikey_deny = setkey(vk_nokey)
		exit
	}
	if innerputs == -3
	{
		var anytroller = scr_anybutton_pressed()
		if anytroller > -4
			global.P1s_anytrol = anytroller
		innerputs = global.P1s_anytrol
	}
	
	if innerputs < 0
	{
		key_left = setkey(global.keybinds[-innerputs - 1].left)
		key_right = setkey(global.keybinds[-innerputs - 1].right)	
		key_up = setkey(global.keybinds[-innerputs - 1].up)
		key_down = setkey(global.keybinds[-innerputs - 1].down)	
		key_jump = setkey(global.keybinds[-innerputs - 1].jump)
		key_grab = setkey(global.keybinds[-innerputs - 1].grab)
		key_dash = setkey(global.keybinds[-innerputs - 1].dash)
		key_taunt = setkey(global.keybinds[-innerputs - 1].taunt)

		uikey_left = setkey(global.keybinds[-innerputs - 1].ui_left)
		uikey_right = setkey(global.keybinds[-innerputs - 1].ui_right)
		uikey_up = setkey(global.keybinds[-innerputs - 1].ui_up)
		uikey_down = setkey(global.keybinds[-innerputs - 1].ui_down)
		uikey_accept = setkey(global.keybinds[-innerputs - 1].ui_accept)
		uikey_deny = setkey(global.keybinds[-innerputs - 1].ui_deny)
	}
	else
	{
		key_left = setpad(global.padbinds.left, innerputs)
		key_right = setpad(global.padbinds.right, innerputs)	
		key_up = setpad(global.padbinds.up, innerputs)
		key_down = setpad(global.padbinds.down, innerputs)	
		key_jump = setpad(global.padbinds.jump, innerputs)
		key_grab = setpad(global.padbinds.grab, innerputs)
		key_dash = setpad(global.padbinds.dash, innerputs)
		key_taunt = setpad(global.padbinds.taunt, innerputs)

		uikey_left = setpad(global.padbinds.ui_left, innerputs)
		uikey_right = setpad(global.padbinds.ui_right, innerputs)
		uikey_up = setpad(global.padbinds.ui_up, innerputs)
		uikey_down = setpad(global.padbinds.ui_down, innerputs)
		uikey_accept = setpad(global.padbinds.ui_accept, innerputs)
		uikey_deny = setpad(global.padbinds.ui_deny, innerputs)
	}
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
	else if keybind != vk_nokey
	{
		k = {
			down: keyboard_check(keybind),
			pressed: keyboard_check_pressed(keybind),
			released: keyboard_check_released(keybind)
		}
	}
	return k
}

function setpad(padbind, padnumb)
{
	var k = {
		down: false,
		pressed: false,
		released: false
	}
	
	if is_array(padbind)
	{
		for (var i = 0; i < array_length(padbind); i++) {
			var noneedtocheck = false
			if gamepad_button_check(padnumb, padbind[i])
			{
				k.down = true
				noneedtocheck = true
			}
			if gamepad_button_check_pressed(padnumb, padbind[i])
				k.pressed = true
			if gamepad_button_check_released(padnumb, padbind[i])
				k.released = true
			
			if noneedtocheck
				break;
		}
	}
	else
	{
		k = {
			down: gamepad_button_check(padnumb, padbind),
			pressed: gamepad_button_check_pressed(padnumb, padbind),
			released: gamepad_button_check_released(padnumb, padbind)
		}
	}
	return k
}

function scr_anybutton_pressed()
{
	if keyboard_check_pressed(vk_anykey)
	{
		for (var i = 0; i < array_length(global.keybinds); i++) 
		{
			var binders = [global.keybinds[i].left,
			global.keybinds[i].right,
			global.keybinds[i].up,
			global.keybinds[i].down,
			global.keybinds[i].jump,
			global.keybinds[i].grab,
			global.keybinds[i].dash,
			global.keybinds[i].taunt,
			global.keybinds[i].ui_left,
			global.keybinds[i].ui_right,
			global.keybinds[i].ui_up,
			global.keybinds[i].ui_down,
			global.keybinds[i].ui_accept,
			global.keybinds[i].ui_deny]
			if array_contains(binders, keyboard_lastkey)
				return -(i + 1);
		}
	}
	else
	{
		for (var g = 0; g < 16; g++)
		{
			if gamepad_is_connected(g)
			{
				for (var i = gp_face1; i < gp_axisrv; i++)
				{
					if gamepad_button_check_pressed(g, i)
						return g;
				}
				var _threshold = 0.5
				var _up = gamepad_axis_value(g, gp_axislv) < (-_threshold)
				var _right = gamepad_axis_value(g, gp_axislh) > _threshold
				var _left = gamepad_axis_value(g, gp_axislh) < (-_threshold)
				var _down = gamepad_axis_value(g, gp_axislv) > _threshold
				if (_up || _right || _left || _down)
					return g;
			}
		}
	}
	return -4;
}