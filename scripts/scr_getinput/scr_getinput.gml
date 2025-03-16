function scr_init_input()
{
	key_up = false;
	key_up2 = false;
	key_up3 = false;
	key_right = false;
	key_right2 = false;
	key_right3 = false;
	key_left = false;
	key_left2 = false;
	key_left3 = false;
	key_down = false;
	key_down2 = false;
	key_down3 = false;
	key_jump = false;
	key_jump2 = false;
	key_jump3 = false;
	key_slap = false;
	key_slap2 = false;
	key_slap3 = false;
	key_taunt = false;
	key_taunt2 = false;
	key_taunt3 = false;
	key_attack = false;
	key_attack2 = false;
	key_attack3 = false;
	key_shoot = false;
	key_shoot2 = false;
	key_shoot3 = false;
	key_start = false;
	key_start2 = false;
	key_start3 = false;
	key_escape = false;
	key_escape2 = false;
	key_escape3 = false;
	key_chainsaw = false;
	key_chainsaw2 = false;
	key_chainsaw3 = false;
	stickpressed = false;
	stickpressed_horizontal = false;
	stickpressed_vertical = false;
}

function scr_check_superjump()
{
	var sj = global.gamepad_superjump;
	if obj_inputAssigner.player_input_device[obj_inputAssigner.player_index] < 0
		sj = global.keyboard_superjump;
	return (sj && key_up) or key_superjump;
}

function scr_check_groundpound()
{
	var gp = global.gamepad_groundpound;
	if obj_inputAssigner.player_input_device[obj_inputAssigner.player_index] < 0
		gp = global.keyboard_groundpound;
	return (gp && key_down2) or key_groundpound;
}

function scr_mach_check_dive()
{
	if grounded && vsp > 0
		return key_down;
	return scr_check_dive();
}

function scr_check_dive()
{
	if global.playerCharacter == Characters.Doise
		return scr_check_groundpound2();
	return key_down;
}

function scr_check_groundpound2()
{
	var gp = global.gamepad_groundpound;
	if obj_inputAssigner.player_input_device[obj_inputAssigner.player_index] < 0
		gp = global.keyboard_groundpound;
	return (gp && key_down) or key_groundpound2;
}

function scr_switch_get_menu_input()
{
	var _dvc = obj_inputAssigner.player_input_device[0];
	key_jump = gamepad_button_check_pressed(_dvc, gp_face2);
	key_jump2 = gamepad_button_check(_dvc, gp_face2);
	key_jump3 = gamepad_button_check_released(_dvc, gp_face2);
	key_back = gamepad_button_check_pressed(_dvc, gp_face1);
	key_back2 = gamepad_button_check(_dvc, gp_face1);
	key_back3 = gamepad_button_check_released(_dvc, gp_face1);
}

