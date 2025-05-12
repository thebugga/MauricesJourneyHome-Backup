if (!global.panic.active)
	exit;

var currentbarpos = global.panic.timer_max - global.panic.timer
var perc = currentbarpos / global.panic.timer_max
var max_x = 135
var barpos = max_x * perc


if (global.panic.timer <= 0 && pizzaface.sprite_index != spr_timer_pizzaface_wake)
{
	pizzaface.sprite_index = spr_timer_pizzaface_wake
	pizzaface.image_index = 0
	pizzaface.image_speed = 0.35
	showtime_buffer = 200
}

filler.image_index += filler.image_speed // didnt work with a with statement, shit code it is
if filler.image_index >= 22
	filler.image_index = 0

if pizzaface.sprite_index == spr_timer_pizzaface_sleep
	pizzaface.image_speed = 0.35

pizzaface.image_index += pizzaface.image_speed
if pizzaface.image_index >= sprite_get_number(pizzaface.sprite_index) - 1
{
	if pizzaface.sprite_index == spr_timer_pizzaface_sleep
		pizzaface.image_index = 0
	else
	{
		pizzaface.image_index = sprite_get_number(pizzaface.sprite_index) - 1
		pizzaface.image_speed = 0
	}
}

draw_self()
draw_sprite(filler_sprites[image_index], filler.image_index, (x + 41) + barpos, y + 60)
draw_sprite(pizzaface.sprite_index, pizzaface.image_index, x + 224, y + 62)

draw_set_font(global.generic_font)
draw_reset_color()
draw_set_align(fa_center, fa_middle)

var minutes = 0
for (var seconds = ceil(global.panic.timer / 12); seconds > 59; seconds -= 60)
	minutes++

if (seconds < 10)
	seconds = string_concat("0", seconds)
else
	seconds = string(seconds)

draw_text(x + 123, y + 72, string_concat(minutes, ":", seconds))
