hsp = spd * image_xscale
vsp = spd
x += hsp
y += vsp
if (place_meeting_solid(x, y + sign(vsp)) || place_meeting(x, y, obj_platform) || place_meeting_slope(x, y))
	instance_destroy()