function scr_menu_getinput()
{
	if instance_exists(obj_shell) && obj_shell.isOpen
		exit;
		
	if !instance_exists(obj_parent_player)
		tdp_input_update(obj_inputAssigner.player_input_device[obj_inputAssigner.player_index]);
	
	key_up = tdp_input_get("menu_up").held or tdp_input_get("menu_upC").held;
	key_up2 = tdp_input_get("menu_up").pressed or tdp_input_get("menu_upC").pressed;
	key_up3 = tdp_input_get("menu_up").released or tdp_input_get("menu_upC").released;
	key_down = tdp_input_get("menu_down").held or tdp_input_get("menu_downC").held;
	key_down2 = tdp_input_get("menu_down").pressed or tdp_input_get("menu_downC").pressed;
	key_down3 = tdp_input_get("menu_down").released or tdp_input_get("menu_downC").released;
	key_left = -(tdp_input_get("menu_left").held or tdp_input_get("menu_leftC").held);
	key_left2 = -(tdp_input_get("menu_left").released or tdp_input_get("menu_leftC").pressed);
	key_left3 = -(tdp_input_get("menu_left").released or tdp_input_get("menu_leftC").released);
	key_right = tdp_input_get("menu_right").held or tdp_input_get("menu_rightC").held;
	key_right2 = tdp_input_get("menu_right").pressed or tdp_input_get("menu_rightC").pressed;
	key_right3 = tdp_input_get("menu_right").released or tdp_input_get("menu_rightC").released;
	key_start = tdp_input_get("menu_start").held or tdp_input_get("menu_startC").held;
	key_start2 = tdp_input_get("menu_start").pressed or tdp_input_get("menu_startC").pressed;
	key_start3 = tdp_input_get("menu_start").released or tdp_input_get("menu_startC").released;
	key_back = tdp_input_get("menu_back").held or tdp_input_get("menu_backC").held;
	key_back2 = tdp_input_get("menu_back").pressed or tdp_input_get("menu_backC").pressed;
	key_back3 = tdp_input_get("menu_back").released or tdp_input_get("menu_backC").released;
	key_jump = tdp_input_get("menu_select").pressed or tdp_input_get("menu_selectC").pressed;
	key_jump2 = tdp_input_get("menu_select").held or tdp_input_get("menu_selectC").held;
	key_jump3 = tdp_input_get("menu_select").released or tdp_input_get("menu_selectC").released;
	key_delete = tdp_input_get("menu_delete").held or tdp_input_get("menu_deleteC").held;
	key_delete2 = tdp_input_get("menu_delete").pressed or tdp_input_get("menu_deleteC").pressed;
	key_delete3 = tdp_input_get("menu_delete").released or tdp_input_get("menu_deleteC").released;
	key_quit = tdp_input_get("menu_quit").held or tdp_input_get("menu_quitC").held;
	key_quit2 = tdp_input_get("menu_quit").pressed or tdp_input_get("menu_quitC").pressed;
	key_quit3 = tdp_input_get("menu_quit").released or tdp_input_get("menu_quitC").released;
	
	if global.swapmode && obj_inputAssigner.player_input_device[0] != obj_inputAssigner.player_input_device[1]
	{
		var _dvc = obj_inputAssigner.player_input_device[!obj_inputAssigner.player_index];
		tdp_input_update(_dvc);
		
		var inputs = [
			// input, menu_input, is_press
			["key_up", "menu_up", 0],
			["key_up2", "menu_up", 1],
			["key_down", "menu_down", 0],
			["key_down2", "menu_down", 1],
			["key_right", "menu_right", 0],
			["key_right2", "menu_right", 1],
			["key_start", "menu_start", 1],
			["key_back", "menu_back", 1],
			["key_jump", "menu_select", 1],
			["key_jump2", "menu_select", 0],
			["key_delete", "menu_delete", 0],
			["key_delete2", "menu_delete", 1],
			["key_quit", "menu_delete", 0],
			["key_quit2", "menu_delete", 1]
		];
		
		for (var i = 0; i < array_length(inputs); i++)
		{
			var input = inputs[i];
			if !variable_instance_get(id, input[0])
			{
				var _bool = false;
				if input[2] == 2
					_bool = (_dvc < 0) ? tdp_input_get(input[1]).released : tdp_input_get(input[1] + "C").released;
				if input[2] == 1
					_bool = (_dvc < 0) ? tdp_input_get(input[1]).pressed : tdp_input_get(input[1] + "C").pressed;
				else if input[2] == 0
					_bool = (_dvc < 0) ? tdp_input_get(input[1]).held : tdp_input_get(input[1] + "C").held;
				variable_instance_set(id, input[0], _bool);
			}
		}
		
		if key_left >= 0
			key_left = _dvc < 0 ? -tdp_input_get("menu_left").held : -tdp_input_get("menu_leftC").held;
		if key_left2 >= 0
			key_left2 = _dvc < 0 ? -tdp_input_get("menu_left").pressed : -tdp_input_get("menu_leftC").pressed;
		if key_left3 >= 0
			key_left3 = _dvc < 0 ? -tdp_input_get("menu_left").released : -tdp_input_get("menu_leftC").released;
	}
}

