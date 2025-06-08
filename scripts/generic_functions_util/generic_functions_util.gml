function wrap(m, n) {
  return n >= 0 ? n % m : (n % m + m) % m;
}

function approach(value, target, increment = 0.5)
{
	var t = target - value;
	return value + clamp(t, -increment, increment);
}


function wave(from, to, duration, offset, timer = current_time)
{
	var _wave = (to - from) * 0.5;

	return from + _wave + sin((((timer * 0.001) + duration * offset) / duration) * (pi * 2)) * _wave;
}

function scr_get_timer_string(minutes, seconds, include_hours = false)
{
	if seconds < 10
	{
		seconds = string_format(seconds, 1, 3);
		seconds = "0" + seconds;
	}
	else
		seconds = string_format(seconds, 2, 3);
	
	if include_hours
	{
		for (var h = 0; minutes > 59; h++)
			minutes -= 60;
		if h < 10
			h = concat("0", h);
		else
			h = string(h);
	}
	
	if minutes < 10
		minutes = concat("0", minutes);
	else
		minutes = concat(minutes);
	
	if include_hours
		return concat(h, ":", minutes, ":", seconds);
	return concat(minutes, ":", seconds);
}


function get_milliseconds()
{
	return get_timer() / 1000;
}

function draw_set_align(halign, valign, color = noone) 
{
	draw_set_halign(halign) 
	draw_set_valign(valign)
	if color != noone
		draw_set_color(color)
}

function quick_shader_set_uniform_f(shader, uniform_name, val)
{
	var f = shader_get_uniform(shader, uniform_name)
	shader_set_uniform_f(f, val)
}

function shake_camera(_mag = 5, _mag_decel = 0.25)
{
	obj_camera.mag = _mag
	obj_camera.mag_decel = _mag_decel
}

function reset_anim(spr)
{
	sprite_index = spr
	image_index = 0;
}

function reset_anim_on_end(spr)
{
	if anim_ended()
		return reset_anim(spr);
}

enum fade_types
{
	none,
	hallway,
	v_hallway,
	door,
	generic,
	box
}

function do_fade(t_room, t_door, type)
{
	with obj_fade
	{
		if !fade
		{
			fade = true
			target_room = t_room
			pos = {
				x: obj_player.x,
				y: obj_player.y
			}
			obj_player.spawn = t_door
			obj_player.door_type = type
		}
	}
}

function calculate_rank(scorer = global.score)
{
	var rank_ix = 0
	var ranks = [
		global.rank_milestones.c,
		global.rank_milestones.b,
		global.rank_milestones.a,
		global.rank_milestones.s
	]
			
	if (scorer >= global.rank_milestones.s && check_p_rank())
		rank_ix = 5
	else
	{
		for (var i = 4; i >= 1; i--) 
		{
			if scorer >= ranks[i - 1]
			{
				rank_ix = i
				break;
			}
		}
	}
	return rank_ix
}

function do_secret_fade()
{
	with obj_fade
	{
		if !fade
		{
			fade = true
			target_room = other.t_room
		}
	}
	obj_player.secret_exit = true
}

function do_hold_player(_exit)
{
	
	with obj_player
	{
		x = other.x
		y = other.y - 20
		xstart = x
		ystart = y
		hsp = 0
		vsp = 0
		state = states.actor
		secret_exit = _exit
		if _exit
			secret_cutscene = true
		sprite_index = _exit ? spr_player_hurt : spr_player_bodyslamfall
		image_speed = 0.35
	}
}

function do_the_rank()
{
		state = states.actor
		reset_anim(obj_player.spr_enterdoor)
		hsp = 0
		movespeed = 0
		
		var s = round(global.score + obj_generichandler.combo_score)
		
		with instance_create(0, 0, obj_rank)
		{
			rank_scorefinal = s
			results[3][1] = global.combo.record
			results[1][1] = scr_get_timer_string(global.level_minutes, global.level_seconds, true)
		}
		
		var rank_ix = calculate_rank()
		
		ini_open($"saves/saveData{global.savefile}.ini")
		
		var lvl_name = global.level_data.level_name
		var lvl_toppins = global.level_data.goochlings
		
		if s > ini_read_real(lvl_name, "score", 0)
			ini_write_real(lvl_name, "score", s)
		
		if !ini_read_real(lvl_name, "treasure", 0)
			ini_write_real(lvl_name, "treasure", global.level_data.treasure)
		
		if global.level_data.secret_count > ini_read_real(lvl_name, "secret_count", 0)
			ini_write_real(lvl_name, "secret_count", global.level_data.secret_count)
		
		if rank_ix > ini_read_real(lvl_name, "rank", 0)
			ini_write_real(lvl_name, "rank", rank_ix)
		
		for (var i = 0; i < 5; i++) 
		{
			if !ini_read_real(lvl_name, "gooch" + string(i + 1), 0)
				ini_write_real(lvl_name, "gooch" + string(i + 1), lvl_toppins[i])
		}
		
		ini_close()
}

function instance_create(_x, _y, obj)
{
	return instance_create_depth(_x, _y, 1, obj); //fun fact, x and y were missing underscores before
}

function sleep(ms)
{
	var t = current_time + ms;
	while current_time < t
		do {};
}

function bbox_in_camera()
{
	return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 
		obj_camera.campos.x, obj_camera.campos.y, obj_camera.campos.x + screen_w, obj_camera.campos.y + screen_h);
}

function check_p_rank()
{
	var nowgooch = 0
	for (var i = 0; i < 5; i++)
		nowgooch += global.level_data.goochlings[i]
	return nowgooch >= 4 && global.level_data.treasure && global.level_data.secret_count >= 3 && global.lap.active && !global.combo.wasted;
}

