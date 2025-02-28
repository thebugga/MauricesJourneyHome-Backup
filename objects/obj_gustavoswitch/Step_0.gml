if (sprite_index == spr_gustavoswitch2 && floor(image_index) == (image_number - 1))
{
	with (obj_player1)
	{
		visible = true
		create_particle(x, y, particle.genericpoofeffect)
		ratmount_Movespeed = 8
		gustavodash = 0
		global.playerCharacter = Characters.Pierre
		state = states.ratmount
		brick = 1
		x = obj_gustavoswitch.x
		y = obj_gustavoswitch.y
		global.switchbuffer = 100
	}
	sprite_index = spr_pepsign
}
