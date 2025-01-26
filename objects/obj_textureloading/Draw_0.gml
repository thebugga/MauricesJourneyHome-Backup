//if (!(ds_exists(tex_list, 2)))
//	exit;
//var p = (tex_max - ds_list_size(tex_list))
//var t = ((p / tex_max) * 100)
//draw_healthbar(0, 524, 960, 540, t, c_black, c_white, c_white, 0, 0, 0)

var p1 = tex_max - array_length(tex_list)
var p2 = lang_max - ds_queue_size(global.lang_to_load)
var p3 = lang_tex_max - lang_tex
var t = (p1 + p2 + p3) / (tex_max + lang_max + lang_tex_max)
var spr_w = sprite_get_width(spr_loadingmauridoise)
var spr_h = sprite_get_height(spr_loadingmauridoise)
var xx = floor(480 - spr_w / 2)
var yy = floor(270 - spr_h / 2)
draw_sprite(spr_loadingmauridoise, 0, xx, yy)
draw_sprite_part(spr_loadingmauridoise, 1, 0, 0, (spr_w * t), spr_h, xx, yy)

draw_set_color(c_white)
draw_set_font(-4)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
if array_length(tex_list) > 0
	draw_text(480, 540 - yy, concat("Loading ", tex_list[array_length(tex_list) - 1]))
