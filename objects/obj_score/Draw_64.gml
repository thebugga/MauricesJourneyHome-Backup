if !visible
	exit;

depth = -200

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

draw_sprite(spr_pizzascore, 0, x + irandoms_x, y + irandoms_y)

var num = global.score

var igred_offsets = [18, 28, 6, 6, 6, 0]
var igred_offset = 0

for (var i = max(4 - rank_ix, 0); i < 4; i++)
{
	draw_sprite(spr_pizzascore, i + 1, x + irandoms_x, y + irandoms_y - igred_offset - igred_offsets[0])
	igred_offset += igred_offsets[i + 1]
}

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
	draw_text(floor(xx) + irandoms_x, floor(y + yy) + irandoms_y - igred_offset, string_char_at(str, i + 1))
	xx += (w / num)
}

draw_sprite(spr_pizzascore, 5, x + irandoms_x, y + irandoms_y - igred_offset - string_height("0"))

var r_pos = {
	x: x - 202,
	y: y - 122
}

if (previousrank != rank_ix && rank_state == 0)
{
    if (rank_ix > previousrank)
	{
		var snd = global.snd_rankup
		var stater = previousrank
	}
	else
	{
		snd = global.snd_rankdown
		stater = rank_ix
	}
	
	fmod_studio_event_instance_start(snd);
	fmod_studio_event_instance_set_parameter_by_name_multiplatform(snd, "state", stater, true);
    rank_state = sign(rank_ix - previousrank)
    rank_newx = 50 + rank_state * 100
    previousrank = rank_ix
}

var perc = 0
if rank_ix == 5 //if the rank is above an s set the percentage to 100%
	perc = 1
else if rank_ix == 4
{
	var nowgooch = 0
	for (var i = 0; i < 5; i++)
		nowgooch += global.level_data.goochlings[i]
	
	perc = (global.level_data.treasure + nowgooch + global.level_data.secret_count + global.lap.active + !global.combo.wasted) / 11
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