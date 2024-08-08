if (room == editor_room)
	exit;
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if is_bossroom()
	exit;
if obj_player1.character == "D"
{
	if obj_player1.state == states.Sjump
		jetpack_x = Approach(jetpack_x, 864, 5)
	else
		jetpack_x = Approach(jetpack_x, 1014, 5)
	var _width = sprite_get_width(spr_temperature_meterfill)
	var _height = sprite_get_height(spr_temperature_meterfill)
	var _tmp = (obj_player1.superjumptimer / 200)
	var _height2 = (_height * _tmp)
	draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, 0, _width, _height2, jetpack_x, (192 + _height), 1, -1, c_white, 1)
	draw_sprite(spr_temperature_meter, 0, jetpack_x, 192)
}
var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var tv_x = 0
var tv_y = -54
var _score = global.collect
if global.coop
	_score += global.collectN
var rx = (tv_x + 25)
var ry = (tv_y + 225)
var rank_ix = 0
if (scr_is_prank())
	rank_ix = 5
else if (_score >= global.srank)
	rank_ix = 4
else if (_score >= global.arank)
	rank_ix = 3
else if (_score >= global.brank)
	rank_ix = 2
else if (_score >= global.crank)
	rank_ix = 1
if (previousrank != rank_ix && rank_state == 0)
{
	rank_state = sign(rank_ix - previousrank)
	rank_newx = 50 + (rank_state * 100)
	previousrank = rank_ix
}
var perc = 0
switch rank_ix
{
	case 5:
		perc = 1
	break
	case 4:
	perc = ((global.treasure + global.toppintotal + global.secretfound + global.lap + !global.combodropped) / 11)
	break
	case 3:
		perc = ((_score - global.arank) / (global.srank - global.arank))
	break
	case 2:
		perc = ((_score - global.brank) / (global.arank - global.brank))
	break
	case 1:
		perc = ((_score - global.crank) / (global.brank - global.crank))
	break
	default:
		perc = (_score / global.crank)
}
if abs(rank_state) == 1
{
	rank_x = Approach(rank_x, 50 - (25 * sign(rank_state)), 2.5)
	rank_newx = Approach(rank_newx, 50 + (25 * sign(rank_state)), 7.5)
	rank_xscale = Approach(rank_xscale, 0.5, 0.05)
	rank_yscale = Approach(rank_yscale, 1.5, 0.05)
	if rank_x == 50 - (25 * sign(rank_state))
		 rank_state += sign(rank_state)
}
if abs(rank_state) == 2
{
	rank_x = Approach(rank_x, 50, 2.5)
	rank_newx = Approach(rank_newx, 50 + (100 * sign(rank_state)), 7.5)
	rank_xscale = Approach(rank_xscale, 1, 0.05)
	rank_yscale = Approach(rank_yscale, 1, 0.05)
	if rank_x == 50
		 rank_state += sign(rank_state)
}
if abs(rank_state) == 3
{
	rank_x = Approach(rank_x, 50 - (100 * sign(rank_state)), 5)
	rank_newx = Approach(rank_newx, 50, 5)
	if rank_newx == 50
		 {
			rank_state = 0
			rank_visual = previousrank
			rank_x = 50
			rank_newx = -50
			rank_xscale = 1
			rank_yscale = 1
		 }
}
if (!surface_exists(rank_surf))
    rank_surf = surface_create(100, 100)
if (!surface_exists(rank_clip))
    rank_clip = surface_create(100, 100)
gpu_set_blendmode(bm_normal) 
surface_set_target(rank_clip)
	draw_set_alpha(1)
	draw_clear(c_white)
	gpu_set_blendmode(bm_subtract)
	draw_sprite(spr_ranks_clip, 0, 50, 50)
surface_reset_target()
gpu_set_blendmode(bm_normal)
surface_set_target(rank_surf)
	draw_clear(ds_map_find_value(rankbg_color, rank_ix))
	draw_rectangle_color(0, 100 - (perc * 100), 100, 100, ds_map_find_value(rankbg_color, rank_ix + 1), ds_map_find_value(rankbg_color, rank_ix + 1), ds_map_find_value(rankbg_color, rank_ix + 1), ds_map_find_value(rankbg_color, rank_ix + 1), false)
	draw_sprite(spr_ranks_hud, previousrank, rank_newx, 50)
	draw_sprite_ext(spr_ranks_hud, rank_visual, rank_x, 50, rank_xscale, rank_yscale, 0, c_white, 1)
	gpu_set_blendmode(bm_subtract)
	draw_surface(rank_clip, 0, 0)
	gpu_set_blendmode(bm_normal) 
