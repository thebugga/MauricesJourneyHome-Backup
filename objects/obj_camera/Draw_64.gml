
if (is_bossroom() or room == editor_room)
exit;
if global.kungfu
{	
if (global.hp == 8)
	draw_sprite(spr_pizzahealthbar, 0, 190, 70)
else if (global.hp == 7)
	draw_sprite(spr_pizzahealthbar, 1, 190, 70)
else if (global.hp == 6)
	draw_sprite(spr_pizzahealthbar, 2, 190, 70)
else if (global.hp == 5)
	draw_sprite(spr_pizzahealthbar, 3, 190, 70)
else if (global.hp == 4)
	draw_sprite(spr_pizzahealthbar, 4, 190, 70)
else if (global.hp == 3)
	draw_sprite(spr_pizzahealthbar, 5, 190, 70)
else if (global.hp == 2)
	draw_sprite(spr_pizzahealthbar, 6, 190, 70)
else if (global.hp == 1)
	draw_sprite(spr_pizzahealthbar, 7, 190, 70)
else if (global.hp == 0)
	draw_sprite(spr_pizzahealthbar, 8, 190, 70)
}
if (obj_player1.x > (room_width - 250) && obj_player1.y < 180)
	hud_posY = Approach(hud_posY, -300, 15)
else
	hud_posY = Approach(hud_posY, 0, 15)
pizzascore_index += (0 + (0.25 * global.stylethreshold))
if (pizzascore_index > (pizzascore_number - 1))
	pizzascore_index = (0 + frac(pizzascore_index))
if (global.stylethreshold <= 0)
{
	if (floor(pizzascore_index) != 0)
		pizzascore_index += 0.35
	else
		pizzascore_index = 0
}
var b = global.stylemultiplier
var hud_xx = 839
var hud_yy = 90 + hud_posY
var hud_scorex = hud_xx + irandom_range(-collect_shake, collect_shake)
var hud_scorey = hud_yy + irandom_range(-collect_shake, collect_shake)
if global.heatmeter
{
	shader_set(global.retro_pal_swapper)
	pal_swap_set(98, global.stylethreshold, 0)
	draw_sprite_ext(spr_heatmeter, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
	shader_reset()
}
var _cx = (hud_xx + combo_posX)
var _cy = (((hud_yy + 75)) + combo_posY)
var _perc = (global.combotime / 60)
var _minX = (_cx - 56)
var _maxX = (_cx + 59)
combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
combofill_y = _cy
shader_set(global.retro_pal_swapper)
pal_swap_set(spr_tv_combofillpalette, (!global.combodropped) ? 2 : 1, false)
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
reset_shader_fix()
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _tx = (_cx - 64)
var _ty = (_cy - 12)
var _str = string(global.combo)
var _num = string_length(_str)
for (var i = _num; i > 0; i--)
{
	var char = string_char_at(_str, i)
	draw_text(_tx, _ty, char)
	_tx -= 22
	_ty -= 8
}
draw_sprite_ext(spr_pizzascore, pizzascore_index, hud_scorex, hud_scorey, 1, 1, 0, c_white, alpha)
var _score = global.collect
if global.coop
	_score += global.collectN
if (_score >= global.crank)
	draw_sprite_ext(spr_pizzascore_pepper, pizzascore_index, hud_scorex, hud_scorey, 1, 1, 0, c_white, alpha)
if (_score >= global.brank)
	draw_sprite_ext(spr_pizzascore_pepperoni, pizzascore_index, hud_scorex, hud_scorey, 1, 1, 0, c_white, alpha)
if (_score >= global.arank)
	draw_sprite_ext(spr_pizzascore_olive, pizzascore_index, hud_scorex, hud_scorey, 1, 1, 0, c_white, alpha)
if (_score >= global.srank)
	draw_sprite_ext(spr_pizzascore_shroom, pizzascore_index, hud_scorex, hud_scorey, 1, 1, 0, c_white, alpha)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(global.bigfont)
var p_color = global.prank_enemykilled ? c_white : c_gray
draw_sprite_ext(spr_toppinshroom_pause, 0, hud_xx-100, hud_yy, 1, 1, 0, global.toppintotal == 5 ? c_white : c_gray, alpha)
draw_sprite_ext(spr_secretblock, 0, hud_xx-25, hud_yy, 1, 1, 0, global.secretfound >= 3 ? c_white : c_gray, alpha)
draw_text_color(hud_xx+50, hud_yy + 50, "P", p_color, p_color, p_color, p_color, alpha)
draw_sprite_ext(spr_treasure1, 0, hud_xx+100, hud_yy, 1, 1, 0, global.treasure ? c_white : c_gray, alpha)
draw_set_alpha(alpha)
draw_text(hud_xx-75, hud_yy + 50, global.toppintotal)
draw_text(hud_xx, hud_yy + 50, global.secretfound)
draw_set_alpha(1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(global.collectfont)
var text_y = 0
switch (floor(pizzascore_index))
{
	case 1:
	case 2:
	case 3:
		text_y = 1
	break
	case 5:
	case 10:
		text_y = -1
	break
	case 6:
	case 9:
		text_y = -2
	break
	case 7:
		text_y = -3
	break
	case 8:
		text_y = -5
	break
}

var cs = 0
with (obj_comboend)
	cs += comboscore
with (obj_particlesystem)
{
	for (var i = 0; i < ds_list_size(global.collect_list); i++)
		cs += ds_list_find_value(global.collect_list, i).value;
}
var sc = _score - global.comboscore - cs
if (sc < 0)
	sc = 0
var str = string(sc)
var num = string_length(str)
var w = string_width(str)
var xx = hud_scorex - (w / 2)
if (lastcollect != sc)
{
	color_array = array_create(num, 0)
	for (var i = 0; i < array_length(color_array); i++)
		color_array[i] = choose(irandom(3))
	lastcollect = sc
}
draw_set_alpha(alpha)
for (i = 0; i < num; i++)
{
	var yy = (((i + 1) % 2) == 0) ? -5 : 0
	var c = color_array[i]
	draw_text(floor(xx), floor((hud_scorey - 56) + text_y + yy), string_char_at(str, i + 1))
	xx += (w / num)
}

draw_set_alpha(1)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
hpindex += 0.35
if (hpindex > (sprite_get_number(spr_vigihp) - 1))
	hpindex = (0 + frac(hpindex))
var defaultx = 80
var defaulty = 406
xx = defaultx
yy = defaulty
if (global.playerCharacter == Characters.Vigilante)
{
	for (var i = 0; i < 9; i++) 
	{
		if (i != 0)
			xx += 44
		if (xx >= (defaultx + 132))
		{
			xx = defaultx
			yy += 42
		}
		draw_sprite_ext(spr_vigihp, hpindex, xx, yy, 1, 1, 0, c_black, 1)
		if (i < global.playerhealth)
			draw_sprite(spr_vigihp, hpindex, xx, yy)
		hppos[i + 1][0] = xx
		hppos[i + 1][1] = yy
	}
}
