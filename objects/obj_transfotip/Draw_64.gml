draw_set_font(global.creditsfont)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(fade)
draw_set_color(c_white)
var xx = (obj_screensizer.actual_width / 2)
var yy = (obj_screensizer.actual_height - 50)
if (global.panic && (!instance_exists(obj_ghostcollectibles)))
    yy -= 60
var s = text_size
xx -= (s[0] / 2)
yy -= s[1]
if (string_count("\n", text) > 0)
    xx = 48
xx = floor(xx)
yy = floor(yy)
global.tdp_text_try_outline = 1
scr_draw_text_arr(xx, yy, text_arr, 16777215, fade)
global.tdp_text_try_outline = 0
tdp_text_commit(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height)
draw_set_alpha(1)
