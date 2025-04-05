with (instance_create((x + 32), (y + 32), obj_deatheffect))
	sprite_index = spr_bigdoughblockdead
scr_sleep(5)
tile_layer_delete_at(1, x, y)
tile_layer_delete_at(1, (x + 32), y)
tile_layer_delete_at(1, (x + 32), (y + 32))
tile_layer_delete_at(1, x, (y + 32))
