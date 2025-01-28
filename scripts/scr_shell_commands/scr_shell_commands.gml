function instance_as_struct(inst)
{
	var struct = {
		// general
		layer : inst.layer,
		depth : inst.depth,
		visible : inst.visible,
		solid : inst.solid,
		xstart : inst.xstart,
		ystart : inst.ystart,
		xprevious : inst.xprevious,
		yprevious : inst.yprevious,
		direction : inst.direction,
		friction : inst.friction,
		gravity : inst.gravity,
		gravity_direction : inst.gravity_direction,
		x : inst.x,
		y : inst.y,
		object_index : inst.object_index,
		id : inst.id,
		solid : inst.solid,
		persistent : inst.persistent,
		
		// sprite
		sprite_index : inst.sprite_index,
		mask_index : inst.mask_index,
		image_alpha : inst.image_alpha,
		image_angle : inst.image_angle,
		image_blend : inst.image_blend,
		image_index : inst.image_index,
		image_number : inst.image_number,
		image_speed : inst.image_speed,
		image_xscale : inst.image_xscale,
		image_yscale : inst.image_yscale,
		bbox_bottom : inst.bbox_bottom,
		bbox_left : inst.bbox_left,
		bbox_right : inst.bbox_right,
		bbox_top : inst.bbox_top,
		sprite_width : inst.sprite_width,
		sprite_height : inst.sprite_height,
		sprite_xoffset : inst.sprite_xoffset,
		sprite_yoffset : inst.sprite_yoffset,
		
		// speed
		speed : inst.speed,
		hspeed : inst.hspeed,
		vspeed : inst.vspeed,
		
		// timelines
		timeline_index : inst.timeline_index,
		timeline_position : inst.timeline_position,
		timeline_speed : inst.timeline_speed,
		timeline_running : inst.timeline_running,
		timeline_loop : inst.timeline_loop,
		
		// sequence
		in_sequence : inst.in_sequence,
		sequence_instance : inst.sequence_instance,
		
		// path
		path_index : inst.path_index,
		path_position : inst.path_position,
		path_positionprevious : inst.path_positionprevious,
		path_speed : inst.path_speed,
		path_scale : inst.path_scale,
		path_orientation : inst.path_orientation,
		path_endaction : inst.path_endaction,
		
		// physics
		phy_active : inst.phy_active,
		phy_angular_velocity : inst.phy_angular_velocity,
		phy_angular_damping : inst.phy_angular_damping,
		phy_linear_velocity_x : inst.phy_linear_velocity_x,
		phy_linear_velocity_y : inst.phy_linear_velocity_y,
		phy_linear_damping : inst.phy_linear_damping,
		phy_speed_x : inst.phy_speed_x,
		phy_speed_y : inst.phy_speed_y,
		phy_position_x : inst.phy_position_x,
		phy_position_y : inst.phy_position_y,
		phy_position_xprevious : inst.phy_position_xprevious,
		phy_position_yprevious : inst.phy_position_yprevious,
		phy_rotation : inst.phy_rotation,
		phy_fixed_rotation : inst.phy_fixed_rotation,
		phy_bullet : inst.phy_bullet,
		
		// read only
		phy_speed : inst.phy_speed,
		phy_com_x : inst.phy_com_x,
		phy_com_y : inst.phy_com_y,
		phy_dynamic : inst.phy_dynamic,
		phy_kinematic : inst.phy_kinematic,
		phy_inertia : inst.phy_inertia,
		phy_mass : inst.phy_mass,
		phy_sleeping : inst.phy_sleeping
	}
	for (var i = 0; i < array_length(inst.alarm); i++)
		struct.alarm[i] = inst.alarm[i];
	var names = variable_instance_get_names(inst);
	for (var i = 0; i < array_length(names); i++)
		variable_struct_set(struct, names[i], variable_instance_get(inst, names[i]))	
}

function tileset_exists(ind)
{
	if tileset_get_name(ind) == undefined
		return false;
	return true;
}

