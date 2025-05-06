draw_set_color(c_white);
var seconds = 0;
var minutes = 0;
seconds = global.level_seconds;
minutes = global.level_minutes;
var str = [scr_get_timer_string(minutes, seconds, true)];
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(global.smallfont);
draw_set_alpha(1);
draw_set_color(c_white);
var yy = 0;
for (var i = array_length(str) - 1; i >= 0; i--)
{
	var b = str[i];
	b = string_copy(b, 0, string_length(b) - 2);
	var len = string_length(b) - 1;
	draw_text(screen_w - (len * string_width("A")), screen_h - 8 - (string_height("A") * yy), b);
	yy++;
}
