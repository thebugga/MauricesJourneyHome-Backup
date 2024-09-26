draw_set_font(font0)
draw_set_halign(fa_center)
draw_set_color(c_white)
if showingstage >= 6
{
	rank_scale = lerp(rank_scale, 1, 0.1)
	if rank_angle <= 95
		rank_anglesp = Approach(rank_anglesp, 0, 0.5)
	rank_angle += rank_anglesp
	draw_ellipse_color(x - (rank_scale * 50), (y - 175) - (rank_scale * 50), x + (rank_scale * 50), (y - 175) + (rank_scale * 50), ds_map_find_value(rankbg_color, rank), ds_map_find_value(rankbg_color, rank), false)
	draw_ellipse_color(x - (rank_scale * 50), (y - 175) - (rank_scale * 50), x + (rank_scale * 50), (y - 175) + (rank_scale * 50), c_black, c_black, true)
	draw_sprite_ext(spr_ranks_gate, rank, x, y - 175, rank_scale, rank_scale, rank_angle, c_white, 1)
	draw_text(x, y - 200, alarm[2])
}
var spr = asset_get_index(concat(sprite_get_name(sprite_index), "_bg"))
if (spr > -1)
{
	gpu_set_blendmode(bm_normal)
	surface_set_target(gateclip)
	draw_set_alpha(1)
	draw_clear(c_white)
	gpu_set_blendmode(bm_subtract)
	draw_sprite(sprite_index, 1, sprite_xoffset, sprite_yoffset)
	surface_reset_target()
	gpu_set_blendmode(bm_normal)
	surface_set_target(gatesurf)
	for (var i = 0; i < sprite_get_number(spr); i++)
	{
		gatebg_x[i] += ((1 + i) / 2)
		draw_sprite_tiled(spr, i, gatebg_x[i], 0)
	}
	gpu_set_blendmode(bm_subtract)
	draw_surface(gateclip, 0, 0)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
	draw_set_alpha(1)
	draw_surface(gatesurf, x - sprite_xoffset, y - sprite_yoffset)
}
draw_self()
for (var i = 0; i < 5; i++)
{
	var goochling_count = 0
	for (var j = 0; j < 4; j++)
	{
		if goochling[j] == 1
			goochling_count++
	}
	draw_sprite_ext(goochling_count >= 4 ? spr_goochling : spr_goochling_sad, i, x, y - 88, goochlingscale[i], goochlingscale[i], 0, c_white, 1)
	if goochlingscale[i] != 0
		goochlingscale[i] = Approach(goochlingscale[i], 1, 0.1)
}
if showingstage >= 4
{
	highscore_scale = Approach(highscore_scale, 1, 0.025)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(global.collectfont)
	var str = string(highscore)
	var num = string_length(str)
	var w = string_width(str)
	var xx = x - ((w / 2) * highscore_scale)
	var debug_txt = ""
	for (i = 0; i < num; i++)
	{
		highscore_yray[i][1] += 0.5
		highscore_yray[i][0] += highscore_yray[i][1]
		if highscore_yray[i][0] > 0
		{
			highscore_yray[i][0] = 0
			highscore_yray[i][1] = irandom(-5)
		}
		draw_text_transformed(floor(xx), floor((y - 150) + highscore_yray[i][0]), string_char_at(str, i + 1), highscore_scale, highscore_scale, 0)
		xx += ((w / num) * highscore_scale)
	}
}