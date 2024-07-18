draw_set_font(global.font_small)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
for (var i = 0; i < 2; i++)
{
	var _x = (i == 0 ? 125 : 350)
	draw_sprite(spr_charactercontroller, i, _x, 150)
	var _frame = i
	if obj_inputAssigner.player_input_device[i] == -1
		_frame = 2
	if obj_inputAssigner.player_input_device[i] > -1
	{
		var _control = gamepad_get_description(obj_inputAssigner.player_input_device[i])
		if string_pos("Xbox", _control) != 0
			_frame = 3
		else if string_pos("PLAYSTATION", _control) != 0 || string_pos("PS", _control) != 0
			_frame = 4
		else if string_pos("Nintendo", _control) != 0
			_frame = 5
		else
			_frame = 6
	}
	if control_timer[i] > 0
		control_timer[i]--
	else if obj_inputAssigner.player_input_device[i] > -2
	{
		draw_sprite_ext(spr_charactercontroller, _frame, _x, 150, control_scale[i], control_scale[i], 0, c_white, 1)
		control_scale[i] = Approach(control_scale[i], 1, 0.1)
		if obj_inputAssigner.player_input_device[i] > -1
			draw_text(_x, 100, _control)
	}
	
}
switch_index = Approach(switch_index, multimode * 4, 0.25)
draw_sprite(spr_multiswitch, switch_index, 50, 400)
multialpha = Approach(multialpha, p2_connect, 0.1)
mode_scale = Approach(mode_scale, 1, 0.1)
draw_sprite_ext(spr_multimodes, !multimode, 250, 400, 1, 1, 0, c_white, multialpha)
draw_sprite_ext(spr_multimodes, multimode, 250, 400, mode_scale, mode_scale, 0, c_white, multialpha)

var shadowclip = surface_create(960, 540)
surface_set_target(shadowclip)
for (var i = 0; i < ds_list_size(shadows); i++)
{
	var b = ds_list_find_value(shadows, i)
	b.x += (b.movespeed * b.scale)
	b.vsp += 0.1
	b.y += b.vsp
	if b.vsp >= 2
		b.vsp = -2.1
	draw_sprite_ext(b.index, -1, b.x, b.y, b.scale * 7, 7, 0, c_black, 1)
	if (b.scale == 1 && b.x >= 1480) || (b.scale == -1 && b.x <= -680)
	{
		ds_list_delete(shadows, i)
		i--
		b = undefined
	}
}
surface_reset_target()
draw_set_alpha(0.5)
draw_surface(shadowclip, 0, 0)
draw_set_alpha(1)
surface_free(shadowclip)
draw_set_font(global.creditsfont)
draw_text(480, 50, "Choose your Class")
for (var i = 0; i < array_length(character); i++)
{
	var mainy = 270 - (((array_length(character) - 1) * 64) / 2) + (i * 64)
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
}
var size = 440
if (p2_connect)
	size = 220
p1_boxheight = Approach(p1_boxheight, size, 10)
var p1_boxy = 30 + (((p1_boxheight - 220) / 220) * 20)
var p2_boxy = 70 + p1_boxheight + (((p1_boxheight - 220) / 220) * 100)
draw_sprite_ext(spr_characterframe, 0, 720, p1_boxy, 200 / 96, p1_boxheight / 96, 0, c_white, 1)
draw_sprite_ext(spr_characterframe, 1, 720, p2_boxy, 200 / 96, 220 / 96, 0, c_white, 1)
draw_sprite_ext(p1_sprite, p1_index, 820, p1_boxy + (p1_boxheight / 2), 2, 2, 0, c_white, 1)
draw_sprite_ext(p2_sprite, p2_index, 820, p2_boxy + 110, 2, 2, 0, c_white, 1)
draw_sprite(spr_player1cursor, 0, 820, p1_boxy + 50)
draw_sprite(spr_player2cursor, 0, 820, p2_boxy + 50)
if obj_inputAssigner.player_input_device[1] > -2 && !stopper
	draw_sprite(spr_player2cursor_start, -1, (random_range(-1, 1) + 820), (random_range(-1, 1) + (640 - (((p1_boxheight - 220) / 220) * 200))))