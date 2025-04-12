draw_set_align(fa_center, fa_center)
draw_set_font(global.generic_font)

var sw = screen_w / 2
var sh = screen_h / 2

draw_text(sw, 64, "OPTIONS")

sh -= array_length(options) * 16

for (var i = 0; i < array_length(options); i++) 
{
	var option = options[i]
	draw_text(sw, sh + (i * 32), $"{option.o_name}{option.val}")
}

option = options[optionselected]

var str = $"{option.o_name}{option.val}"

sw -= (string_width(str) / 2)

draw_sprite(spr_cursor, 0, sw, sh + (optionselected * 32))
