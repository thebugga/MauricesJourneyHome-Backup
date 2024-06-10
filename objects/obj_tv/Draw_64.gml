font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
draw_set_font(font)
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_sprite_ext(tvsprite, -1, 715, 3, 1, 1, 1, c_white, alpha)
draw_text(xi, yi, string_hash_to_newline(message))

if (global.panic)
{
shader_set(shd_panicbg)
shader_reset()
	font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
    draw_set_font(font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text((random_range(1, -1) + 480), (random_range(1, -1) + 480), string_hash_to_newline(((string(global.minutes) + ":") + string(global.seconds))))
    if (global.panic == 1)
    {
        if (global.seconds < 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red)
            else
                draw_set_color(c_white)
        }
        else if (global.seconds >= 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red)
            else
                draw_set_color(c_white)
        }
    }
}