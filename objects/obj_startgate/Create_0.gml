bg_surf = -1
image_speed = 0
depth = 20

bg_parallax = []


for (var i = 0; i < array_length(speed_array); i++) 
{
	var s = {
		spd: speed_array[i],
		x: 0
	}
	
    array_push(bg_parallax, s)
}

#region create masking effect

//i feel like drawing inside a create event might be bad, but it works
var s = surface_create(sprite_get_width(door_gate), sprite_get_height(door_gate))

surface_set_target(s)

draw_clear(c_white)

gpu_set_blendmode(bm_subtract)
draw_sprite(door_gate, 1, sprite_get_xoffset(door_gate), sprite_get_yoffset(door_gate)) // subtract the masking from the drawing 
gpu_set_blendmode_cc(bm_normal)

surface_reset_target()

subtract_spr = sprite_create_from_surface(s, 0, 0, sprite_get_width(door_gate), sprite_get_height(door_gate), false, false, 0, 0)

surface_free(s)

#endregion

save_data = {
	score_num: 0,
	secret_count: 0,
	rank: 0,
	goochling: [0, 0, 0, 0, 0]
}

save_exists = false
spanwed_score = false

msgy = 540
highscore_yray = 0
color_array = 0
highscore_scale = 0
goochoffset = -216
goochlingscale = array_create(5, 0)
rankoffset = -303
rank_scale = 0
rank_angle = 365
rank_anglesp = -10
rankbg_color = ds_map_create()
ds_map_set(rankbg_color, 0, #a0b8d8)
ds_map_set(rankbg_color, 1, #c8f8a8)
ds_map_set(rankbg_color, 2, #98e8f8)
ds_map_set(rankbg_color, 3, #eaad9c)
ds_map_set(rankbg_color, 4, #f8f8a8)
ds_map_set(rankbg_color, 5, #f8a0f8)
showingstage = 0

stinkshinearray = []