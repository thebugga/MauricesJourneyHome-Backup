if (y == ystart && obj_parent_player.boxxed == 0 && obj_parent_player.state != states.boxxedpep && obj_parent_player.state != states.boxxedpepspin && obj_parent_player.state != states.boxxedpepjump && obj_parent_player.x > (x - 50) && obj_parent_player.x < (x + 50) && obj_parent_player.y > y && obj_parent_player.y < (y + 200))
{
	vsp = 10
	sprite_index = spr_boxcrusher_fall
}
if (sprite_index == spr_boxcrusher_fall && grounded)
{
	with (obj_camera)
	{
		shake_mag = 10
		shake_mag_acc = (30 / room_speed)
	}
	vsp = 0
	image_index = 0
	sprite_index = spr_boxcrusher_land
}
if (sprite_index == spr_boxcrusher_land && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_boxcrusher_idle
	gobackup = 1
}
if (gobackup == 1)
	y = approach(y, ystart, 2)
if (y == ystart)
	gobackup = 0
scr_collision()
