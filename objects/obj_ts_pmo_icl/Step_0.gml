y = lerp(ystart + screen_h, ystart - sprite_height, playerid.image_index / playerid.image_number)
if playerid.state != states.taunt
	instance_destroy()