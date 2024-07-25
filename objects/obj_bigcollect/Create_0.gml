spotplayer = obj_player1.spotlight == 1 ? obj_player1 : obj_player2
if spotplayer.character == "M"
	sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
else if spotplayer.character == "D"
	sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
else if spotplayer.character == "P"
	sprite_index = spr_snickcollectible2
image_speed = 0.35
depth = 11
value = 100
