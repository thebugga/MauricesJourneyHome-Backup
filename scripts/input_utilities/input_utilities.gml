function input_game_init() {
	enum check {
		pressed,
		held
	};
	global.default_keys = {
		key_leftD: [vk_numpad4, noone],
		key_rightD: [vk_numpad6, noone],
		key_upD: [vk_numpad8, noone],
		key_downD: [vk_numpad2,noone],
		key_jumpD: [vk_space,noone],
		key_runD: [vk_lshift, noone],
		key_attackD: [noone, ord("L")],
		key_shootD: [noone, ord("K")],
		key_tauntD: [noone, ord("M")],
		key_left: [vk_left, ord("A")],
		key_right: [vk_right, ord("D")],
		key_up: [vk_up, ord("W")],
		key_down: [vk_down, ord("S")],
		key_jump: [noone, ord("Z")],
		key_run: [vk_shift, noone],
		key_attack: [noone, ord("X")],
		key_shoot: [noone, ord("A")],
		key_taunt: [noone, ord("C")],
	};
	//remember to delete the keybinds.json file when adding new inputs!
	//if the file doesnt exist, reset the inputs.
	if (!file_exists("keybinds.json")) {
		input_reset();
	}
}
function input_delete(input, json = "keybinds.json") {
	var struct = get_pretty_json_struct(json);
	struct[$ string(input)] = [];
	var serialized = json_stringify(struct, true);
	
	var file = file_text_open_write(json);
	file_text_write_string(file, serialized);
	file_text_close(file);
}
function input_reset(json = "keybinds.json") {
	var serialized = json_stringify(global.default_keys, true);
	var file = file_text_open_write(json);
	file_text_write_string(file, serialized);
	file_text_close(file);
}
function input_save(input, keybind, json = "keybinds.json") {
	var struct = get_pretty_json_struct(json);
	if (!array_contains(struct[$ string(input)], keybind)) {
		array_push(struct[$ string(input)], keybind);
	}
	var serialized = json_stringify(struct, true);
	
	var file = file_text_open_write(json);
	file_text_write_string(file, serialized);
	file_text_close(file);
}
function input_get_binds(input, json = "keybinds.json") {
	var struct = get_pretty_json_struct(json);
	var arr = struct[$ string(input)];
	return arr;
}
function input_check(input, type, json = "keybinds.json") {
	var arr = input_get_binds(input, json);
	switch (type) {
		case check.pressed:
			var press = keyboard_check_pressed(arr[0]);
			for (var i = 0; i < array_length(arr); i++) {
				press |= keyboard_check_pressed(arr[i]);
			}
			return press;
			break;
		case check.held:
			var press = keyboard_check_pressed(arr[0]);
			for (var i = 0; i < array_length(arr); i++) {
				press |= keyboard_check(arr[i]);
			}
			return press;
			break;
	}
}
function get_pretty_json_struct(json = "keybinds.json") {
	var file = file_text_open_read(json)
	var str = ""
	while (!file_text_eof(file)) {
		str += file_text_readln(file)
		str += "\n"
	}
	file_text_close(file)
	return json_parse(str);
}