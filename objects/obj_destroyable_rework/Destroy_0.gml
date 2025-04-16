if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	with (instance_create(x, y, obj_enemycorpse))
	{
		sprite_index = spr_onewaydead
		image_xscale = other.image_xscale
	}
	sleep(5)
	scr_sound_3d(sfx_killingblow, x, y)
	ds_list_add(global.ds_saveroom, id)
}
