with (instance_create(x, y, obj_enemycorpse))
	sprite_index = other.deathspr
//scr_soundeffect(sfx_killenemy)
repeat (3)
	particle_create(x, y, particles.hurtstar)
//instance_create(x, y, obj_bangeffect)
quick_ini_write_real($"saves/saveData{global.savefile}.ini", "NPC", deathsavename, 1)