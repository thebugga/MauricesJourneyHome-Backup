create_image = false
pause = false
pause_image = spr_null
selected = 0

pausearray = ["RESUME", "RESTART", "OPTIONS", "SELECT CHARACTER", "QUIT"]

wiping = false
wipe_surface = surface_create(screen_w, screen_h)
wipe_array = []
for (var i = 0; i < screen_w; i++)
{
	array_push(wipe_array, [0, 0, irandom(20)])
}

start_wiping = function()
{
	
	if !surface_exists(wipe_surface)
		wipe_surface = surface_create(screen_w, screen_h)
	pause_image = make_pause_image()
	surface_set_target(wipe_surface)
	draw_sprite(pause_image, 0, 0, 0)
	surface_reset_target()
	var mixer = 3
	for (var i = 0; i < screen_w; i++)
	{
		var val = irandom_range(-2, 2)
		mixer += val
		if mixer < 0 || mixer > 20
			mixer -= val
		wipe_array[i] = [0, 0, mixer]
	}
	wiping = true
}
