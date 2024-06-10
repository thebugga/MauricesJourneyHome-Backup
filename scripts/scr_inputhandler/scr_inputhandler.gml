/// @function scr_startinput()
/// @description Initiates the input system at the start of the game.
function scr_startinput()
{
	//Defines the enum for input device types.
	enum inputs
	{
		keyboard,
		controller,
	}
	
	//Sets the global input type, but you probably didn't need a comment for this.
	ini_open("saveData.ini")
	global.inputtype = ini_read_real("Input Settings", "device", inputs.keyboard);
	ini_close();
	
	if (file_exists("Inputs/keyboard_inputs4.json"))
		global.multibindamount = 4;
	else if (file_exists("Inputs/keyboard_inputs3.json"))
		global.multibindamount = 3;
	else if (file_exists("Inputs/keyboard_inputs2.json"))
		global.multibindamount = 2;
	else
		global.multibindamount = 1;
	
	global.multibindamount = 4;
	global.default_keyboard_inputs =
	{
		key_left : vk_left,
		key_right : vk_right,
		key_up : vk_up,
		key_down : vk_down,
		key_jump : ord("Z"),
		key_attack : ord("X"),
		key_run : vk_shift,
		key_taunt : ord("C"),
	};
	
	//Defines the default struct for controller inputs.
	global.default_controller_inputs =
	{
		key_left : gp_padl,
		key_right : gp_padr,
		key_up : gp_padu,
		key_down : gp_padd,
		key_jump : gp_face1,
		key_attack : gp_face2,
		key_run : gp_shoulderl,
		key_taunt : gp_face3,
	};
	for (var i = 1; i < global.multibindamount + 1; i++)
		scr_resetcheck(i);
}
/// @function scr_resetinput()
/// @description Checks if the inputs need to be reset. Only call this in scr_startinput().
function scr_resetcheck(i = 1)
{
	/*If the files don't exist, or don't include new inputs, reset them.
	This will default to creating the files with the
	default inputs because there aren't any inputs to write to.*/
	var jk = "Inputs/keyboard_inputs.json"
	var jc = "Inputs/controller_inputs.json"
	if i != 1
	{
		jk = string_concat("Inputs/keyboard_inputs", i, ".json")
		jc = string_concat("Inputs/controller_inputs", i, ".json")
	}
	var file_exist_keyboard = file_exists(jk)
	var file_exist_controller = file_exists(jc);
	var file_update_keyboard = function(jk)
	{
		//Opens the json file.
	    var keyboard_json = file_text_open_read(jk);
		//Reads the json file.
		var kb_string = file_text_read_string(keyboard_json);
		//Parses the json file. (Converts it into a struct.)
		var struct = json_parse(kb_string);
		file_text_close(keyboard_json);
		return (variable_struct_get_names(struct) != variable_struct_get_names(global.default_keyboard_inputs));
	}
	var file_update_controller = function(jc)
	{
		//Opens the json file.
		var controller_json = file_text_open_read(jc);
		//Reads the json file.
		var c_string = file_text_read_string(controller_json);
		//Parses the json file. (Converts it into a struct.)
		var struct = json_parse(c_string);
		file_text_close(controller_json);
		return (variable_struct_get_names(struct) != variable_struct_get_names(global.default_controller_inputs));
	}
	if (!file_exist_keyboard) || (file_update_keyboard)
		scr_resetinput(i);
	if (!file_exist_controller) || file_update_controller
		scr_resetinput(i, inputs.controller);
}
/// @function scr_resetinput()
/// @description Resets the key mappings.
function scr_resetinput(i = 1, type = inputs.keyboard)
{
	if (type == inputs.keyboard)
		scr_saveinput(json_stringify(global.default_keyboard_inputs), inputs.keyboard, i);
	else
		scr_saveinput(json_stringify(global.default_controller_inputs), inputs.controller, i);
}
/// @function scr_saveinput(_input, _json, _type)
/// @description Saves the new mappings.
/// @param {string} _json The struct of key mappings to save.
/// @param {real} _type The type of input device. (Use input constants.)
/// @param {real} i The multibind to save it to.
function scr_saveinput(_json, _type, i = 1)
{
	var jk = "Inputs/keyboard_inputs.json"
	var jc = "Inputs/controller_inputs.json"
	if i != 1
	{
		jk = string_concat("Inputs/keyboard_inputs", i, ".json")
		jc = string_concat("Inputs/controller_inputs", i, ".json")
	}
	//Checks the input device.
	if (_type = inputs.keyboard)
	{
		//Deletes the json file.
		file_delete(jk)
		//Opens the json file, which creates it.
		var keyboard_json = file_text_open_write(jk)
		//Writes the new struct into the json file.
		file_text_write_string(keyboard_json, _json);
		//Closes the file.
		file_text_close(keyboard_json);
	}
	else if (_type = inputs.controller)
	{
		//Deletes the json file.
		file_delete(jc)
		//Opens the json file, which creates it.
		var controller_json = file_text_open_write(jc)
		//Writes the new struct into the json file.
		file_text_write_string(controller_json, _json);
		//Closes the file.
		file_text_close(controller_json);
	}
}
/// @function loadinput_held(_input, _type)
/// @description Checks to see if an input is being held.
/// @param {string} _input The input to check.
/// @param {real} _type The type of input device. (Use input constants.)
/// @param {real} _gamepad The gamepad to check inputs for. Set to 0 if no value is put.
function loadinput_held(_input, _type, _gamepad = 0)
{
	var val = scr_getkey(_input,_type)
	var val2 = val;
	var val3 = val;
	var val4 = val;
	if (global.multibindamount >= 4)
		val4 = scr_getkey(_input,_type, 4)
	if (global.multibindamount >= 3)
		val3 = scr_getkey(_input,_type, 3)
	if (global.multibindamount >= 2)
		val2 = scr_getkey(_input,_type, 2)
	if (_type = inputs.keyboard)
		return (keyboard_check(val) || keyboard_check(val2) || keyboard_check(val3) || keyboard_check(val4));
	else if (_type = inputs.controller)
		return (gamepad_button_check(_gamepad, val) || gamepad_button_check(_gamepad, val2) || gamepad_button_check(_gamepad, val3) || gamepad_button_check(_gamepad, val4));
}
/// @function loadinput_pressed(_input, _type)
/// @description Checks to see if an input was pressed.
/// @param {string} _input The input to check.
/// @param {real} _type The type of input device. (Use input constants.)
/// @param {real} _gamepad The gamepad to check inputs for. Set to 0 if no value is put.
function loadinput_pressed(_input, _type, _gamepad = 0)
{
	var val = scr_getkey(_input,_type)
	var val2 = val;
	var val3 = val;
	var val4 = val;
	if (global.multibindamount >= 4)
		val4 = scr_getkey(_input,_type, 4)
	if (global.multibindamount >= 3)
		val3 = scr_getkey(_input,_type, 3)
	if (global.multibindamount >= 2)
		val2 = scr_getkey(_input,_type, 2)
	if (_type = inputs.keyboard)
		return (keyboard_check_pressed(val) || keyboard_check_pressed(val2) || keyboard_check_pressed(val3) || keyboard_check_pressed(val4));
	else if (_type = inputs.controller)
		return (gamepad_button_check_pressed(_gamepad, val) || gamepad_button_check_pressed(_gamepad, val2) || gamepad_button_check_pressed(_gamepad, val3) || gamepad_button_check_pressed(_gamepad, val4));
}
/// @function scr_initinput()
/// @description Initiates the key variables. Used inside of create events.
function scr_initinput()
{
	key_left = false;
	key_right = false;
	key_up = false;
	key_down = false;
	key_jump = false;
	key_attack = false;
	key_run = false;
	key_taunt = false;
	key_left2 = false;
	key_right2 = false;
	key_up2 = false;
	key_down2 = false;
	key_jump2 = false;
	key_attack2 = false;
	key_run2 = false;
	key_taunt2 = false;
	// To add keys, key_newkey = false;
}
/// @function scr_getinput()
/// @description Calls the key variables. Used inside of step events.
function scr_getinput(gamepad = 0)
{
	key_left = loadinput_held("key_left", global.inputtype, gamepad);
	key_right = loadinput_held("key_right", global.inputtype, gamepad);
	key_up = loadinput_held("key_up", global.inputtype, gamepad);
	key_down = loadinput_held("key_down", global.inputtype, gamepad);
	key_jump = loadinput_held("key_jump", global.inputtype, gamepad);
	key_attack = loadinput_held("key_attack", global.inputtype, gamepad);
	key_run = loadinput_held("key_run", global.inputtype, gamepad);
	key_taunt = loadinput_held("key_taunt", global.inputtype, gamepad);
	key_left2 = loadinput_pressed("key_left", global.inputtype, gamepad);
	key_right2 = loadinput_pressed("key_right", global.inputtype, gamepad);
	key_up2 = loadinput_pressed("key_up", global.inputtype, gamepad);
	key_down2 = loadinput_pressed("key_down", global.inputtype, gamepad);
	key_jump2 = loadinput_pressed("key_jump", global.inputtype, gamepad);
	key_attack2 = loadinput_pressed("key_attack", global.inputtype, gamepad);
	key_run2 = loadinput_pressed("key_run", global.inputtype, gamepad);
	key_taunt2 = loadinput_pressed("key_taunt", global.inputtype, gamepad);
	// To add keys, key_newkey = loadinput_pressed("key_newkey", global.inputtype);
}
/// @function scr_getkey(input, type)
/// @description Returns the key binded to an input.
/// @param {string} _input The input to check.
/// @param {real} _type The type of input device. (Use input constants.)
function scr_getkey(input, type, i = 1)
{
	var jk = "Inputs/keyboard_inputs.json"
	var jc = "Inputs/controller_inputs.json"
	if i != 1
	{
		jk = string_concat("Inputs/keyboard_inputs", i, ".json")
		jc = string_concat("Inputs/controller_inputs", i, ".json")
	}
	if (type == inputs.keyboard)
	{
		//Opens the json file.
		var keyboard_json = file_text_open_read(jk);
		//Reads the json file.
		var kb_string = file_text_read_string(keyboard_json);
		file_text_close(keyboard_json);
		//Parses the json file. (Converts it into a struct.)
		var struct = json_parse(kb_string);
		var _hash = variable_get_hash(input);
		var _value = struct_get_from_hash(struct, _hash);
		return _value;
	}
	else if (type == inputs.controller)
	{
		//Opens the json file.
        var controller_json = file_text_open_read(jc);
		//Reads the json file.
        var c_string = file_text_read_string(controller_json);
		file_text_close(controller_json);
		//Parses the json file. (Converts it into a struct.)
		var struct = json_parse(c_string);
		var _hash = variable_get_hash(input);
		var _value = struct_get_from_hash(struct, _hash);
		return _value;
	}
}