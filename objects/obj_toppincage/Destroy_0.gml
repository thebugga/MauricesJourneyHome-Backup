if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	create_effect(x, y, spr_toppincage_debris)
	event_play_oneshot("event:/sfx/misc/breakblock")
	
    ds_list_add(global.ds_saveroom, id)
}
if !global.level_data.goochlings[gooch]
{
	with instance_create(x, y, obj_goochling)
		image_index = other.gooch
}