with (instance_create(x, y, obj_fadeout))
{
	obj_player1.targetRoom = hub_outside
	obj_player1.targetDoor = "A"
	obj_player1.state = states.normal
	if (global.coop == true)
	{
		obj_player2.targetDoor = "A"
	}
}
gamesave_async_load()
