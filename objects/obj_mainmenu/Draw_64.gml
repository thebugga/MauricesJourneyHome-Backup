if instance_exists(obj_option)
	exit
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(global.creditsfont)
switch state
{
	case states.actor:
		draw_text(480, 500, "Press Start")
		break
	case states.transitioncutscene:
		if flicker
			draw_text(480, 500, "Press Start")
		break
	case states.normal:
	case states.transition:
		if flicker
			draw_text(480, 200, concat("File ", saveselect))
		draw_sprite(spr_controlseggplant, 0, 800 + irandom_range(-1, 1), 100 + irandom_range(-1, 1))
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
				if quick_ini_read_real(concat("saveData", saveselect, ".ini"), "Cutscene", c[1], 0)
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
					var _color = (quick_ini_read_real(concat("saveData", saveselect, ".ini"), "Highscore", stages[xx][yy], 0) ? c_white : c_black)
					draw_sprite_ext(spr_pizzacoin, -1, 416 + (32 * yy), 270 + (32 * xx), 1, 1, 0, _color, 1)
				}
			}
		}
		draw_set_font(global.combofont)
		draw_sprite(spr_title_collysia, perstatus_icon, 600, 270)
		draw_text(360, 270, percvisual)
		break
}