function data_ensure(data, index, value = undefined)
{
	if is_array(data)
	{
		while (index < 0)
		{
			if array_length(data) > 0
				index = array_length(data) + (index + 1);
			else
				index = 0;
		}
		if array_length(data) > index
			return data[index];
		return value;
	}
	if is_struct(data)
	{
		if variable_struct_exists(data, index)
			return variable_struct_get(data, index);
		return value;
	}
	if instance_exists(data)
	{
		if variable_instance_exists(data, index)
			return variable_instance_get(data, index);
		return value;
	}
	if ds_exists(data, ds_type_grid)
	{
		if ds_grid_get(data, index[0], index[1]) != undefined
			return ds_grid_get(data, index[0], index[1]);
		return value;
	}
	if ds_exists(data, ds_type_list)
	{
		if ds_list_size(data) >= index
			return ds_list_find_value(data, index);
		return value;
	}
	if ds_exists(data, ds_type_map)
	{
		if ds_map_exists(data, index)
			return ds_map_find_value(data, index);
		return value;
	}
	if ds_exists(data, ds_type_priority)
	{
		if ds_priority_size(data) >= index
			return ds_priority_find_priority(data, index);
		return value;
	}
	if ds_exists(data, ds_type_queue)
	{
		if ds_queue_size(data) >= index
		{
			var temp_queue = ds_queue_create();
			ds_queue_copy(temp_queue, data);
			while ds_queue_size(data) != index
				ds_queue_dequeue(temp_queue);
			return ds_queue_dequeue(temp_queue);
		}
		return value;
	}
	if ds_exists(data, ds_type_stack)
	{
		if ds_stack_size(data) >= index
		{
			var temp_queue = ds_stack_create();
			ds_stack_copy(temp_queue, data);
			while ds_stack_size(data) != index
				ds_stack_pop(temp_queue);
			return ds_stack_pop(temp_queue);
		}
		return value;
	}
}

function get_real(str)
{
	var n = str;
	if is_string(str)
	{
		if str == "true"
		{
			str = true;
			return str;
		}
		else if str == "false"
		{
			str = false;
			return str;
		}
		else
		{
			n = real(string_digits(str));
			if string_char_at(str, 1) == "-"
				n = -real(string_digits(str));
		}
	}
	return n;
}

function add_command(name, func, desc, argarray, sugarray, argdescarray)
{
	var meta = {
		description: desc,
		arguments: argarray,
		suggestions: sugarray,
		argumentDescriptions: argdescarray
	};
	variable_global_set("sh_" + name, func);
	variable_global_set("meta_" + name, meta);
}


function sh_character(argument0)
{
    var choosen_character;
    
    choosen_character = Characters.Maurice;
    
    switch (argument0[1])
    {
        default:
            show_debug_message(string("SHELL WARNING: [{0}] is not a valid character. Defaulting to Pizzelle.", argument0[1]));
        
        case "Maurice":
            choosen_character = Characters.Maurice;
            break;
        case "Doise":
            choosen_character = Characters.Doise;
            break;
        case "Vigilante":
            choosen_character = Characters.Vigilante;
            break;
        case "Clownmato":
            choosen_character = Characters.Clownmato;
            break;
        case "Snick":
            choosen_character = Characters.Snick;
            break;
    }
    
    scr_player_changeCharacter(obj_parent_player, choosen_character);
}

function meta_character()
{
    return 
    {
        description: "Change the character you're currently playing as.",
        arguments: ["<character>"],
        suggestions: [["Maurice"]],
        argumentDescriptions: ["The character to switch to."]
    };
}

function sh_gateswitchmax(args)
{
	global.gateswitch = global.gateswitchmax;
}

