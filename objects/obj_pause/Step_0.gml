if ((!pause) && obj_savesystem.state == states.normal && (!instance_exists(obj_fadeout)))
{
    if (obj_player1.key_start && room != OldRealtitlescreen && room != rm_eggplantdisclaimer && room != rm_logo && room != Mainmenu && room != rank_room && room != timesuproom)
    {
        selected = 0
        if (!instance_exists(obj_pausefadeout))
            instance_create(x, y, obj_pausefadeout)
    }
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
    instance_destroy(obj_pausefadeout)
with (obj_player1)
{
	other.paletteselect = paletteselect
	other.spr_palette = spr_palette
}
if (pause && (!instance_exists(obj_option)))
{
	fade = Approach(fade, 1, 0.1)
	scr_getinput()
	application_surface_draw_enable(true)
	var prevselected = selected
	moveselect = ((-key_up2) + key_down2)
	selected += moveselect
	if (moveselect != 0 && selected >= 0 && selected <= 2)
		//scr_soundeffect(sfx_step)
	selected = clamp(selected, 0, (array_length(pause_menu) - 1))
	peppino_sprite = pause_menu[selected][1]
	if key_jump
	{
		var func = pause_menu[selected][2]
        if (func != -4)
			method(id, func)()
	}
	cursor_index += 0.35
	if (cursor_index > sprite_get_number(spr_cursor))
	{
		var p = (cursor_index - floor(cursor_index))
		cursor_index = p
	}
	peppino_index += 0.35
	if (peppino_index > sprite_get_number(peppino_sprite))
	{
		p = (peppino_index - floor(peppino_index))
		peppino_index = p
	}
	for (var i = 0; i < array_length(toppin_sprite); i++)
	{
		toppin_index[i] += 0.35
		if (toppin_index[i] > toppin_number[i])
		{
			var t = toppin_index[i]
			p = (t - floor(t))
			toppin_index[i] = p
		}
	}
	toppin_has[0] = global.cheesefollow
	toppin_has[1] = global.pineapplefollow
	toppin_has[2] = global.sausagefollow
	toppin_has[3] = global.shroomfollow
	toppin_has[4] = global.tomatofollow
}
if (!pause)
	fade = Approach(fade, 0, 0.1)
scr_getinput()