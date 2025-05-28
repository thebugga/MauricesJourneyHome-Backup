visible = true
state = states.stun
escape_frozen = false
stun_timer = 100
particle_create(x, y, particles.genericpoof)
event_play_oneshot_3d("event:/sfx/enemies/escapespawn", x, y)
