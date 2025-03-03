if instance_exists(obj_keyconfig)
	exit;
reset_blendmode();
reset_shader_fix();
var ui_index = 0;
if pause
{
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, #ff0000, #ff0000, #800000, #800000, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.creditsfont);
		
		var h = string_height("A");
		var pad = 16;
		var len = array_length(pause_menu);
		var wh = (h * len) + (pad * (len - 1));
		var yy = (SCREEN_HEIGHT / 2) - (wh / 2) + 120;
		var iconspr = spr_rubmybellay;
		for (var i = 0; i < len; i++)
		{
			var b = pause_menu[i];
			var c = c_gray;
			var t = lang_get_value(b);
			if selected == i
			{
				var cx = (SCREEN_WIDTH / 2) - (string_width(t) / 2) - 60;
				if update_cursor
				{
					cursor_x = (cursor_actualx + cursor_x) - cx;
					cursor_y = (cursor_actualy + cursor_y) - yy;
					update_cursor = false;
				}
				cursor_actualx = cx;
				cursor_actualy = yy;
				draw_sprite(iconspr, cursor_index, cx + cursor_x, yy + cursor_y);
				c = c_white;
			}
			tdp_draw_text_color(SCREEN_WIDTH / 2, yy, t, c, c, c, c, fade);
			yy += (h + pad);
		}

	tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	draw_sprite_ext(spr_pause_border, ui_index, 0, SCREEN_HEIGHT, -1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_pause_border, ui_index, SCREEN_WIDTH, SCREEN_HEIGHT, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_pause_vine, ui_index, SCREEN_WIDTH / 2, 0, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_title, ui_index, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 4, 1, 1, 0, c_white, 1);
	
	var lvlsave = global.leveltosave;
	if fade > 0 && lvlsave != -4 && lvlsave != "tutorial"
	{
		draw_sprite_ext(spr_treasurefound_pause, !treasurefound, 80, SCREEN_HEIGHT - 60, 1, 1, 0, c_white, treasurealpha)
		draw_sprite_ext(spr_secretportal_idle, 0, SCREEN_WIDTH - 132, SCREEN_HEIGHT - 124, 1, 1, 0, c_white, secretalpha)
		draw_set_font(global.combofont);
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_text(SCREEN_WIDTH - 132 - 60, SCREEN_HEIGHT - 124 - 8, concat(secretcount, "/3"));
	}
	if (transfotext != noone)
	{
		draw_set_alpha(fade);
		draw_set_font(global.creditsfont);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		var xx = SCREEN_WIDTH / 2;
		yy = SCREEN_HEIGHT - 50;
		var s = transfotext_size;
		xx -= (s[0] / 2);
		yy -= s[1];
		xx = floor(xx);
		yy = floor(yy);
		global.tdp_text_try_outline = true;
		scr_draw_text_arr(xx, yy, transfotext, c_white, fade);
		global.tdp_text_try_outline = false;
		tdp_text_commit(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		draw_set_alpha(1);
	}
	pause_draw_priests();
}
