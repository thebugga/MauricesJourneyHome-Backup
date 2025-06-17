image_speed = 0.35

var readyasever = true
	
for (var p = 0; p < array_length(vals); p++)
{
	if vals[p].connected != vals[p].ready
		readyasever = false
}

if stopper
	exit

if readyasever
{
	instance_activate_object(obj_player)
	var xx = 0
	var yy = 0
	var players = array_create(array_length(vals), 0)
	with (obj_player)
	{
		if player == 0
		{
			xx = x
			yy = y
		}
		players[player] = {
			x: x,
			y: y,
			state: state,
		}
		instance_destroy()
	}
	for (var p = 0; p < array_length(vals); p++)
	{
		if vals[p].ready
		{
			with instance_create_depth(players[p] != 0 ? players[p].x : xx, players[p] != 0 ? players[p].y : yy, -100, obj_player)
			{
				player = p
				character = other.character[other.vals[p].selected].char_enum
				scr_character_spr()
						
				state = players[p] != 0 ? players[p].state : states.normal
						
				pal_select = quick_ini_read_real($"saves/saveData{global.savefile}.ini", $"Clothes{character}", "palette_index", 1)
				pattern_spr = quick_ini_read_real($"saves/saveData{global.savefile}.ini", $"Clothes{character}", "pattern_sprite", pat_pizza)
				hat_spr = quick_ini_read_real($"saves/saveData{global.savefile}.ini", $"Clothes{character}", "hat", -4)
			}
		}
	}
	if instance_number(obj_player) == 1
		global.controlings[0] = -3
	instance_deactivate_object(obj_player)
			
	event_play_oneshot("event:/sfx/misc/collecttoppin")
	alarm[0] = 100
	stopper = true
}
else
{
	var anytroller = scr_anybutton_pressed()
	if !array_contains(global.controlings, anytroller)
	{
		for (var i = 0; i < array_length(global.controlings); i++)
		{
			if global.controlings[i] == -4
			{
				global.controlings[i] = anytroller
				break
			}
		}
	}
	for (var p = 0; p < array_length(vals); p++)
	{
		var mine = vals[p]
		var select = character[mine.selected]
		
		if global.controlings[p] == -3
			global.controlings[p] = global.P1s_anytrol
			
		get_input(p)
		
		if mine.connected
		{
			if !mine.ready
			{
				mine.selected = clamp(mine.selected + (-key_up.pressed + key_down.pressed), 0, array_length(character) - 1)
		
				mine.sprite = select.sprite_set.walkforth
				if (key_jump.pressed)
				{
					mine.ready = true
					event_play_oneshot("event:/sfx/misc/collecttoppin")
					mine.sprite = select.sprite_set.choseshock
					mine.index = 0
				}
			}
			if (key_grab.pressed && mine.ready)
			{
				mine.ready = false
				event_play_oneshot("event:/sfx/player/hurt")
			}
		}
		
		if p == 0
		{
			if key_taunt.pressed
			{
				global.swapmode = !global.swapmode
				mode_scale = 2
			}
		}
		else
		{
			if key_jump.pressed && !mine.connected
				mine.connected = true
			if key_grab.pressed && mine.connected
				mine.connected = false
		}
		
		if floor(mine.index) == (sprite_get_number(mine.sprite) - 1)
		{
			if mine.sprite == select.sprite_set.walkforth
				mine.index = 0
		}
		else
			mine.index += 0.35
	}
}