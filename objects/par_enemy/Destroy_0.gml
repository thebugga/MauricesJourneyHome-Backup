if do_particles
{
	with instance_create(x, y, obj_enemycorpse)
		sprite_index = other.sprs.dead

	global.combo.timer = 60
	global.combo.count++
	
	obj_player.supertauntcount++
	
	particle_create(x, y, particles.bang)
	scr_sound_3d(sfx_killenemy, x, y)
	shake_camera()
	
	ds_list_add(!escape ? global.ds_save_room : global.ds_escapesaveroom, id)
}
