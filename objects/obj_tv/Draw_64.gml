depth = -200


pal_swap_set(pal_combo, global.combo.wasted ? 1 : 2, false)

draw_sprite(combo.sprite, combo.index, x + 90, y + 25)

if combo.sprite == spr_combo_arms_idle
{
	draw_sprite_ext(spr_combo_clockhand, 0, x + 90 + 120, y + 25 + 30, 1, 1, combo.angle, c_white, 1)

	draw_set_align(fa_left, fa_top)
	draw_reset_color()
	draw_set_font(global.combo.font)
	var _tx = x + 90 + 41
	var _ty = y + 25 - 105
	var _str = string(global.combo.count)
	var num = string_length(_str)

	for (var i = num; i > 0; i--)
	{
		var char = string_char_at(_str, i)
		draw_text(_tx, _ty, char)
		_tx -= 16
		_ty += 3
	}
}

pal_swap_reset()

if (!surface_exists(tvsurface))
	tvsurface = surface_create(278, 268)
gpu_set_blendmode(bm_normal)
surface_set_target(tvsurface)
	draw_clear_alpha(c_black, 0)
	if cardboardvisual != -4
		draw_sprite_ext(spr_tv_cardboard, cardboardvisual, 139, cardboardy, image_xscale, image_yscale, image_alpha, image_blend, image_alpha)
	gpu_set_blendmode(bm_subtract)
	draw_sprite(spr_tv_clip, 0, 139, 134)
	gpu_set_blendmode(bm_normal)
surface_reset_target()

draw_sprite(spr_tv_bg, 0, x, y)

if obj_player.pal_select == 8
	pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr, image_xscale, image_yscale)

pal_swap_set(pal_peppino, obj_player.pal_select, false)
draw_self()
draw_surface(tvsurface, x - 139, y - 134)
pal_swap_reset()

if state == tv_states.transition
	draw_sprite(spr_tv_trans, t_index, x, y)

if (!ds_list_empty(messagelist))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(global.smallerfont);
	if ds_list_size(messagelist) > 5
		ds_list_delete(messagelist, 1)
	for (var i = 0; i < ds_list_size(messagelist); i++)
	{
		var b = ds_list_find_value(messagelist, i)
		{
			draw_set_alpha(b.alpha)
			draw_text(screen_w / 2 + 10, (((ds_list_size(messagelist) - 1) * 16) - (16 * i)), b.text)
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