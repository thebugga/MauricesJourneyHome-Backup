if (sprite_index == spr_button_goingpressed && animation_end())
	sprite_index = spr_button_pressed
if ((!global.timedgatetimer) && sprite_index == spr_button_pressed)
	sprite_index = spr_button_goingidle
if (sprite_index == spr_button_goingidle && animation_end())
	sprite_index = spr_button_idle
