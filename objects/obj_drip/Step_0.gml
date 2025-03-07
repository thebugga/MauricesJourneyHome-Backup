if (grounded && vspeed == 10)
	instance_destroy()
if (animation_end())
{
	vspeed = 10
	image_speed = 0
}
