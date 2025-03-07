if (sprite_index == spr_gustavoswitch2 && animation_end())
{
	with (obj_player1)
	{
		visible = true
		create_particle(x, y, particle.genericpoofeffect)
		ratmount_movespeed = 8
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
