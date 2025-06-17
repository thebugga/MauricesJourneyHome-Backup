draw_set_font(global.smallerfont)
draw_set_align(fa_center, fa_middle, c_white)
for (var g = 0; g < array_length(global.controlings); g++)
{
	var _controlname = ""
	if global.controlings[g] >= 0
		_controlname = gamepad_get_description(global.controlings[g])
	else if global.controlings[g] != -4
		_controlname = $"Keyboard (P{-global.controlings[g]})"
	draw_text(300, 50 + (50 * g), _controlname)
}
/*
switch_index = approach(switch_index, global.swapmode * 4, 0.25)
draw_sprite(spr_multiswitch, switch_index, 50, 400)
multialpha = approach(multialpha, p2_connect, 0.1)
mode_scale = approach(mode_scale, 1, 0.1)
draw_sprite_ext(spr_multimodes, !global.swapmode, 250, 400, 1, 1, 0, c_white, multialpha)
draw_sprite_ext(spr_multimodes, global.swapmode, 250, 400, mode_scale, mode_scale, 0, c_white, multialpha)
*/
draw_set_font(global.generic_font)
draw_text(screen_w / 2, 64, "CHOOSE YOUR CLASS")
for (var i = 0; i < array_length(character); i++)
{
	var mainy = 270 - (((array_length(character) - 1) * 64) / 2) + (i * 64)
	draw_text(560, mainy, character[i].name)
/*
	draw_sprite(spr_charactername, i, 560, mainy)
	if selected == i
	{
		finger1_index += 0.35
		if floor(finger1_index) == (sprite_get_number(spr_fingerselect))
				finger1_index = 0
		draw_sprite_ext(spr_fingerselect, finger1_index, 560 - (sprite_get_width(spr_charactername) / 2), mainy, 1, 1, 0, c_white, 1)
	}
	if selected2 == i && p2_connect
	{
		finger2_index += 0.35
		if floor(finger2_index) == (sprite_get_number(spr_fingerselect))
				finger2_index = 0
		draw_sprite_ext(spr_fingerselect, finger2_index, 560 + (sprite_get_width(spr_charactername) / 2), mainy, -1, 1, 0, c_white, 1)
	}
*/
}
//draw_sprite_ext(spr_characterframe, 0, 720, p1_boxy, 200 / 96, p1_boxheight / 96, 0, c_white, 1)
//draw_sprite_ext(spr_characterframe, 1, 720, p2_boxy, 200 / 96, 220 / 96, 0, c_white, 1)
var _numb = 0
for (var p = 0; p < array_length(vals); p++)
	_numb += vals[p].connected

for (var p = 0; p < array_length(vals); p++)
{
	var mine = vals[p]
	var select = character[mine.selected]
	
	var size = screen_h / _numb
	
	if mine.connected
	{
		pattern_draw(mine.sprite, mine.index, screen_w - 140, (size / 2) + (size * p), quick_ini_read_real($"saves/saveData{global.savefile}.ini", $"Clothes{select.char_enum}", "pattern_sprite", pat_pizza), 2, 2)

		pal_swap_set(select.sprite_set.palette, quick_ini_read_real($"saves/saveData{global.savefile}.ini", $"Clothes{select.char_enum}", "palette_index", 1), false)
		draw_sprite_ext(mine.sprite, mine.index, screen_w - 140, (size / 2) + (size * p), 2, 2, 0, c_white, 1)
		pal_swap_reset()
	}
}
//draw_sprite(spr_player1cursor, 0, 820, p1_boxy + 50)
//draw_sprite(spr_player2cursor, 0, 820, p2_boxy + 50)
//if obj_inputAssigner.player_input_device[1] > -2 && !stopper
//	draw_sprite(spr_player2cursor_start, -1, (random_range(-1, 1) + 820), (random_range(-1, 1) + (640 - (((p1_boxheight - 220) / 220) * 200))))

draw_set_align(fa_center, fa_top)
draw_text(screen_w / 2, 32, global.controlings)