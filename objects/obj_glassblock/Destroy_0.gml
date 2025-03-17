if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat 6
		create_debris((x + random_range(-10, 10)), (y + random_range(-10, 10)), spr_glasspiece)
	tile_layer_delete_at(1, x, y)
	ds_list_add(global.saveroom, id)
}
