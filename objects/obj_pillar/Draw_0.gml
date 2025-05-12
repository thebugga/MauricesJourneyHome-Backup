for (var i = 0; i < image_yscale; i++)
{
		draw_sprite_ext(totems[i].sprite_index, totems[i].image_index, x, ((bbox_top + 64) + (128 * i)), image_xscale, 1, 0, c_white, 1)
}