if wiping
{
	if !surface_exists(wipe_surface)
	{
		wipe_surface = surface_create(screen_w, screen_h)
		wiping = false
	}
	else
	{
		var donewiping = true
		for (var i = 0; i < screen_w; i++)
		{
			if wipe_array[i][0] <= screen_h
				donewiping = false
			if wipe_array[i][2] > 0
				wipe_array[i][2]--
			else
			{
				wipe_array[i][1] += 0.5
				wipe_array[i][0] += wipe_array[i][1]
			}
			draw_surface_part(wipe_surface, i, 0, 1, screen_h, i, wipe_array[i][0])
		}
		if donewiping
			wiping = false
	}
}

if !pause
	exit;

draw_set_color(c_black)
draw_rectangle(0, 0, screen_w, screen_h, false)
draw_sprite(pause_image, 0, 0, 0)

draw_set_alpha(0.5)
draw_set_color(c_red)
draw_rectangle(0, 0, screen_w, screen_h, false)
draw_reset_color()

draw_set_align(fa_center, fa_center)
draw_set_font(global.generic_font)

var sw = screen_w / 2
var sh = screen_h / 2

if instance_exists(obj_options) || instance_exists(obj_characterselect)
	exit;

draw_text(sw, 64, "PAUSE")

sh -= array_length(pausearray) * 16

for (var i = 0; i < array_length(pausearray); i++) 
	draw_text(sw, sh + (i * 32), pausearray[i][0])

var str = pausearray[selected][0]

sw -= (string_width(str) / 2)

draw_sprite(spr_cursor, 0, sw, sh + (selected * 32))
