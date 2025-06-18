if play_id != -4
{
	pattern_draw(sprite_index, image_index, x, y, play_id.pattern_spr, image_xscale, image_yscale, funnyangle, image_blend, image_alpha)

	pal_swap_set(play_id.spr_palette, play_id.pal_select, false)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, funnyangle, image_blend, image_alpha)
	pal_swap_reset()
}
else
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, funnyangle, image_blend, image_alpha)