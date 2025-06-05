if (ds_list_find_index(global.ds_save_room, id) == -1)
{
	create_effect(x + random_range(50, -50), y + random_range(50, -50), spr_teleportdebris)
			create_effect(x, y, spr_teleporteffect)
	event_play_oneshot_3d("event:/sfx/misc/teleporterstart", x, y);
	ds_list_add(global.ds_save_room, id);
}
