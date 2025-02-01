if zooming && image_xscale < 10
{
	yspd -= 0.05
	y += yspd
	zspd = (image_xscale / 20) + 0.0025
	image_xscale += zspd
	image_yscale += zspd
	image_angle += 0.5
}
image_alpha = clamp(image_xscale, 0, 1)