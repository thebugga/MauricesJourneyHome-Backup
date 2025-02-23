var topy = ((sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index)) / (sprite_get_height(sprite_index) / 2))
var bottomy = ((sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index)) / (sprite_get_height(sprite_index) / 2))
anglex = lengthdir_x(sprite_get_width(sprite_index) / 2, image_angle)
angley1 = lengthdir_y((sprite_get_height(sprite_index) / 6) * -topy, image_angle)
angley2 = lengthdir_y((sprite_get_height(sprite_index) / 6) * bottomy, image_angle)
if bounce
{
	if (vsp < 20)
		vsp += grav
	y += vsp
	var _maxy = 249
	if (y > _maxy)
	{
		y = _maxy
		vsp = 0
		if (!grounded)
		{
			vsp = -6
			repeat (8)
				create_debris(irandom_range(bbox_left, bbox_right), bbox_bottom, spr_debris)
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
			grounded = true
		}
		else
		{
			bounce = false
			flashalpha = 1
			alarm[0] = 70
		}
	}
}
else
{
	flashalpha = approach(flashalpha, 0, 0.05)
	if spincounts > 0
	{
		
		if image_angle + 7.5 >= 360
		{
			image_angle = 0
			spincounts--
		}
		else
			image_angle += 7.5
	}
}
