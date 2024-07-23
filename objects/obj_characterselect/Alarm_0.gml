with (instance_create(x, y, obj_fadeout))
{
	obj_player1.targetRoom = hub_theatre
	obj_player1.targetDoor = "A"
	obj_player1.lastroom = room
	obj_player2.lastroom = room
	obj_player1.hallway = true;
	obj_player1.hallwaydirection = 1;
	if (global.coop == true)
	{
		obj_player2.targetDoor = "A"
		obj_player2.hallway = true;
		obj_player2.hallwaydirection = 1;
	}
}
gamesave_async_load()
