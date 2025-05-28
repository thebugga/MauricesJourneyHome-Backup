particle_create(x, y, particles.genericpoof)
init_collide()
vsp = -11

snd = fmod_createEventInstance("event:/sfx/misc/breakdancemusic")
event_play_oneshot_3d("event:/sfx/misc/breakdance", x, y)
