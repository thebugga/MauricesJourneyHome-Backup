if ds_list_find_index(global.ds_escapesaveroom, id) != -1 exit;

event_play_oneshot_3d("event:/sfx/misc/bellcollect", x, y)

ds_list_add(global.ds_escapesaveroom, id)
