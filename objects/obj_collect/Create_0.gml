if (room == rm_editor)
	exit;
spotplayer = obj_player1.spotlight == 1 ? obj_player1 : obj_player2
with (other)
{
	if global.playerCharacter == Characters.Maurice
		sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
	else if global.playerCharacter == Characters.Doise
		sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
	else if global.playerCharacter == Characters.Maurice
		sprite_index = spr_snickcollectible1
	image_speed = 0.35
	global.collected = 0
	global.collectsound = 0
}
depth = 11
gotowardsplayer = 0
movespeed = 5
