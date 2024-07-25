spotplayer = obj_player1.spotlight == 1 ? obj_player1 : obj_player2
image_speed = 0.35
if spotplayer.character == "M"
	sprite_index = spr_giantpizza
else if spotplayer.character == "D"
	sprite_index = spr_giantpizzahalloween
else if spotplayer.character == "P"
	sprite_index = spr_snickcollectible3
depth = 11
secret = 1
