if (room == rm_editor)
	exit;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
	scr_sleep(5)

	repeat (6)
	{
		with (create_debris((x + 16), y, sprite_index))
		{
			if (sprite_index == spr_bigbreakable)
				sprite_index = spr_bigdebris
			else
				sprite_index = spr_halloweendebris
		}
	}
	if (content == obj_null)
	{
		global.heattime += 10
		global.heattime = clamp(global.heattime, 0, 60)
		global.combotime += 10
		global.combotime = clamp(global.combotime, 0, 60)
		var val = heat_calculate(100)
		if (other.object_index == obj_player1)
			global.collect += val
		else
			global.collectN += val
		if audio_is_playing(sfx_collecttopping)
			audio_stop_sound(sfx_collecttopping)
		scr_soundeffect(sfx_collecttopping)
		with (instance_create((x + 16), y, obj_smallnumber))
			number = string(val)
	}
	else
		instance_create((x + 32), y, content)
	repeat (3)
		create_baddiegibsticks((x + 32), (y + 32))
	tile_layer_delete_at(1, x, y)
	tile_layer_delete_at(1, (x + 32), y)
	tile_layer_delete_at(1, (x + 32), (y + 32))
	tile_layer_delete_at(1, x, (y + 32))
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
	ds_list_add(global.saveroom, id)
}
