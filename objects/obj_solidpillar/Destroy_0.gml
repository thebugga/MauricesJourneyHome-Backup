var p_id = -4
for (var i = 0; i < image_yscale; i++)
{
	with instance_create(x, ((bbox_top + 64) + (128 * i)), obj_enemycorpse)
	{
		sprite_index = other.totems[i].sprites.dead
		image_xscale = other.image_xscale
		p_id = id
	}
}

event_play_oneshot("event:/sfx/enemies/johndead")
do_enemygibs()

ds_list_add(global.ds_saveroom, id)