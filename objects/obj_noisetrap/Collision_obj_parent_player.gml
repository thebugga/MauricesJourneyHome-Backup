if (collision && other.brick && global.playerCharacter == Characters.Pierre)
{
	instance_destroy()
	other.brick = 0
	var player = other
	with (instance_create(x, y, obj_brickcomeback))
	{
		playerid = player.id
		ispeetzy = player.riderispeetzy
		trapped = 1
	}
}
