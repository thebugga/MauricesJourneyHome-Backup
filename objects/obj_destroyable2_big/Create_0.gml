hp = 2
if (global.playerCharacter == Characters.Maurice && obj_player1.spotlight == 1 && obj_player1.ispeppino)
	sprite_index = spr_bigbreakable
if ((global.playerCharacter == Characters.Doise or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
	sprite_index = spr_bigbreakable
depth = 1
content = obj_null
