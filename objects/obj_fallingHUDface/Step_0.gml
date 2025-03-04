if (vsp < 12)
	vsp += grav
image_speed = 0.35
x += hsp
y += floor(vsp)
image_angle += rsp
if (y > (room_height + 500))
	instance_destroy()
