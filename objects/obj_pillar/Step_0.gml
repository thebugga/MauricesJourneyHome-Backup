for (var i = 0; i < image_yscale; i++)
{
	var to = totems[i]
	to.sprite_index = to.sprites.idle
	to.image_index += image_speed
	if to.image_index >= sprite_get_number(to.sprite_index)
		to.image_index = 0
}