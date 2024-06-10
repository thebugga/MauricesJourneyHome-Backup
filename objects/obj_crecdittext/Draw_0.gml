font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(460, 32, "THANKS FOR PLAYING!", 0.6, 0.6, 0);
