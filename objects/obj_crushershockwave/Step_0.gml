x += Movespeed
if (place_meeting_solid(x, y) or (!grounded))
	instance_destroy()
