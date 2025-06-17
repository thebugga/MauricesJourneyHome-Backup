if room != mainmenu
{
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_reset_color()
}

logoalpha = approach(logoalpha, state == 2 || instance_exists(obj_manual) ? 0.25 : 1, 0.05)

if state != 0
	draw_sprite_ext(spr_logo, 0, screen_w / 2, 144, 1, 1, 0, c_white, logoalpha)

ini_open(concat("saves/saveData", saveselect, ".ini"))
draw_set_align(fa_center, fa_middle, c_white)
draw_set_font(global.generic_font)

switch state
{
	case 1:
		if !instance_exists(obj_options) && !instance_exists(obj_manual)
		{
			for (var m = 0; m < array_length(menu); m++)
				draw_text(screen_w / 2, (screen_h / 2) + 32 + (string_height("M") * m), menu[m][0])
			draw_sprite(spr_cursor, 0, (screen_w / 2) - (string_width(menu[menuselect][0]) / 2), (screen_h / 2) + 40 + (string_height("M") * menuselect))
		}
		break
	case 2:
		draw_set_font(global.creditsfont)
		draw_text(screen_w / 2, (screen_h / 2) - 70, concat("File ", saveselect))
		for (var i = 0; i < array_length(character); i++)
		{
			var c = character[i]
			
			with c
			{
				if saveneeded && !ini_read_real("Cutscene", savename, false)
				{
					x = lerp(x, screen_w * in_x, 0.25)
					y = lerp(y, screen_h * in_y, 0.25)
				}
				else
				{
					x = lerp(x, screen_w * out_x, 0.25)
					y = lerp(y, screen_h * out_y, 0.25)
				}
				
				
				
				if sprite == sprite_set.idle || sprite == sprite_set.select
				{
					index = wrap(sprite_get_number(sprite), index + 0.35)
					if timer > 0
						timer--
					else
					{
						if sprite != sprite_set.select
						{
							sprite = choose(sprite_set.anim1, sprite_set.anim2, sprite_set.anim3)
							index = 0
						}
						timer = irandom(250)
					}
				}
				else
				{
					index += 0.35
					if index >= sprite_get_number(sprite)
						sprite = sprite_set.idle
				}
				
				if pat_spr != -4
					pattern_draw(sprite, index, x, y, pat_spr)
			
				pal_swap_set(obj_player.spr_palette, pal_ix, false)
				draw_sprite(sprite, index, x, y)
				shader_reset()
			}
		}
		if file_exists(concat("saves/saveData", saveselect, ".ini"))
		{
			var stages = [["graveyard", "wizard", "trench", "chili"]]
			for (var xx = 0; xx < array_length(stages); xx++)
			{
				for (var yy = 0; yy < array_length(stages[xx]); yy++)
				{
					var _color = (ini_section_exists(stages[xx][yy]) ? c_white : c_black)
					draw_sprite_ext(spr_sausagecollect, 0, (screen_w / 2 - 64) + (32 * yy), screen_h / 2 + (32 * xx), 1, 1, 0, _color, 1)
				}
			}
		}
		draw_set_font(global.combo.font)
		draw_sprite(spr_title_percent, perstatus_icon, (screen_w / 2 + 120), screen_h / 2)
		draw_text((screen_w / 2 - 120), screen_h / 2, percvisual)
		break
	case 3:
		draw_clear(c_black)
		draw_set_font(global.creditsfont)
		draw_special_text(screen_w / 2, screen_h / 2, scr_separate_text("Are you sure about this? This is a DOOM reference, we love DOOM. Press [A] if you're a little pussy bitch, or [R] if you're a real guys guy.", screen_w))
		break
}
ini_close()
draw_reset_color()