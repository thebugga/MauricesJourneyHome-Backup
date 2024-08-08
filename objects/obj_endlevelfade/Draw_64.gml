draw_sprite_ext(spr_tutorialbubble, 0, receiptx, 50, (300 / sprite_get_width(spr_tutorialbubble)), (440 / sprite_get_height(spr_tutorialbubble)), 0, c_white, 1)
draw_set_font(global.tutorialfont)
draw_set_valign(fa_top)
var yy = 0
for (var i = 0; i < array_length(text); i++)
{
	var b = text[i]
	if (b[0])
	{
		draw_set_halign(fa_left)
		draw_text_color(receiptx + 20, 270 + (32 * yy), b[1], c_black, c_black, c_black, c_black, 1)
		draw_set_halign(fa_right)
		var money = string(b[2])
		if string_last_pos(".", money) == 0
			money += ".00"
		else if (string_length(string(frac(b[2]))) < 4)
			money += "0"
		draw_text_color(receiptx + 280, 270 + (32 * yy), money, c_black, c_black, c_black, c_black, 1)
		yy++
	}
}
draw_set_font(global.collectfont)
draw_set_halign(fa_middle)
draw_text(receiptx + 150, 220, floor(slowscore))
if showrank
{
	rank = 0
	if (slowscore >= global.srank)
	{
		rank = 4
		if (scr_is_prank())
		{
			showrank = false
			with instance_create(receiptx + 170, 110, obj_fallingHUDface)
			{
				sprite_index = spr_ranks_hud
				image_index = 4
				image_speed = 0
			}
		}
	}
	else if (slowscore >= global.arank)
		rank = 3
	else if (slowscore >= global.brank)
		rank = 2
	else if (slowscore >= global.crank)
		rank = 1
	if prevrank != rank
	{
		prevrank = rank
		rankscale = 3
	}
	draw_sprite_ext(spr_ranks_hud, rank, receiptx + 150, 110, rankscale, rankscale, 0, c_white, 1)
	rankscale = Approach(rankscale, 1.5, 0.1)
}