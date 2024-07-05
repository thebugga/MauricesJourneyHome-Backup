if (room == rm_editor)
	exit;
for (var i = 0; i < image_yscale; i++)
{
	var spr = sprite_get_name(sprite_index)
	spr = asset_get_index(concat(spr, totem_face[i]))
	if (spr > -1)
	{
		totem_index[i] += 0.35
		if floor(totem_index[i]) >= (sprite_get_number(spr) - 1)
			totem_index[i] = 0
	}
}