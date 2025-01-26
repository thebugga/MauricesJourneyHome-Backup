if obj_globaltimer.debug
{
	var _data = video_draw()
	if (_data[0] == 0)
		draw_surface_stretched(_data[1], 0, 0, 128, 72)
	draw_self()
	draw_set_font(global.creditsfont)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text(128, 36, alarm[0])
}