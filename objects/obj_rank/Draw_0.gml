draw_sprite_tiled_ext(bg_secret, 5, bg_x, bg_y, 1, 1, c_white, bg_alpha)

var c_pos = {
	x: obj_camera.campos.x,
	y: obj_camera.campos.y,
}

if state == 0
{
	draw_set_alpha(white_fade_alpha)
	draw_set_color(c_white)
	draw_rectangle(c_pos.x, c_pos.y, c_pos.x + screen_w, c_pos.y + screen_h, false)
	draw_set_alpha(1)
}

if (state != 0 && state < 3)
{
	pattern_draw(sprite_index, image_index, x, y, obj_player.pattern_spr)
	pal_swap_set(pal_peppino, obj_player.pal_select, false)
	draw_self()
	pal_swap_reset()
}

if state >= 2
{
	for (i = 0; i < array_length(results); i++) 
	{
		var cur_result = results[i]
	    if cur_result[2] == true //visible
		{
			draw_set_align(fa_left, fa_bottom)
			draw_set_font(global.smallfont)
			draw_set_color(c_white) //                                  info name               float
			draw_text(10, (screen_h - 10) - (string_height("M") * i), string_concat(cur_result[0], string(cur_result[1])))
		}
	}
}



draw_sprite_ext(spr_dialogue_bubble, 0, receiptx, 50, (300 / sprite_get_width(spr_dialogue_bubble)), (440 / sprite_get_height(spr_dialogue_bubble)), 0, c_white, 1)
draw_set_font(global.tutorialfont)
draw_set_valign(fa_top)
var yy = 0
for (var i = 0; i < array_length(texters); i++)
{
	var b = texters[i]
	if (b[0])
	{
		draw_set_halign(fa_left)
		draw_text_color(receiptx + 20, 270 + (32 * yy), b[1], #88a8c8, #88a8c8, #88a8c8, #88a8c8, 1)
		draw_set_halign(fa_right)
		var money = string(b[2])
		if string_last_pos(".", money) == 0
			money += ".00"
		else if (string_length(string(frac(b[2]))) < 4)
			money += "0"
		draw_text_color(receiptx + 280, 270 + (32 * yy), money, #88a8c8, #88a8c8, #88a8c8, #88a8c8, 1)
		yy++
	}
}
draw_set_font(global.scorefont)
draw_set_halign(fa_center)
draw_text(receiptx + 150, 220, floor(rank_score))
if showrank
{
	var rank_index = calculate_rank(rank_score)
	
	if rank_index >= 4 && rank_ix == 5
	{
		showrank = false
		with instance_create_depth(receiptx + 170, 110, depth - 2, obj_enemycorpse)
			{
				sprite_index = spr_ranks_hud
				image_index = 4
				image_speed = 0
				image_xscale = 1.5
				image_yscale = 1.5
	            hsp = irandom_range(-3, 3)
	            vsp = irandom_range(-6, -11)
			}
	}

	if prevrank != rank_index
	{
		prevrank = rank_index
		rankscale = 3
	}
	draw_sprite_ext(spr_ranks_hud, rank_index, receiptx + 150, 110, rankscale, rankscale, 0, c_white, 1)
	rankscale = approach(rankscale, 1.5, 0.1)
}