function set_rank_milestones(_s, _a = _s / 2, _b = _s / 4, _c = _s / 8)
{	
	global.rank_milestones = {
		c: _c,
		b: _b,
		a: _a,
		s: _s
	}
}

function draw_reset_color()
{
	draw_set_color(c_white)
	draw_set_alpha(1)
}

function tile_layer_find(depth, x, y)
{
	var __depth = depth;
	var __x = x;
	var __y = y;

	var __layers = layer_get_all();
	var __numlayers = array_length_1d(__layers);

	var __i;
	for(__i = 0; __i < __numlayers; __i++)
	{
		if (layer_get_depth(__layers[__i]) != __depth)
			continue;
	
		var __els = layer_get_all_elements(__layers[__i]);
		var __numels = array_length_1d(__els);
	
		var __j;
		for(__j = 0; __j < __numels; __j++)
		{
			var __eltype = layer_get_element_type(__els[__j]);
			if __eltype == layerelementtype_tile
			{
				var __tileXscale = layer_tile_get_xscale(__els[__j]);
				var __tileYscale = layer_tile_get_yscale(__els[__j]);
			
				if ((__tileXscale >= 0) && (__tileYscale >= 0))
				{			
					var __tileX = layer_tile_get_x(__els[__j]);						
					if __x < __tileX
						continue;
					
					var __tileY = layer_tile_get_y(__els[__j]);
					if __y < __tileY
						continue;
							
					var __tileReg = layer_tile_get_region(__els[__j]);			
					var __tileRight = __tileX + (__tileXscale * __tileReg[2]);
					if __x >= __tileRight
						continue;
					
				
					var __tileBottom = __tileY + (__tileYscale * __tileReg[3]);
					if __y >= __tileBottom
						continue;
				
					return __els[__j];
				}
				else
				{
					var __tileReg = layer_tile_get_region(__els[__j]);
					var __minx = layer_tile_get_x(__els[__j]);
					var __maxx = __minx + (__tileXscale * __tileReg[2]);
					if __minx > __maxx
					{
						var __temp = __minx;
						__minx = __maxx;
						__maxx = __temp;
					}
				
					if __x < __minx
						continue;
					
					if __x >= __maxx
						continue;
					
					var __miny = layer_tile_get_y(__els[__j]);
					var __maxy = __miny + (__tileYscale * __tileReg[3]);
					if __miny > __maxy
					{
						var __temp = __miny;
						__miny = __maxy;
						__maxy = __temp;
					}
				
					if __y < __miny
						continue;
					
					if __y >= __maxy
						continue;
					
					return __els[__j];
				
				}
			}
		}	
	}

	return -1;
}

function tile_layer_delete_at(depth, x, y)
{
	var __depth = depth;
	var __x = x;
	var __y = y;

	var __tile_el = tile_layer_find(__depth, __x, __y);
	if __tile_el != -1
	{
		layer_tile_destroy(__tile_el);			
	}
}


function create_follower(_x, _y, spr_idle = noone, spr_move = noone, spr_panic = noone, spr_taunt = noone, spr_intro = noone)
{
	var f = {
		sprite_index: noone,
		image_index: 0,
		x: _x,
		y: _y,
		sprs: {
			idle: spr_idle,
			move: spr_move,
			panic: spr_panic,
			taunt: spr_taunt,
			intro: spr_intro
		},
		x_offset: 0,
		lerp_spd: 0
	}
	return f;
}

function reset_level()
{
	global.panic.active = false
	global.lap.active = false
	global.combo.count = 0
	global.combo.timer = 0
	global.score = 0
	ds_list_clear(global.ds_save_room)
	ds_list_clear(global.ds_escapesaveroom)
	ds_list_clear(global.ds_saveroom)
	obj_followerhandler.followers = []
	global.combo.wasted = false
	global.doorshut = false
	global.level_data.treasure = false
	global.level_data.secret_count = 0
	global.level_data.goochlings = [0, 0, 0, 0, 0]
	global.level_data.tauntcount = 0
	global.levelattempts++;
	obj_music.music = noone;
}

function gpu_set_blendmode_cc(bm)
{
	gpu_set_blendmode(bm)
	gpu_set_blendequation_sepalpha(bm_eq_add, bm_eq_max)
}

function trace()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	show_debug_message(_string);
}

function concat()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	return _string;
}

function find_videos(folder)
{
	with (obj_theaterhandler)
	{
		var _array = []
		var file = file_find_first(folder + "*", fa_directory)
		while (file != "") && string_pos(file, ".mp4") > -1
		{
			array_insert(_array, 0, folder + file)
		    file = file_find_next()
		}
		file_find_close()
		trace(_array)
		return _array
	}
}

function draw_shaking_text(_x, _y, _text, _shake)
{
	var saved_h = draw_get_halign()
	var xx = _x
	if draw_get_halign() == fa_center
		xx -= (string_width(_text) / 2)
	if draw_get_halign() == fa_right
		xx -= string_width(_text)
	draw_set_halign(fa_left)
	for (var i = 0; i < string_length(_text); i++)
	{
		draw_text(xx + string_width(string_copy(_text, 0, i)) + irandom_range(_shake, -_shake), _y + irandom_range(_shake, -_shake), string_copy(_text, i + 1, 1))
	}
	draw_set_halign(saved_h)
}

function sprite_islocated(left, top, right, bottom, _x, _y, sprite)
{
	var wide = sprite_get_width( sprite );
	var high = sprite_get_height( sprite );
	var xoff = sprite_get_xoffset( sprite );
	var yoff = sprite_get_yoffset( sprite );
	var minx = _x - xoff;
	var miny = _y - yoff;
	var maxx = minx + wide;
	var maxy = miny + high;
	return maxx >= left && maxy >= top && minx <= right && miny <= bottom;
}