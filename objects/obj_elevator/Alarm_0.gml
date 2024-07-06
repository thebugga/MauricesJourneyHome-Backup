if trapdoor
{
if trapopen
{
if charvely == 0
{
charvely = 1
alarm[0] = 200
}
else
 {
with (obj_player)
{
        lastroom_x = x
        lastroom_y = y
        lastroom = room
        targetDoor = "A"
		state = states.normal
        targetRoom = hub_tutorial1
}
        fadein = true
        instance_create(x, y, obj_fadeout)
    }
}
else
{
trapopen = true
charsprite = spr_elevator_maurice1shock
elavatorsprite = spr_elevator_bgopen
shake = 0
alarm[0] = 100
}
}
else
    {
        stop_music()
with (obj_player)
{
        lastroom_x = x
        lastroom_y = y
        lastroom = room
        target_door = other.targetDoor
        target_room = other.targetRoom
}
        fadein = true
        instance_create(x, y, obj_fadeout)
    }