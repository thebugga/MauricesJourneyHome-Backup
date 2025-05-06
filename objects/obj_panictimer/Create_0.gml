global.panic = {
	active: false,
	timer: 0,
	timer_max: 0
}

global.lap = {
	active: false,
	inflap: false,
}

filler_sprites = [spr_timer_collysia, spr_timer_collysia, spr_timer_platfelix]
filler = {
	image_index: 0,
	image_speed: 0.35
}

pizzaface = {
	sprite_index: spr_timer_pizzaface_sleep,
	image_index: 0,
	image_speed: 0.35
}

showtime_buffer = 0

xstart = 0
x = xstart - 400
y = screen_h - 134

depth = -200
