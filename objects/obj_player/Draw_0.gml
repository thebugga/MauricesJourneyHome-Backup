image_blend = c_white
if character == p_characters.mandrek && sjumptimer > 0
{
	get_input()
	var fader = min(sjumptimer, 10) / 20
	var yy = 0
	var speeder = sjumptimer
	while (speeder > 0)
	{
		speeder -= key_down.down ? 0.25 : 0.875
		yy -= speeder
	}
	draw_sprite_ext(spr_mandrek_jump, 0, x, y + yy, xscale * visual_size, image_yscale * visual_size, image_alpha, image_blend, fader)
}

var xx = x
var yy = y
var bb = bbox_top

if hitstun > 0
{
	var range = 5
	xx += irandom_range(-range, range)
	yy += irandom_range(-range, range)
	bb += (yy - y)
}

if sprite_index == spr_exitdoor
	image_blend = make_color_hsv(0, 0, (1 - ((image_number - image_index) / image_number)) * 255)

image_alpha = 1

if (i_frames > 0 && state != states.hurt && state != states.fireass)
	image_alpha = round(wave(0, 1, 0.01, 0))

var sprite = sprite_index
var index = image_index
if overwriteanim != -4
{
	sprite = overwriteanim
	index = overwriteindex
	overwriteindex += 0.35
	if overwriteindex >= sprite_get_number(overwriteanim)
		overwriteanim = -4
}

pattern_draw(sprite, index, xx, yy, pattern_spr, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)

pal_swap_set(spr_palette, pal_select, false)
if sprite != noone && sprite != -1
	draw_sprite_ext(sprite, index, xx, yy, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)
pal_swap_reset()

if hat_spr != -4
	draw_sprite_ext(hat_spr, 0, xx, bb, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)

if flash > 0
{
	shader_set(shd_flash)
	if sprite != noone && sprite != -1
		draw_sprite_ext(sprite, index, xx, yy, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)
	if hat_spr != -4
		draw_sprite_ext(hat_spr, 0, xx, bb, xscale * visual_size, image_yscale * visual_size, rotation, image_blend, image_alpha)
	shader_reset()
}

if has_pistol && (pistolcharge > 0)
    draw_sprite(spr_revolvercharge, pistolcharge, x, (y - 70))

if ds_list_find_index(transformation_list, state) != -1
{
	draw_text(x, y, "Transformed")
}

if state == states.wizardgrapple && sprite == spr_wizardwindup
{
	draw_sprite(spr_oldpizzabox, 0, x + (lengthdir_x(40, wizardthrowangle - 90) * xscale), y + lengthdir_y(40, wizardthrowangle - 90))
}