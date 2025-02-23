var _xx = 195
if (showtext == true)
    yi = approach(yi, 500, 5)
else
    yi = approach(yi, 600, 1)
if (msg != "NaN")
{
    draw_set_font(global.font_small)
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    draw_sprite(spr_roomnamebg, 0, _xx, yi)
    if (string_width(string_upper(msg)) <= maxwidth)
        draw_text(_xx, yi, string_upper(msg))
    else
        draw_text_ext(_xx, (yi - 6), string_upper(msg), -1, maxwidth)
}
