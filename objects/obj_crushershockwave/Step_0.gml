x += movespeed
if (place_meeting_solid(x, y) || (!grounded))
	instance_destroy()
