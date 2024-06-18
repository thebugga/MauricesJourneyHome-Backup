var _w = 960
var _h = 540
var ds_h = 0
display_set_gui_size(_w, _h)
font = font_add_sprite_ext(spr_font,"abcdefghijklmnopqrstuvwxyz!.1234567890:", 1, 0)
draw_set_font(font)
var x1 = rpadding
var y1 = (_h - (((dialogheight + rpadding) + (padding * 2)) + ds_h))
draw_rectangle_color(x1-10, y1-10, (_w - rpadding), (_h - rpadding), $5e26a7, $422653, $946bd4, $b8a4cd, 0)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_color((x1 + padding), ((y1 + padding) + ds_h), displaytext, c_white, c_white, c_white, c_white, 1)
if (dialogsprite != -4)
    draw_sprite(dialogsprite, dialogindex, (x1), (y1))	