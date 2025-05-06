if !visible
	exit;

depth = -200

pal_swap_set(pal_combo, global.combo.wasted ? 1 : 2, false)
draw_sprite(spr_tv_c_ghost, combo.ghost.image_index, x + combo.ghost.x, y + combo.ghost.y + 97)
pal_swap_reset()

draw_sprite(spr_tv_c_bubble, 0, x + combo.x, y + combo.y + 97)

var _tx = x + combo.x - 64
var _ty = y + combo.y + 85
draw_set_align(fa_left, fa_top)
draw_reset_color()
draw_set_font(global.combo.font)

var _str = string(global.combo.count)
var num = string_length(_str)

for (var i = num; i > 0; i--)
{
	var char = string_char_at(_str, i)
	draw_text(_tx, _ty, char)
	_tx -= 22
	_ty -= 8
}

var num = global.score

var rank_ix = 0
var ranks = [
	global.rank_milestones.c,
	global.rank_milestones.b,
	global.rank_milestones.a,
	global.rank_milestones.s
]

var s = global.score + obj_generichandler.combo_score

if (s >= global.rank_milestones.s && check_p_rank())
	rank_ix = 5
else
{
	for (var i = 4; i >= 1; i--) 
	{
		if s >= ranks[i - 1]
		{
			rank_ix = i
			break;
		}
	}
}

draw_set_align(fa_left, fa_bottom)

var irandoms_x = irandom_range(shake_mag, -shake_mag)
var irandoms_y = irandom_range(shake_mag, -shake_mag)

draw_sprite(spr_pizzascore, image_index, x + irandoms_x, y + irandoms_y)

var num = global.score

var text_offsets = [0, 1, 1, 1, 0, -1, -2, -3, -5, -2, -1, 0]

var text_offset = text_offsets[image_index]

for (var i = 0; i < min(rank_ix, 4); i++)
	draw_sprite(spr_pizzascore_toppings, i, x + irandoms_x, y + text_offset + irandoms_y)

draw_set_font(global.scorefont)
draw_reset_color()

var arr = obj_collect_got_visual.collects

for (var i = 0; i < array_length(arr); i++) 
{
	var c_id = arr[i]
	num -= c_id.val
}

var str = string(num)
var num = string_length(str)
var w = string_width(str)
var xx = x - (w / 2)

/*if lastcollect != sc
{
	color_array = array_create(num, 0)
	for (i = 0; i < array_length(color_array); i++)
		color_array[i] = choose(irandom(3))
	lastcollect = sc
}

shader_set(global.Pal_Shader)
draw_set_alpha(alpha)*/

var text_y = 0;

for (var i = 0; i < num; i++)
{
	var yy = (((i + 1) % 2) == 0) ? -5 : 0
	//var c = color_array[i]
	//pal_swap_set(spr_font_palette, c, false)
	draw_text(floor(xx) + irandoms_x, floor((y) + text_y + yy) + irandoms_y, string_char_at(str, i + 1))
	xx += (w / num)
}

var rank_ix = 0

var r_pos = {
	x: x - 202,
	y: y - 52
}

var ranks = [
	global.rank_milestones.c,
	global.rank_milestones.b,
	global.rank_milestones.a,
	global.rank_milestones.s
]

var s = global.score + obj_generichandler.combo_score

if (s >= global.rank_milestones.s && check_p_rank())
	rank_ix = 5
else
{
	for (var i = 4; i >= 1; i--) 
	{
		if s >= ranks[i - 1]
		{
			rank_ix = i
			break;
		}
	}
}

if (previousrank != rank_ix && rank_state == 0)
{
    if (rank_ix > previousrank)
		var snd = $"sfx_rankup{rank_ix}"
	else
		snd = $"sfx_rankdown{5 - rank_ix}"
	scr_sound(asset_get_index(snd))
    rank_state = sign(rank_ix - previousrank)
    rank_newx = 50 + rank_state * 100
    previousrank = rank_ix
}

var perc = 0
if rank_ix == 5 //if the rank is above an s set the percentage to 100%
	perc = 1
else if rank_ix == 4
{
	var toppincount = 0
	var t = global.level_data.toppins
	var toppin_list = [t.shroom, t.cheese, t.tomato, t.sausage, t.pineapple]
	
	for (var ii = 0; ii < 5; ii++)
	{
		if toppin_list[ii] == true
			toppincount++
	}
	
	perc = (global.level_data.treasure + toppincount + global.level_data.secret_count + global.lap.active + !global.combo.wasted) / 11
}
else if rank_ix == 0 //or if the rank is above a d set the percentage to the score divided by the next rank milestone, c
	perc = global.score / global.rank_milestones.c
else //otherwise --------------------------------------------------------------------------v
	perc = (global.score - ranks[rank_ix - 1]) / (ranks[rank_ix] - ranks[rank_ix - 1]) //set the percentage to the distance of the score and the previous rank milestone divided by the distance between the current rank milestone and the last

if abs(rank_state) == 1
{
	rank_x = approach(rank_x, 50 - (25 * sign(rank_state)), 2.5)
	rank_newx = approach(rank_newx, 50 + (25 * sign(rank_state)), 7.5)
	rank_xscale = approach(rank_xscale, 0.5, 0.05)
	rank_yscale = approach(rank_yscale, 1.5, 0.05)
	if rank_x == 50 - (25 * sign(rank_state))
		 rank_state += sign(rank_state)
}
if abs(rank_state) == 2
{
	rank_x = approach(rank_x, 50, 2.5)
	rank_newx = approach(rank_newx, 50 + (100 * sign(rank_state)), 7.5)
	rank_xscale = approach(rank_xscale, 1, 0.05)
	rank_yscale = approach(rank_yscale, 1, 0.05)
	if rank_x == 50
		 rank_state += sign(rank_state)
}
if abs(rank_state) == 3
{
	rank_x = approach(rank_x, 50 - (100 * sign(rank_state)), 5)
	rank_newx = approach(rank_newx, 50, 5)
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
draw_surface(rank_surf, r_pos.x, r_pos.y)