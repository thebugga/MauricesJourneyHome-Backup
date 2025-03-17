var roomname = string_letters(room_get_name(room))
if (place_meeting(x, y, obj_parent_player) && sprite_index == spr_pizzaboxunopen)
{
	global.combotime = 60
	ds_list_add(global.saveroom, id)
	//if (!//audio_is_playing(sfx_collecttoppin))
		//scr_soundeffect(sfx_collecttoppin)
	if (content == obj_noisebomb)
	{
		with (obj_parent_player)
		{
			state = states.backbreaker
			sprite_index = spr_player_bossintro
			image_index = 0
		}
		with (instance_create(x, (y - 25), content))
			sprite_index = spr_noisebomb_intro
		instance_create(x, y, obj_taunteffect)
		instance_create(x, (y + 600), obj_itspizzatime)
		global.panic = true
		switch room
		{
			case floor2_roomtreasure:
				global.minutes = 2
				global.seconds = 40
				break
			case floor3_roomtreasure:
				global.minutes = 2
				global.seconds = 30
				break
			case floor4_roomtreasure:
				global.minutes = 2
				global.seconds = 0
				break
			case floor5_roomtreasure:
				global.minutes = 2
				global.seconds = 0
				break
		}
	}
	if (content == obj_goochling)
	{
		with (instance_create(x, (y - 25), content))
			image_index = other.extraval
	}
	sprite_index = spr_pizzaboxopen
}
if (sprite_index == spr_pizzaboxopen && floor(image_index) == 16)
	instance_destroy()
