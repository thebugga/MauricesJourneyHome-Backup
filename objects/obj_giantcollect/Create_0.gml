spotplayer = obj_player1.spotlight == 1 ? obj_player1 : obj_player2
image_speed = 0.35
if spotplayer.global.playerCharacter == Characters.Maurice
	sprite_index = spr_giantpizza
else if spotplayer.global.playerCharacter == Characters.Doise
	sprite_index = spr_giantpizzahalloween
else if spotplayer.global.playerCharacter == Characters.Maurice
	sprite_index = spr_snickcollectible3
depth = 11
secret = 1
