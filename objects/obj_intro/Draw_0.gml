var _data = video_draw();
var _status = _data[0];

if (_status == 0)
{
    var _surface = _data[1];

    draw_surface_stretched(_surface, 0, 0, 960, 540);
}
else if (_status == -1)
{
	video_close();
	room_goto(Realtitlescreen);
}
if (key_jump2 && !show)
	show = true;
else if (key_jump2 && show)
{
	video_close();
	room_goto(Realtitlescreen);
}
if (show)
{
	draw_set_font(global.bigfont)
	draw_set_color(c_white);
	draw_text(10, 520, "PRESS Z TO SKIP.");
	draw_reset();
}