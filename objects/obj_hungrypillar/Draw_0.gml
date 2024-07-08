for (var i = 0; i < image_yscale; i++)
{
	var spr = sprite_get_name(sprite_index)
	spr = asset_get_index(concat(spr, totem_face[i]))
	if (spr > -1)
		draw_sprite_ext(spr, totem_index[i], x, ((bbox_top + 64) + (128 * i)), image_xscale, 1, 0, c_white, 1)
}