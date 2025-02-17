global.breaksound = 0
if (global.playerCharacter == Characters.Maurice && obj_player1.spotlight == 1 && obj_player1.ispeppino)
	sprite_index = spr_destroyable2
if ((global.playerCharacter == Characters.Doise or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
	sprite_index = spr_destroyable2
image_index = random_range(0, (image_number - 1))
depth = 1
