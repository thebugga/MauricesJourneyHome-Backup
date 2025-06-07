draw_set_align(fa_center, fa_middle, c_white)
draw_set_font(global.generic_font)

var s = string_height("M")
var sw = screen_w / 2
var sh = (screen_h / 2) - ((s * array_length(options)) / 2)

if room == mainmenu
	sh = (screen_h / 2) + 32
else
	draw_text(sw, 64, "OPTIONS")

for (var i = 0; i < array_length(options); i++) 
{
	var option = options[i]
	draw_text(sw, sh + (i * s), $"{option.o_name}{option.val}")
}

option = options[optionselected]

var str = $"{option.o_name}{option.val}"

sw -= (string_width(str) / 2)

draw_sprite(spr_cursor, 0, sw, sh + (optionselected * s))
