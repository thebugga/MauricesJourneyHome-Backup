enum tv_states {
	off,
	normal,
	transition,
	expr
}

pattern_init()

image_speed = 0.35
x = 115
y = 98
depth = -200
xstart = x
ystart = y

expr_sprite = spr_tv_mach3
state_togo = tv_states.expr
state = tv_states.off
idletimer = 240

tvsurface = surface_create(278, 268)
cardboardtimer = 0
cardboardindex = -4
cardboardvisual = -4
cardboardy = 402


combo = {
	sprite: spr_combo_arms_trans,
	index: 0,
	speedd: 0.35,
	angle: 0,
}

messagelist = ds_list_create()