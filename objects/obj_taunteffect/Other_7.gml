instance_destroy()
if (global.playerCharacter == Characters.Doise)
{
	image_speed = 0
	if (obj_player1.image_index < 18 or obj_player1.state != states.backbreaker)
		instance_destroy()
}
