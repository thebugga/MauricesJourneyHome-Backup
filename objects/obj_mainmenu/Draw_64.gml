if instance_exists(obj_option)
	exit
ini_open(concat("saves/saveData", saveselect, ".ini"))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.creditsfont)
switch state
{
	case states.actor:
		for (var m = 0; m < 4; m++)
			draw_text(120 + (240 * m), 500 + (irandom_range(-1, 1) * (m == menuselect)), lang_get_value(menu[m][0]))
			break
	case states.gameover:
		draw_clear(c_black)
		global.tdp_text_try_outline = true;
		scr_draw_text_arr(480, 270, scr_compile_icon_text(scr_separate_text(lang_get_value("menu_uniquequit1"), 960)));
		global.tdp_text_try_outline = false;
		tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		break
	case states.transitioncutscene:
		if flicker
			draw_text(120, 500, lang_get_value(menu[0][0]))
		break
	case states.normal:
	case states.transition:
		if flicker
			draw_text(480, 200, concat("File ", saveselect))
		for (var i = 0; i < array_length(character); i++)
		{
			var c = character[i]
			if c[0]
			{
				c[4] = lerp(c[4], 0, 0.25)
				c[5] = lerp(c[5], 0, 0.25)
			}
			else
			{
				if ini_read_real("Cutscene", c[1], 0)
				{
					c[4] = lerp(c[4], 0, 0.25)
					c[5] = lerp(c[5], 0, 0.25)
				}
				else
				{
					c[4] = lerp(c[4], c[2], 0.25)
					c[5] = lerp(c[5], c[3], 0.25)
				}
			}
			draw_sprite(spr_title_characters, i, c[4], c[5])
		}
		if file_exists(concat("saves/saveData", saveselect, ".ini"))
		{
			var stages = [["graveyard", "wizard", "temple", "school"], ["mountain", "water", "city", "spaghetti"], ["train", "centre", "studio", "cruise"], ["circus", "arcade", "hardware", "space"], ["fallout", "farm", "mansion", "forest"]]
			for (var xx = 0; xx < array_length(stages); xx++)
			{
				for (var yy = 0; yy < array_length(stages[xx]); yy++)
				{
					var _color = (ini_read_real("Highscore", stages[xx][yy], 0) ? c_white : c_black)
					draw_sprite_ext(spr_pizzacoin, -1, 416 + (32 * yy), 270 + (32 * xx), 1, 1, 0, _color, 1)
				}
			}
		}
		draw_set_font(global.combofont)
		draw_sprite(spr_title_collysia, perstatus_icon, 600, 270)
		draw_shaking_text(360, 270, percvisual, percvisual / 50)
		break
}
ini_close()