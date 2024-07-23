titlestate++
if titlestate == 4
{
	with obj_player
	{
		with (instance_create_unique(0, 0, obj_fadeout))
			restarttimer = true;
	}
	fadeout = true
}
else
	alarm[2] = 150