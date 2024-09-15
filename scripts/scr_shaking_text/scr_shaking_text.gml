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