function meta_gateswitchmax()
{
	return 
	{
		description: "",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_show_debug_overlay(boolean)
{
	var val = get_real(data_ensure(boolean, 1, "false"))
	show_debug_overlay(val);
}

function meta_show_debug_overlay()
{
	return 
	{
		description: "Toggles debug overlay",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_roomcheck(args)
{
	instance_create_unique(0, 0, obj_roomcheck);
}

function meta_roomcheck()
{
	return 
	{
		description: "Check rooms. WARNING: Will break your save!",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_unlock_toppins(levelname)
{
	var level_name_ini = data_ensure(levelname, 1, undefined);
	if is_undefined(level_name_ini)
		return "Level name not given";
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real("Toppin", concat(level_name_ini, 1), true);
	ini_write_real("Toppin", concat(level_name_ini, 2), true);
	ini_write_real("Toppin", concat(level_name_ini, 3), true);
	ini_write_real("Toppin", concat(level_name_ini, 4), true);
	ini_write_real("Toppin", concat(level_name_ini, 5), true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}

function meta_unlock_toppins()
{
	return 
	{
		description: "Unlocks the toppins of the given level",
		arguments: ["<level_name>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_unlock_boss_key(worldn)
{
	var number = data_ensure(worldn, 1, undefined);
	if is_undefined(number)
		return "World number not given";
	number = get_real(number);
	ini_open_from_string(obj_savesystem.ini_str);
	var n = concat("w", number, "stick");
	ini_write_real(n, "bosskey", true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}

function meta_unlock_boss_key()
{
	return 
	{
		description: "Unlocks the boss key of the given world (1, 2, 3, 4)",
		arguments: ["<number>"],
		suggestions: [["1", "2", "3", "4", "5"]],
		argumentDescriptions: []
	};
}

function sh_lockcam(boolean)
{
	with (obj_camera)
		lock = data_ensure(boolean, 1, false);
}

function meta_lockcam()
{
	return 
	{
		description: "Lock the camera in place",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: []
	};
}

function sh_bossinv(boolean)
{
	global.boss_invincible = data_ensure(boolean, 1, false);
}

function meta_bossinv()
{
	return 
	{
		description: "Makes you invincible in bossfights",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: []
	};
}

function sh_hidetiles(args)
{
	global.hidetiles = data_ensure(args, 1, true);
	layer_set_visible("Tiles_BG", !global.hidetiles);
	layer_set_visible("Tiles_BG2", !global.hidetiles);
	layer_set_visible("Tiles_BG3", !global.hidetiles);
	layer_set_visible("Tiles_1", !global.hidetiles);
	layer_set_visible("Tiles_2", !global.hidetiles);
	layer_set_visible("Tiles_3", !global.hidetiles);
	layer_set_visible("Tiles_4", !global.hidetiles);
	layer_set_visible("Tiles_Foreground1", !global.hidetiles);
	layer_set_visible("Tiles_Foreground2", !global.hidetiles);
	layer_set_visible("Tiles_Foreground3", !global.hidetiles);
}

function meta_hidetiles()
{
	return 
	{
		description: "",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: []
	};
}

function sh_throwarc(args)
{
	global.throwarc = data_ensure(args, 1, true);
}

function meta_throwarc()
{
	return 
	{
		description: "",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: []
	};
}

function sh_editor(args)
{
	with (obj_parent_player)
	{
		targetRoom = editor_room;
		targetDoor = "A";
	}
	instance_create_unique(0, 0, obj_fadeout);
}

function meta_editor()
{
	return 
	{
		description: "Takes you into the crashing editor.",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_noclip(args)
{
	with (obj_player1)
		state = (state == states.debugstate ? state = states.normal : states.debugstate);
}

function meta_noclip()
{
	return 
	{
		description: "Toggles noclip",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_givekey(boolean)
{
	global.key_inv = data_ensure(boolean, 1, true);
}

function meta_givekey()
{
	return 
	{
		description: "Gives or takes a key",
		arguments: ["<bool>"],
		suggestions: [["true", "false"]],
		argumentDescriptions: []
	};
}

function sh_set_combo(args)
{
	var combo = data_ensure(args, 1, 0);
	var combotime = data_ensure(args, 1, 60);
	if combo == undefined
		return "Combo not defined";
	global.combo = get_real(combo);
	global.combotime = get_real(combotime);
	with (obj_parent_player)
		supercharge = 10;
}

function meta_set_combo()
{
	return 
	{
		description: "Set the combo",
		arguments: ["<combo>", "<combotime:optional>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_giveheat(value)
{
	global.style += data_ensure(value, 1, 100);
}

function meta_giveheat()
{
	return 
	{
		description: "Gives heat",
		arguments: ["<real>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_alltoppins(args)
{
	if !instance_exists(obj_pizzakincheese)
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
	if !instance_exists(obj_pizzakintomato)
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
	if !instance_exists(obj_pizzakinsausage)
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
	if !instance_exists(obj_pizzakinpineapple)
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
	if !instance_exists(obj_pizzakinshroom)
		instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
	global.cheesefollow = true;
	global.tomatofollow = true;
	global.sausagefollow = true;
	global.pineapplefollow = true;
	global.shroomfollow = true;
}

function meta_alltoppins()
{
	return 
	{
		description: "Gives you all the toppins",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_panic(args)
{
	var fill = data_ensure(args, 2, 4000);
	fill = get_real(fill);
	global.panic = data_ensure(args, 1, true);
	global.fill = fill;
	if global.panic
		obj_camera.alarm[1] = 60;
	obj_tv.chunkmax = global.fill;
}

function meta_panic()
{
	return 
	{
		description: "Toggles pizza time",
		arguments: ["<bool>", "<fill>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_showcollisions(args)
{
	var toggle = get_real(data_ensure(args, 1, "true"));
	showcollisions = toggle;
	with (obj_solid)
	{
		if object_index == obj_solid || object_index == obj_secretbigblock || object_index == obj_secretblock || object_index == obj_secretmetalblock
			visible = other.showcollisions;
	}
	with (obj_slope)
	{
		if object_index == obj_slope
			visible = other.showcollisions;
	}
	with (obj_platform)
	{
		if object_index == obj_platform
			visible = other.showcollisions;
	}
}

function meta_showcollisions()
{
	return 
	{
		description: "Shows the collisions",
		arguments: ["<bool>"],
		suggestions: [["0", "1"]],
		argumentDescriptions: []
	};
}

function sh_showhud(boolean)
{
	var toggle = get_real(data_ensure(boolean, 1, "true"));
	if toggle != undefined
	{
		showhud = toggle;
		with (obj_tv)
		{
			visible = toggle;
			show_debug_message(visible);
		}
		with (obj_camera)
		{
			visible = toggle
			show_debug_message(visible);
		}
		with (obj_roomname)
		{
			visible = toggle;
			show_debug_message(visible);
		}
		with (obj_pigtotal)
		{
			visible = toggle;
			show_debug_message(visible);
		}
	}
}

function meta_showhud()
{
	return 
	{
		description: "Shows the HUD",
		arguments: ["<bool:true>"],
		suggestions: [["0", "1"]],
		argumentDescriptions: []
	};
}

function sh_player_room(args)
{
	var _room = data_ensure(args, 1, undefined);
	var _door = data_ensure(args, 2, undefined);
	if _room == undefined
		return "No room defined";
	if _door == undefined
		_door = "A";
	_room = asset_get_index(_room);
	if _room == -1
		return "Room does not exist";
	with (obj_parent_player)
	{
		targetRoom = _room;
		targetDoor = _door;
	}
	instance_create(x, y, obj_fadeout);
	return "Attempting to go to room " + room_get_name(_room) + " at door " + _door;
}

function meta_player_room()
{
	var i = 0;
	var pizza = [];
	while room_exists(i)
	{
		array_push(pizza, room_get_name(i));
		i++;
	}
	return 
	{
		description: "Go to given room",
		arguments: ["<targetRoom>", "<targetDoor:A>"],
		suggestions: pizza,
		argumentDescriptions: []
	};
}

function sh_camera_zoom(args)
{
	var zoom = get_real(data_ensure(args, 1, undefined));
	var spd = get_real(data_ensure(args, 1, undefined));
	if zoom == undefined
		return "Zoom not defined";
	with (obj_camera)
	{
		targetzoom = zoom;
		targetzoom = clamp(targetzoom, 0, max_zoom);
		if spd != undefined
			zoomspd = abs(spd);
	}
}

function meta_camera_zoom()
{
	return 
	{
		description: "Zoom",
		arguments: ["<targetzoom>", "<spd:optional>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_destroyice(args)
{
	instance_destroy(obj_iceblock);
	instance_destroy(obj_iceblockslope);
}

function meta_destroyice()
{
	return 
	{
		description: "",
		arguments: [],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_hardmode(args)
{
	var toggle = get_real(data_ensure(args, 1, "false"));
	global.hardmode = toggle;
	with (obj_hardmode)
		event_perform(ev_other, ev_room_start);
}

function meta_hardmode()
{
	return 
	{
		description: "Toggles hardmode",
		arguments: ["<bool:false>"],
		suggestions: ["false", "true"],
		argumentDescriptions: []
	};
}

function sh_player_set_state(state)
{
	var state_map = ds_map_create();
	ds_map_set(state_map, "states.normal", states.normal);
	ds_map_set(state_map, "states.cheesepep", states.cheesepep);
	ds_map_set(state_map, "states.knightpep", states.knightpep);
	ds_map_set(state_map, "states.firemouth", states.firemouth);
	ds_map_set(state_map, "states.ratmount", states.ratmount);
	var _state = data_ensure(state, 1, undefined);
	if _state == undefined
		return "No state input.";
	_state = ds_map_find_value(state_map, _state);
	if !is_undefined(_state)
	{
		with (obj_parent_player)
		{
			if object_index == obj_player1 || global.coop
			{
				state = _state;
				var __spr = sprite_index;
				switch _state
				{
					case states.normal:
						__spr = spr_idle;
						break;
					case states.cheesepep:
						__spr = spr_cheesepepidle;
						break;
					case states.knightpep:
						__spr = spr_knightpepidle;
						break;
					case states.firemouth:
						__spr = spr_firemouth;
						break;
					case states.ratmount:
						__spr = spr_player_ratmountidle;
						isgustavo = true;
						brick = true;
						break;
				}

				sprite_index = __spr;
				image_index = 0;
			}
		}
	}
}

function meta_player_set_state()
{
	return 
	{
		description: "Changes the player state",
		arguments: ["<state>"],
		suggestions: [],
		argumentDescriptions: []
	};
}

function sh_savedata(name, key, value, valuetype)
{
	switch valuetype
	{
		case "real":
		case "float":
		case "double":
		case "bool":
			value = get_real(value);
			
		case "int":
		case "int32":
		case "int64":
			value = int64(get_real(value));
	}
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real(name, key, value);
	ini_write_real(name, key, value);
	ini_write_real(name, key, value);
	ini_write_real(name, key, value);
	ini_write_real(name, key, value);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}

function meta_savedata()
{
	return 
	{
		description: "Saves a value in the game save data.",
		arguments: [
			"<name>",
			"<key>",
			"<value>",
			"<value_type:string>"
		],
		suggestions: [
			"",
			"",
			"",
			["real", "bool", "int", "string"]
		],
		argumentDescriptions: [
			"Name to save value in",
			"Key to save in (Game, Player, achievements)",
			"Value to save",
			"Value's type"
		]
	};
}

