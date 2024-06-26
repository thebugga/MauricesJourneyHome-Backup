
if (room == titscreen2)
    return;
var tv_x = 832
var tv_y = 90
var _cx = 832
var _cy = (((tv_y + 117) + hud_posY) + combo_posY)
var _perc = (global.combotime / 60)
var _minX = (_cx - 56)
var _maxX = (_cx + 59)
combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
combofill_y = _cy
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
var hud_xx = 129 + (irandom_range((-collect_shake), collect_shake))
var hud_yy = 90 + (irandom_range((-collect_shake), collect_shake)) + hud_posY
	var rx = hud_xx;
	var ry = hud_yy - 122;
	var rank_ix = 0;
    var cmb = 0
    if (global.combo >= 50)
        cmb = 2
    else if (global.combo >= 25)
        cmb = 1
	    pizzascore_index += (0 + 0.25 * cmb)
    if (pizzascore_index > (pizzascore_number - 1))
        pizzascore_index = 0 + frac(pizzascore_index)
    if (global.stylethreshold <= 0)
    {
        if (floor(pizzascore_index) != 0)
            pizzascore_index += 0.35
        else
            pizzascore_index = 0
    }
draw_sprite_ext(spr_pizzascore, pizzascore_index, 832, hud_yy, 1, 1, 0, c_white, alpha)
draw_sprite_ext(spr_ranks_hud, 1, 90, 260, 1, 1, 0, c_white, alpha)
rank_scale = Approach(rank_scale, 1, 0.2);
	var spr_w = sprite_get_width(spr_pizzascore);
	var spr_h = sprite_get_height(spr_pizzascore);
	var spr_xo = sprite_get_xoffset(spr_pizzascore);
	var spr_yo = sprite_get_yoffset(spr_pizzascore);
    switch floor(pizzascore_index)
    {
        case 1:
        case 2:
        case 3:
            text_y = 1
            break
        case 5:
        case 10:
            text_y = -1
            break
        case 6:
        case 9:
            text_y = -2
            break
        case 7:
            text_y = -3
            break
        case 8:
            text_y = -5
            break
    }
    var cs = 0
    with (obj_comboend)
        cs += comboscore
    with (obj_particlesystem)
    {
        for (var i = 0; i < ds_list_size(global.collect_list); i++)
            cs += ds_list_find_value(global.collect_list, i).value
    }
    var _score = global.collect
    var sc = _score - global.comboscore - cs
    if (sc < 0)
        sc = 0
    draw_set_font(global.collectfont)
    var text_y = 0
    var str = string(sc)
    var num = string_length(str)
    var w = string_width(str)
    var xx = 854 - w / 2
    for (i = 0; i < num; i++)
    {
        var yy = (((i + 1) % 2) == 0 ? -5 : 0)
        var c = color_array[i]
        pal_swap_set(spr_font_palette, c)
        draw_text(floor(xx), floor(hud_yy - 56 + text_y + yy), string_char_at(str, (i + 1)))
        xx += (w / num)
    }
if (global.panic)
{
shader_set(shd_panicbg)
shader_reset()
	font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
    draw_set_font(font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
	draw_text(0,540,"https://discord.gg/buw4cYDEYT")
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




global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-+", true, 0)
if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, (448), 123, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
    promptsurface = surface_create(248, 490)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (bubblespr == spr_tv_bubble)
{
    promptx -= promptspd
    if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
    {
        bubblespr = spr_tv_bubbleclose
        prompt = ""
        bubbleindex = 0
    }
    draw_text_color((promptx - 350), 110, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, (960 - 610), 0)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)






draw_sprite_ext(spr_hudthing, -1, 129, 90, 1, 1, 1, c_white, alpha)
    if (obj_player.y < 200 && obj_player.x < 200)
        alpha = 0.5
    else
        alpha = 1
    font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
    draw_set_font(font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    if (global.panic == 1)
    {
        if (global.seconds < 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red)
            else
                draw_set_color(c_white)
            draw_text(((random_range(1, -1)) + 480), ((random_range(1, -1)) + 65), string_hash_to_newline(string(global.minutes) + ":0" + string(global.seconds)))
        }
        else if (global.seconds >= 10)
        {
            if (global.minutes == 0 && global.seconds <= 30)
                draw_set_color(c_red)
            else
                draw_set_color(c_white)
            draw_text(((random_range(1, -1)) + 480), ((random_range(1, -1)) + 65), string_hash_to_newline(string(global.minutes) + ":" + string(global.seconds)))
        }
    }
global.combofont = font_add_sprite_ext(spr_combofont, "0123456789/:", 1, 0)
draw_set_font(global.combofont)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
var _tx = (_cx - 64)
var _ty = (_cy - 12)
var _str = string(visualcombo)
var num = string_length(_str)
		
	font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0)
    draw_set_font(font)
    draw_set_halign(fa_center)
    draw_set_color(c_white)