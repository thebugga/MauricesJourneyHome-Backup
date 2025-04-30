image_blend = c_white

if character == p_characters.mandrek && sjumptimer > 0
{
	get_input()
	var fader = min(sjumptimer, 10) / 20
	var yy = 0
	var speeder = sjumptimer
	while (speeder > 0)
	{
		speeder -= key_down.down ? 0.25 : 0.875
		yy -= speeder
	}
	draw_sprite_ext(spr_mandrek_jump, 0, x, y + yy, xscale * visual_size, image_yscale * visual_size, image_alpha, image_blend, fader)
}
	
if sprite_index == spr_exitdoor
	image_blend = make_color_hsv(0, 0, (1 - ((image_number - image_index) / image_number)) * 255)

image_alpha = 1

if (i_frames > 0 && state != states.hurt)
	image_alpha = round(wave(0, 1, 0.01, 0))
	
if pal_select == 12
	pattern_draw(sprite_index, image_index, x, y, pattern_spr, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)

pal_swap_set(pal_peppino, pal_select, false)
if sprite_index != noone && sprite_index != -1
	draw_sprite_ext(sprite_index, image_index, x, y, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)
pal_swap_reset()

if flash > 0
{
	shader_set(shd_flash)
	if sprite_index != noone && sprite_index != -1
		draw_sprite_ext(sprite_index, image_index, x, y, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)
	shader_reset()
}