if (place_meeting(x, y, obj_parent_player) && !ds_list_find_index(global.saveroom, id))
	ds_list_add(global.saveroom, id);
if (ds_list_find_index(global.saveroom, id) != -1)
	visited = true;
if visited == 1
	sprite_index = spr_doorvisited;
if (sprite_index == spr_doorvisited || sprite_index == spr_doorunvisited)
{
	sprite_index = global.door_sprite;
	image_index = global.door_index;
	image_speed = 0;
}