surface_reset_target()
draw_set_alpha(1)
draw_surface(rank_surf, rx, ry)
if (!surface_exists(tvsurface))
	tvsurface = surface_create(278, 268)
gpu_set_blendmode(bm_normal)
surface_set_target(tvsurface)
	draw_clear_alpha(c_black, 0)
	if cardboardvisual != -4
		draw_sprite_ext(cardboardvisual, 0, 139, cardboardy, 1, 1, 0, c_white, alpha)
	gpu_set_blendmode(bm_subtract)
	draw_sprite(spr_tv_clip, 0, 139, 134)
	gpu_set_blendmode(bm_normal)
surface_reset_target()
shader_set(global.Pal_Shader)
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.patterntexture)
	draw_sprite_ext(sprite_index, image_index, ((tv_x + 139) + collect_x), (((tv_y + 134) + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	if state == states.normal && sprite_index != spr_tv_open
		draw_surface(tvsurface, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY))
	pattern_reset()
	if (state = states.tv_whitenoise)
		draw_sprite_ext(spr_tv_whitenoise, floor(noiseindex), ((tv_x + 139) + collect_x), (((tv_y + 134) + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
reset_shader_fix()
draw_rectangle_color(0, newsy, 960, newsy + 50, c_red, c_red, c_red, c_red, false)
draw_rectangle_color(0, newsy + 50, 960, newsy + 70, c_white, c_white, c_white, c_white, false)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (newsy == 470)
{
	promptx -= promptspd
	if promptx < -(string_width(prompt))
		prompt = ""
}
draw_text_color(promptx, 60 + newsy, prompt, c_black, c_black, c_black, c_black, 1)
draw_set_font(global.creditsfont)
draw_text_color(100, 25 + newsy, headline, c_white, c_white, c_white, c_white, 1)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
if instance_exists(obj_pizzaball)
	draw_text(832, 300, ((string(global.golfhit) + " ") + "GOLF HIT"))
if global.panic
{
	var _fill = global.fill
	var _currentbarpos = (chunkmax - _fill)
	var _perc = (_currentbarpos / chunkmax)
	var _max_x = 299
	var _barpos = (_max_x * _perc)
	if (!surface_exists(bar_surface))
		bar_surface = surface_create(298, 30)
	var _barfillpos = (floor(_barpos) + 13)
	if (_barfillpos > 0)
	{
		surface_resize(bar_surface, _barfillpos, 30)
		surface_set_target(bar_surface)
		draw_clear_alpha(c_black, 0)
		var clip_x = (timer_x + 3)
		var clip_y = (timer_y + 5)
		for (i = 0; i < 3; i++)
			draw_sprite(spr_timer_barfill, 0, (barfill_x + (i * 173)), 0)
		surface_reset_target()
		draw_surface(bar_surface, clip_x, clip_y)
	}
	draw_sprite(spr_timer_bar, -1, timer_x, timer_y)
	draw_sprite(johnface_sprite, johnface_index, ((timer_x + 13) + _barpos), (timer_y + 20))
	draw_sprite(pizzaface_sprite, pizzaface_index, (timer_x + 320), (timer_y + 10))
	var minutes = 0;
	for (var seconds = ceil(global.fill / 12); seconds > 59; seconds -= 60)
		minutes++;
	if (seconds < 10)
		seconds = concat("0", seconds);
	else
		seconds = string(seconds);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(global.bigfont);
	draw_text(timer_x + 153, timer_y + 18, concat(minutes, ":", seconds));
}
if (!ds_list_empty(messagelist))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(global.smallfont);
	if ds_list_size(messagelist) > 5
		ds_list_delete(messagelist, 1)
	for (var i = 0; i < ds_list_size(messagelist); i++)
	{
		var b = ds_list_find_value(messagelist, i)
		{
			draw_set_alpha(b.alpha)
			draw_text(540, (((ds_list_size(messagelist) - 1) * 16) - (16 * i)), b.text)
			draw_set_alpha(1)
			if b.timer > 0
				b.timer--
			else
				b.alpha -= 0.02
			if b.alpha <= 0
			{
				ds_list_delete(messagelist, i)
				i--
				b = undefined
			}
		}
	}
}