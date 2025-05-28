if sprite_index != spr_gerome_collected && global.panic.active
{
	reset_anim(spr_gerome_collected)
	event_play_oneshot("event:/sfx/voice/geromegot")
	global.combo.timer = 60
	global.lap.active = true

	global.score += 3000
	global.combo.timer = 60
	with instance_create(other.x, other.y, obj_collect_number)
		num = 3000
		
	ds_list_clear(global.ds_escapesaveroom)
}
