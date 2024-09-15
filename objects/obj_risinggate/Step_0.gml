y = Approach(y, ystart, 2)
x = xstart
if (y == ystart)
{
    {
        with (instance_create(x, y, obj_startgate))
        {
            sprite_index = other.sprite_index
            targetRoom = other.targetRoom
            level = other.level
            titlecardi = other.titlecardi
            event_perform(ev_other, ev_room_start)
        }
    }
    instance_destroy()
}
with (obj_camera)
{
    shake_mag = 3
    shake_mag_acc = 5 / room_speed
}
fmod_event_instance_set_3d_attributes(snd, x, y)
