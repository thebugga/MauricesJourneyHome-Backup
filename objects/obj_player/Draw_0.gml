if censormode
	draw_sprite_ext(spr_player_mask, image_index, x, y, xscale, yscale, 0, c_white, 1)
else
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 0, c_white, 1)
if debug {
	draw_text(x - 20, y-40, state)
}
	