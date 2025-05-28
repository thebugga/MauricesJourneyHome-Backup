xstart = 0
y = screen_h - 134
image_index = obj_player.character

if (global.panic.active && !global.secret)
{
	global.panic.timer = max(global.panic.timer - 0.2, 0)

	if global.panic.timer <= 0
	{
		if !instance_exists(obj_pizzaface)
		{
			instance_create(obj_player.x, obj_player.y, obj_pizzaface)
			event_play_oneshot("event:/sfx/pizzaface/laugh")
		}
	}

	if (global.panic.timer % 12 == 1 && global.score > 0)
		decrease_score(5)
	
	shake_camera(1)
}

if (global.panic.active && global.panic.timer > 0)
{
	if global.secret || (obj_player.x < 400 && obj_player.y > room_height - 150)
		x = approach(x, xstart - 400, 4)
	else
		x = approach(x, xstart, 2)
}
else if global.panic.active
{
	if (showtime_buffer > 0 && pizzaface.sprite_index == spr_timer_pizzaface_wake)
		showtime_buffer--
	else
		x = approach(x, xstart - 400, 1)
}
else
{
	pizzaface.sprite_index = spr_timer_pizzaface_sleep
	x = xstart - 400
}