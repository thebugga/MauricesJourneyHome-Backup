draw_set_halign(fa_center)
draw_set_color(c_white)
if showingstage >= 6
{
	rank_scale = lerp(rank_scale, 1, 0.1)
	if rank_angle <= 95
		rank_anglesp = approach(rank_anglesp, 0, 0.5)
	rank_angle += rank_anglesp
	draw_ellipse_color(x - (rank_scale * 50), (y + rankoffset) - (rank_scale * 50), x + (rank_scale * 50), (y + rankoffset) + (rank_scale * 50), ds_map_find_value(rankbg_color, save_data.rank), ds_map_find_value(rankbg_color, save_data.rank), false)
	draw_ellipse_color(x - (rank_scale * 50), (y + rankoffset) - (rank_scale * 50), x + (rank_scale * 50), (y + rankoffset) + (rank_scale * 50), c_black, c_black, true)
	draw_sprite_ext(spr_ranks_gate, save_data.rank, x, y + rankoffset, rank_scale, rank_scale, rank_angle, c_white, 1)
	for (var i = 0; i < array_length(stinkshinearray); i++)
	{
		var mysunshine = stinkshinearray[i]
		draw_sprite_ext(mysunshine.sprite, mysunshine.index, mysunshine.x, mysunshine.y, 1, 1, 0, c_white, mysunshine.sprite == spr_rank_stink ? mysunshine.alpha : 1)
		if mysunshine.sprite == spr_rank_stink
		{
			mysunshine.y += mysunshine.ysp
			mysunshine.alpha -= 0.05
			if mysunshine.alpha <= 0
			{
				array_delete(stinkshinearray, i, 1)
				i--
			}
		}
		else
		{
			mysunshine.index += 0.35
			if mysunshine.index >= sprite_get_number(mysunshine.sprite)
			{
				array_delete(stinkshinearray, i, 1)
				i--
			}
		}
		
	}
}

if !surface_exists(bg_surf)
	bg_surf = surface_create(sprite_get_width(door_gate), sprite_get_height(door_gate))

if surface_exists(bg_surf)
{
	surface_set_target(bg_surf)
	
	draw_clear_alpha(c_black, 0)
	
	for (var i = 0; i < array_length(bg_parallax); i++) //draw each layer
		draw_sprite_tiled(door_bg, i, bg_parallax[i].x, sprite_get_height(door_gate))
	
	gpu_set_blendmode(bm_subtract)
	draw_sprite(subtract_spr, 1, 0, 0) // subtract the masking from the drawing 
	gpu_set_blendmode_cc(bm_normal)
	
	surface_reset_target()
	draw_surface(bg_surf, x - sprite_get_xoffset(door_gate), y - sprite_get_yoffset(door_gate))
}

draw_sprite(door_gate, 0, x, y)

var a = distance_to_object(obj_player) / 200
draw_sprite_ext(door_gate, 1, x, y, 1, 1, 0, c_white, a)

if save_exists
{
	for (var i = 0; i < save_data.secret_count; i++)
	    draw_sprite(spr_secretportal_enter, 10, x - 150, bbox_top + (i * 50))
}

for (var i = 0; i < 5; i++)
{
	var goochling_count = 0
	for (var j = 0; j < 4; j++)
	{
		if save_data.goochling[j] == 1
			goochling_count++
	}
	draw_sprite_ext(goochling_count >= 4 ? spr_goochlings : spr_goochlings_sad, i, x, y + goochoffset, goochlingscale[i], goochlingscale[i], 0, c_white, 1)
	if goochlingscale[i] != 0
		goochlingscale[i] = approach(goochlingscale[i], 1, 0.1)
}
if showingstage >= 4
{
	highscore_scale = approach(highscore_scale, 1, 0.025)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	draw_set_font(global.scorefont)
	var str = string(save_data.score_num)
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