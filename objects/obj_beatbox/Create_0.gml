particle_create(x, y, particles.genericpoof)
collide_init()
vsp = -11

snd = fmod_createEventInstance("event:/sfx/misc/breakdancemusic")
event_play_oneshot_3d("event:/sfx/misc/breakdance", x, y)