function scr_getinput()
{
	var _dvc = obj_inputAssigner.player_input_device[0];
	var _dvc2 = obj_inputAssigner.player_input_device[1];
	
	key_attack_p2 = false;
	key_attack2_p2 = false;
	key_attack3_p2 = false;
	key_jump_p2 = false;
	key_jump2_p2 = false;
	key_jump3_p2 = false;
	key_taunt_p2 = false;
	key_taunt2_p2 = false;
	key_taunt3_p2 = false;
	key_slap_p2 = false;
	key_slap2_p2 = false;
	key_slap3_p2 = false;
	key_up_p2 = false;
	key_up2_p2 = false;
	key_up3_p2 = false;
	key_start_p2 = false;
	key_start2_p2 = false;
	key_start3_p2 = false;
	
	if global.swapmode && _dvc != _dvc2
	{
		tdp_input_update(_dvc2);
		key_attack_p2 = (_dvc2 >= 0) ? tdp_input_get("player_attackC").held : tdp_input_get("player_attack").held;
		key_attack2_p2 = (_dvc2 >= 0) ? tdp_input_get("player_attackC").pressed : tdp_input_get("player_attack").pressed;
		key_attack3_p2 = (_dvc2 >= 0) ? tdp_input_get("player_attackC").released : tdp_input_get("player_attack").released;
		key_jump_p2 = (_dvc2 >= 0) ? tdp_input_get("player_jumpC").pressed : tdp_input_get("player_jump").pressed;
		key_jump2_p2 = (_dvc2 >= 0) ? tdp_input_get("player_jumpC").held : tdp_input_get("player_jump").held;
		key_jump3_p2 = (_dvc2 >= 0) ? tdp_input_get("player_jumpC").released : tdp_input_get("player_jump").released;
		key_taunt_p2 = (_dvc2 >= 0) ? tdp_input_get("player_tauntC").pressed : tdp_input_get("player_taunt").pressed;
		key_taunt2_p2 = (_dvc2 >= 0) ? tdp_input_get("player_tauntC").held : tdp_input_get("player_taunt").held;
		key_taunt3_p2 = (_dvc2 >= 0) ? tdp_input_get("player_tauntC").released : tdp_input_get("player_taunt").released;
		key_slap_p2 = (_dvc2 >= 0) ? tdp_input_get("player_slapC").held : tdp_input_get("player_slap").held;
		key_slap2_p2 = (_dvc2 >= 0) ? tdp_input_get("player_slapC").pressed : tdp_input_get("player_slap").pressed;
		key_slap3_p2 = (_dvc2 >= 0) ? tdp_input_get("player_slapC").released : tdp_input_get("player_slap").released;
		key_up_p2 = (_dvc2 >= 0) ? tdp_input_get("player_upC").held : tdp_input_get("player_up").held;
		key_up2_p2 = (_dvc2 >= 0) ? tdp_input_get("player_upC").pressed : tdp_input_get("player_up").pressed;
		key_up3_p2 = (_dvc2 >= 0) ? tdp_input_get("player_upC").released : tdp_input_get("player_up").released;
		key_start_p2 = (_dvc2 >= 0) ? tdp_input_get("menu_startC").held : tdp_input_get("menu_start").held;
		key_start2_p2 = (_dvc2 >= 0) ? tdp_input_get("menu_startC").pressed : tdp_input_get("menu_start").pressed;
		key_start3_p2 = (_dvc2 >= 0) ? tdp_input_get("menu_startC").released : tdp_input_get("menu_start").released;
	}
	tdp_input_update(_dvc);
	
	if instance_exists(obj_shell) && obj_shell.isOpen
		exit;
	
	var verticaldeadzone = global.input_controller_deadzone_vertical;
	var horizontaldeadzone = global.input_controller_deadzone_horizontal;
	var vertpress_dz = global.input_controller_deadzone_press;
	var horizpress_dz = global.input_controller_deadzone_press;
	
	key_start = tdp_input_get("menu_start").pressed or tdp_input_get("menu_startC").pressed;
	if key_start_p2
		key_start = true;
	
	if !global.swapmode or _dvc == -1
	{
		key_up = tdp_input_get("player_up").held or tdp_input_get("player_upC").held;
		key_up2 = tdp_input_get("player_up").pressed or tdp_input_get("player_upC").pressed;
		key_up3 = tdp_input_get("player_up").released or tdp_input_get("player_upC").released;
		key_right = tdp_input_get("player_right").held or tdp_input_get("player_rightC").held;
		key_right2 = tdp_input_get("player_right").pressed or tdp_input_get("player_rightC").pressed;
		key_right3 = tdp_input_get("player_right").released or tdp_input_get("player_rightC").released;
		key_left = -(tdp_input_get("player_left").held or tdp_input_get("player_leftC").held);
		key_left2 = -(tdp_input_get("player_left").pressed or tdp_input_get("player_leftC").pressed);
		key_left3 = -(tdp_input_get("player_left").released or tdp_input_get("player_leftC").released);
		key_down = tdp_input_get("player_down").held or tdp_input_get("player_downC").held;
		key_down2 = tdp_input_get("player_down").pressed or tdp_input_get("player_downC").pressed;
		key_down3 = tdp_input_get("player_down").released or tdp_input_get("player_downC").released;
		key_jump = tdp_input_get("player_jump").pressed or tdp_input_get("player_jumpC").pressed;
		key_jump2 = tdp_input_get("player_jump").held or tdp_input_get("player_jumpC").held;
		key_jump3 = tdp_input_get("player_jump").released or tdp_input_get("player_jumpC").released;
		key_slap = tdp_input_get("player_slap").held or tdp_input_get("player_slapC").held;
		key_slap2 = tdp_input_get("player_slap").pressed or tdp_input_get("player_slapC").pressed;
		key_slap3 = tdp_input_get("player_slap").released or tdp_input_get("player_slapC").released;
		key_taunt = tdp_input_get("player_taunt").held or tdp_input_get("player_tauntC").held;
		key_taunt2 = tdp_input_get("player_taunt").pressed or tdp_input_get("player_tauntC").pressed;
		key_taunt3 = tdp_input_get("player_taunt").released or tdp_input_get("player_tauntC").released;
		key_attack = tdp_input_get("player_attack").held or tdp_input_get("player_attackC").held;
		key_attack2 = tdp_input_get("player_attack").pressed or tdp_input_get("player_attackC").pressed;
		key_attack3 = tdp_input_get("player_attack").released or tdp_input_get("player_attackC").released;
		key_superjump = tdp_input_get("player_superjumpC").held or tdp_input_get("player_superjump").held;
		key_superjump2 = tdp_input_get("player_superjumpC").pressed or tdp_input_get("player_superjump").pressed;
		key_superjump3 = tdp_input_get("player_superjumpC").released or tdp_input_get("player_superjump").released;
		key_groundpound = tdp_input_get("player_groundpoundC").held or tdp_input_get("player_groundpound").held;
		key_groundpound2 = tdp_input_get("player_groundpoundC").pressed or tdp_input_get("player_groundpound").pressed;
		key_groundpound3 = tdp_input_get("player_groundpoundC").released or tdp_input_get("player_groundpound").released;
		key_shoot = tdp_input_get("player_shoot").held or tdp_input_get("player_shoot").held;
		key_shoot2 = tdp_input_get("player_shoot").pressed or tdp_input_get("player_shoot").pressed;
		key_shoot3 = tdp_input_get("player_shoot").released or tdp_input_get("player_shoot").released;
		key_chainsaw = tdp_input_get("player_chainsaw").held or tdp_input_get("player_chainsaw").held;
		key_chainsaw2 = tdp_input_get("player_chainsaw").pressed or tdp_input_get("player_chainsaw").pressed;
		key_chainsaw3 = tdp_input_get("player_chainsaw").released or tdp_input_get("player_chainsaw").released;
	}
	else if _dvc >= 0
	{
		key_up = tdp_input_get("player_upC").held;
		key_up2 = tdp_input_get("player_upC").pressed;
		key_up3 = tdp_input_get("player_upC").released;
		key_right = tdp_input_get("player_rightC").held;
		key_right2 = tdp_input_get("player_rightC").pressed;
		key_right3 = tdp_input_get("player_rightC").released;
		key_left = -tdp_input_get("player_leftC").held;
		key_left2 = -tdp_input_get("player_leftC").pressed;
		key_left3 = -tdp_input_get("player_leftC").released;
		key_down = tdp_input_get("player_downC").held;
		key_down2 = tdp_input_get("player_downC").pressed;
		key_down3 = tdp_input_get("player_downC").released;
		key_jump = tdp_input_get("player_jumpC").pressed;
		key_jump2 = tdp_input_get("player_jumpC").held;
		key_jump3 = tdp_input_get("player_jumpC").released;
		key_slap = tdp_input_get("player_slapC").held;
		key_slap2 = tdp_input_get("player_slapC").pressed;
		key_slap3 = tdp_input_get("player_slapC").released;
		key_taunt = tdp_input_get("player_tauntC").held;
		key_taunt2 = tdp_input_get("player_tauntC").pressed;
		key_taunt3 = tdp_input_get("player_tauntC").released;
		key_attack = tdp_input_get("player_attackC").held;
		key_attack2 = tdp_input_get("player_attackC").pressed;
		key_attack3 = tdp_input_get("player_attackC").released;
		key_superjump = tdp_input_get("player_superjumpC").held;
		key_superjump2 = tdp_input_get("player_superjumpC").pressed;
		key_superjump3 = tdp_input_get("player_superjumpC").released;
		key_groundpound = tdp_input_get("player_groundpoundC").held;
		key_groundpound2 = tdp_input_get("player_groundpoundC").pressed;
		key_groundpound3 = tdp_input_get("player_groundpoundC").released;
		key_shoot = tdp_input_get("player_shoot").held;
		key_shoot2 = tdp_input_get("player_shoot").pressed;
		key_shoot3 = tdp_input_get("player_shoot").released;
		key_chainsaw = tdp_input_get("player_chainsaw").held;
		key_chainsaw2 = tdp_input_get("player_chainsaw").pressed;
		key_chainsaw3 = tdp_input_get("player_chainsaw").released;
	}
	key_left_axis = scr_get_move_axis("player_leftC");
	key_right_axis = scr_get_move_axis("player_rightC");
	key_up_axis = scr_get_move_axis("player_upC");
	key_down_axis = scr_get_move_axis("player_downC");
	
	// single presses with the analog stick
	if gamepad_axis_value(_dvc, gp_axislh) >= horizpress_dz or gamepad_axis_value(_dvc, gp_axislh) <= -horizpress_dz
		stickpressed_horizontal = true;
	else
		stickpressed_horizontal = false;
	
	if gamepad_axis_value(_dvc, gp_axislv) >= vertpress_dz or gamepad_axis_value(_dvc, gp_axislv) <= -vertpress_dz
		stickpressed_vertical = true;
	else
		stickpressed_vertical = false;
	
	// gamepad analog stick bullshit
	if object_index == obj_player1
	{
		if state == states.Sjumpprep or state == states.crouch or state == states.ratmountcrouch or state == states.machcancel
		{
			if state == states.Sjumpprep
			{
				var in = tdp_input_get("player_upC");
				var dz = global.gamepad_deadzone_superjump;
			}
			else
			{
				in = tdp_input_get("player_downC");
				dz = global.gamepad_deadzone_crouch;
			}
			
			for (var i = 0; i < array_length(in.actions); i++)
			{
				var b = in.actions[i];
				with b
				{
					if type == tdp_input.joystick
					{
						switch value
						{
							case gp_axislv:
								var inverted_axis = gamepad_axis_value(_dvc, gp_axislh);
								break;
							case gp_axisrv:
								inverted_axis = gamepad_axis_value(_dvc, gp_axisrh);
								break;
							case gp_axislh:
								inverted_axis = gamepad_axis_value(_dvc, gp_axislv);
								break;
							case gp_axisrh:
								inverted_axis = gamepad_axis_value(_dvc, gp_axisrv);
								break;
						}
						if other.state == states.Sjumpprep
						{
							if axis_value <= (-0.8 + dz) && (axis_value != 0 or inverted_axis != 0)
								other.key_up = true;
						}
						else if axis_value >= (0.8 - dz) && (axis_value != 0 or inverted_axis != 0)
							other.key_down = true;
					}
				}
			}
		}
	}
}

function scr_get_move_axis(input_str)
{
	var in = tdp_input_get(input_str);
	for (var i = 0; i < array_length(in.actions); i++)
	{
		var b = in.actions[i];
		with b
		{
			if type == tdp_input.joystick
			{
				var av = axis_value;
				if joystick_direction == -1 && av > 0
					av = 0;
				else if joystick_direction == 1 && av < 0
					av = 0;
				if av != 0
					return av;
			}
		}
	}
	return 0;
}