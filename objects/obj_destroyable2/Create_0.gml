global.breaksound = 0
if (global.playerCharacter == Characters.Maurice && obj_player1.spotlight == 1)
	sprite_index = spr_destroyable2
if (global.playerCharacter == Characters.Doise && obj_player1.spotlight == 1)
	sprite_index = spr_destroyable2
image_index = random_range(0, (image_number - 1))
depth = 1
