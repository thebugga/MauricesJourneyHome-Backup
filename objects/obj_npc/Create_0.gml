depth = -15
image_speed = 0.1
talking = false
padding = 30
text_padding = 20
text_width = 15
text_height = 30
vsp = 0

wave_timer = 0

bubble = {
	x: padding,
	y: -screen_h,
	w: screen_w - (padding * 2),
	h: 0
}

var h_start = bubble.h

state = 0

internal_y = bubble.y

var xx = 0
var prev_i = 1

bg_pos = {
	x: 0,
	y: 0
}

bubble_surf = noone