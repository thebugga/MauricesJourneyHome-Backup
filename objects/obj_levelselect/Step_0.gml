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
		Movespeed = 0
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
			Movespeed = 0
			hsp = 0
			vsp = 0
			targetRoom = _levelinfo[1]
			targetDoor = "A"
			global.level_seconds = 0
			global.level_minutes = 0
			global.tauntcount = 0
			instance_create(x, y, obj_fadeout)
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
    if ((global.playerCharacter == Characters.Maurice))
    {
        global.playerCharacter = Characters.Doise
        with (obj_player1)
            scr_characterspr()
    }
    else if ((global.playerCharacter == Characters.Doise))
    {
        global.playerCharacter = Characters.MrOrange
        with (obj_player1)
            scr_characterspr()
    }
    else if ((global.playerCharacter == Characters.MrOrange))
    {
        global.playerCharacter = Characters.Clownmato
        with (obj_player1)
            scr_characterspr()
    }
    else if ((global.playerCharacter == Characters.Clownmato))
    {
        global.playerCharacter = Characters.Snick
        with (obj_player1)
            scr_characterspr()
    }
    else if ((global.playerCharacter == Characters.Snick))
    {
        global.playerCharacter = Characters.Maurice
        with (obj_player1)
            scr_characterspr()
    }
}

if obj_player1.key_up2
{
    if (obj_player1.paletteselect < 6)
        obj_player1.paletteselect += 1
    else
        obj_player1.paletteselect = 1
}
