if (state == states.grabbed)
    scr_enemy_grabbed()
else if (state == states.lungeattack)
    scr_enemy_lungeattack()
else if (state == (266 << 0))
    scr_enemy_secret()
scr_squash()
if (state != states.stun && state != states.hit)
    linethrown = 0
if (state == states.stun && (!thrown))
    linethrown = 0
if (place_meeting((x - 1), y, obj_spike) || place_meeting(x, (y + 1), obj_spike) || place_meeting(x, (y - 1), obj_spike))
{
    if elite
        elitehit = 0
    instance_destroy()
}
if (state != states.grabbed && state != states.pummel && object_index != obj_fakesanta && use_collision)
    scr_collision()
if (invtime > 0)
    invtime--
if (stompbuffer > 0)
    stompbuffer--
if ((!thrown) && killbyenemybuffer > 0)
    killbyenemybuffer--
if (sprite_index == walkspr && state != (141 << 0) && floor(image_index) != (image_number - 1))
    steppy = 0
if (sprite_index == walkspr && hsp != 0 && sign(hsp) == sign(image_xscale) && grounded && vsp > 0 && floor(image_index) == (image_number - 1) && (!steppy) && state != (141 << 0))
{
    steppy = 1
    var _yy = (y + 43)
    create_particle((x - (image_xscale * 20)), _yy, (1 << 0), 0)
}
if ((object_index != obj_pizzice || state != states.pizzagoblinthrow)) 
{
    if (state == states.walk)
        image_speed = 0.35
    else if (state != (128 << 0))
        image_speed = 0.35
}
if (dodgebuffer > 0)
    dodgebuffer--
if (state != states.hit)
    player_instakillmove = 0
if (fmod_event_instance_is_playing(chargesnd) && state != (128 << 0))
    fmod_event_instance_stop(chargesnd)
