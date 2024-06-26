if ((x > 1200) && (!instance_exists(obj_fadeout)) && (ok == 0))
{
    with (instance_create(x, y, obj_fadeout))
        obj_player.target_room = hub_outside
}
else if ((x > 1200) && (ok == 1))
    instance_destroy()
if alarm[1] == -1
	alarm[1] = 1;
if (obj_player.key_jump2){
	move = 1
}
if move == 1
x += 8