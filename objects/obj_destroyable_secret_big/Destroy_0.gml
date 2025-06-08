if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	particle_create(x, y, particles.bang)
	sleep(5)
	event_play_oneshot_3d("event:/sfx/misc/breakblock", x, y)
	
	scr_cutoff();
	if (is_string(targettiles))
		scr_destroy_tiles(32, targettiles);
	else
		scr_destroy_tile_arr(32, targettiles);
	scr_destroy_nearby_tiles();
	ds_list_add(global.ds_saveroom, id)
}
