with (instance_create(x, y, obj_enemycorpse))
	sprite_index = other.deathspr
event_play_oneshot("event:/sfx/enemies/kill")
repeat (3)
	particle_create(x, y, particles.hurtstar)
//instance_create(x, y, obj_bangeffect)
quick_ini_write_real($"saves/saveData{global.savefile}.ini", "NPC", deathsavename, 1)