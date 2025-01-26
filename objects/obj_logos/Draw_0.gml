switch(logos)
{
	case 0:
        draw_sprite(spr_fmod, 0, 128, 160)
		break
	case 1:
        draw_sprite(spr_tourdep, 0, 0, 0)
		break
	case 2:
<<<<<<< Updated upstream
        draw_sprite(spr_voyage,-1,0,0)
=======
	case 3:
		draw_clear(c_navy)
		var text_w = sprite_get_width(spr_voyagelogo_text)
		var text_h = sprite_get_height(spr_voyagelogo_text)
		draw_sprite_part(spr_voyagelogo_text, 0, min(max(text_x, tower_x) - text_x, text_w), 0, clamp((text_x + text_w) - tower_x, 0, text_w), text_h, clamp(text_x, tower_x, 960), 240)
        draw_sprite(spr_voyagelogo_tower, 0, tower_x, 270)
		if array_length(stickerray) != 0
		{
			for (var i = 0; i < array_length(stickerray) - 1; i++)
			{
				var thing = stickerray[i]
				draw_sprite_ext(spr_voyagelogo_sticker, thing.index, 410 + (150 * i), 160, thing.scale, thing.scale, 0, c_white, 1)
				thing.scale = Approach(thing.scale, 1, 0.1)
			}
		}
>>>>>>> Stashed changes
		break
}
		
		