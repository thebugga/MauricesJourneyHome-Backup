if (collision && other.brick && global.playerCharacter == Characters.Pierre)
{
	instance_destroy()
	other.brick = 0
	with (instance_create(x, y, obj_brickcomeback))
		trapped = 1
}
