if sprite_index != spr_gerome_collected && global.panic.active
{
	reset_anim(spr_gerome_collected)
	scr_sound(sfx_geromecollect)
	global.combo.timer = 60
	global.lap.active = true

	global.score += 3000
	global.combo.timer = 60
	with instance_create(other.x, other.y, obj_collect_number)
		num = 3000
}
