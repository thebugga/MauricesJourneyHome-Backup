if (room == editor_room)
	exit;
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if is_bossroom()
	exit;
if global.playerCharacter == Characters.Doise
{
	if obj_player1.state == states.Sjump
		jetpack_x = approach(jetpack_x, 864, 5)
	else
		jetpack_x = approach(jetpack_x, 1014, 5)
	var _width = sprite_get_width(spr_temperature_meterfill)
	var _height = sprite_get_height(spr_temperature_meterfill)
	var _tmp = (obj_player1.superjumptimer / 200)
	var _height2 = (_height * _tmp)
	draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, 0, _width, _height2, jetpack_x, (192 + _height), 1, -1, c_white, 1)
	draw_sprite(spr_temperature_meter, 0, jetpack_x, 192)
}
var tv_x = 0
var tv_y = -54
var hud_xx = 839
var hud_yy = 90

var _cx = combo_posX + 130
var _cy = hud_yy + 125 + combo_posY
var _perc = global.combotime / 60
var _minX = _cx - 56
var _maxX = _cx + 59
combofill_x = lerp(combofill_x, (_minX + (_maxX - _minX) * _perc), 0.5)
combofill_y = _cy
pal_swap_set(spr_tv_combofillpalette, ((!global.combodropped) ? 2 : 1), false)
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
reset_shader_fix()
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _tx = _cx - 64
var _ty = _cy - 12
var _str = string(global.combo)
var _num = string_length(_str)
for (var i = _num; i > 0; i--)
{
	var char = string_char_at(_str, i)
	draw_text(_tx, _ty, char)
	_tx -= 22
	_ty -= 8
}

if (!surface_exists(tvsurface))
	tvsurface = surface_create(278, 268)
gpu_set_blendmode(bm_normal)
surface_set_target(tvsurface)
	draw_clear_alpha(c_black, 0)
	if cardboardvisual != -4
		draw_sprite_ext(cardboardvisual, 0, 139, cardboardy, 1, 1, 0, c_white, alpha)
	gpu_set_blendmode(bm_subtract)
	draw_sprite(spr_tv_clip, 0, 139, 134)
	gpu_set_blendmode(bm_normal)
surface_reset_target()
shader_set(global.Pal_Shader)
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
draw_sprite_ext(spr_tv_bgfinal, tv_bg_index,(tv_x + 139), ((tv_y + 134) + hud_posY),  1, 1, 0, c_white, alpha)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.patterntexture)
draw_sprite_ext(sprite_index, image_index, (tv_x + 139), ((tv_y + 134) + hud_posY), 1, 1, 0, c_white, alpha)
if state == states.normal && sprite_index != spr_tv_open
	draw_surface(tvsurface, (tv_x), ((tv_y) + hud_posY))
pattern_reset()
if (state = states.tv_whitenoise)
	draw_sprite_ext(spr_tv_whitenoise, floor(noiseindex), (tv_x + 139), ((tv_y + 134) + hud_posY), 1, 1, 0, c_white, alpha)
reset_shader_fix()
draw_rectangle_color(0, newsy, 960, newsy + 50, c_red, c_red, c_red, c_red, false)
draw_rectangle_color(0, newsy + 50, 960, newsy + 70, c_white, c_white, c_white, c_white, false)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (newsy == 470)
{
	promptx -= promptspd
	if promptx < -(string_width(prompt))
		prompt = ""
}
draw_text_color(promptx, 60 + newsy, prompt, c_black, c_black, c_black, c_black, 1)
draw_set_font(global.creditsfont)
draw_text_color(100, 25 + newsy, headline, c_white, c_white, c_white, c_white, 1)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
if instance_exists(obj_pizzaball)
	draw_text(832, 300, ((string(global.golfhit) + " ") + "GOLF HIT"))
if global.panic
{
	var _fill = global.fill
	var _currentbarpos = (chunkmax - _fill)
	var _perc = (_currentbarpos / chunkmax)
	var _max_x = 135
	var _barpos = (_max_x * _perc)
	var _hand = 0
	if global.playerCharacter == Characters.Doise
		_hand = 1
	draw_sprite(spr_timer_bar, _hand, timer_x, timer_y)
	draw_sprite(johnface_sprite, johnface_index, ((timer_x + 41) + _barpos), (timer_y + 60))
	draw_sprite(pizzaface_sprite, pizzaface_index, (timer_x + 224), (timer_y + 62))
	var minutes = 0;
	for (var seconds = ceil(global.fill / 12); seconds > 59; seconds -= 60)
		minutes++;
	if (seconds < 10)
		seconds = concat("0", seconds);
	else
		seconds = string(seconds);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.bigfont);
	draw_text(timer_x + 123, timer_y + 72, concat(minutes, ":", seconds));
}
if (!ds_list_empty(messagelist))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(global.font_small);
	if ds_list_size(messagelist) > 5
		ds_list_delete(messagelist, 1)
	for (var i = 0; i < ds_list_size(messagelist); i++)
	{
		var b = ds_list_find_value(messagelist, i)
		{
			draw_set_alpha(b.alpha)
			draw_text(490, (((ds_list_size(messagelist) - 1) * 16) - (16 * i)), b.text)
			draw_set_alpha(1)
			if b.timer > 0
				b.timer--
			else
				b.alpha -= 0.02
			if b.alpha <= 0
			{
				ds_list_delete(messagelist, i)
				i--
				b = undefined
			}
		}
	}
}