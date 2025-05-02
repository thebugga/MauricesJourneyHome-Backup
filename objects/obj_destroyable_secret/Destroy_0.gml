if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	particle_create(x, y, particles.bang)
	sleep(5)
	scr_sound_3d(sfx_bumpwall, x, y)
	for (var xx = 0; xx < image_xscale; xx++)
	{
		for (var yy = 0; yy < image_yscale; yy++)
			tile_layer_delete_at(x + (32 * yy), y + (32 * yy))
	}
	ds_list_add(global.ds_saveroom, id)
}
