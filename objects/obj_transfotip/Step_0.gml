if show 
	alpha = approach(alpha, 1, 0.1)
else
	alpha = approach(alpha, 0, 0.1)
if alpha == 0 and !show
	instance_destroy()
alarm0 -= 0.2
if alarm0 = 0
	event_user(0)
show_debug_message(string_concat(alarm0, alpha))