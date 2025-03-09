scr_getinput()
if !instance_exists(obj_option)
{
	if !instance_exists(obj_fadeout)
	{
		var _m = (key_down2 - key_up2)
		selected_world += _m
		selected_world = clamp(selected_world, 0, (array_length(level_array) - 1))
		if _m != 0
			selected_level = 0
		selected_level += (key_left2 + key_right2)
		selected_level = clamp(selected_level, 0, (array_length(level_array[selected_world]) - 1))
	}
	
	with obj_parent_player
	{
		movespeed = 0
		hsp = 0
		vsp = 0
	}
	
	if !active
		exit;
	
	if key_jump2 && !instance_exists(obj_fadeout)
	{
		var _levelinfo = level_array[selected_world][selected_level]
		with obj_parent_player
		{
			global.leveltosave = _levelinfo[2]
			global.leveltorestart = _levelinfo[1]
			state = states.comingoutdoor
			movespeed = 0
			hsp = 0
			vsp = 0
			targetRoom = _levelinfo[1]
			targetDoor = "A"
			global.level_seconds = 0
			global.level_minutes = 0
			global.tauntcount = 0
			with (instance_create_unique(0, 0, obj_fadeout))
				restarttimer = true;
		}
		if array_length(_levelinfo) >= 4
		{
			with instance_create(0, 0, obj_titlecard)
				image_index = _levelinfo[3]
		}
	}
	if instance_exists(obj_fadeout)
	{
		with obj_parent_player
			image_index = 0
	}
}
if keyboard_check_pressed(ord("1"))
{
    selected_character++
	if selected_character > array_length(character_array) - 1
		selected_character = 0
    global.playerCharacter = character_array[selected_character][0]
    with (obj_player1)
        scr_characterspr()
}

if obj_player1.key_up2
{
    if (obj_player1.paletteselect < 6)
        obj_player1.paletteselect += 1
    else
        obj_player1.paletteselect = 1
}
