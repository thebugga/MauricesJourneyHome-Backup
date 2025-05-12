if alarm[0] > 0
{
	x = lerp(544, xstart, alarm[0] / 30)
	y = lerp(274, ystart, alarm[0] / 30) - wave(-100, 100, 1, 0, 500 * (alarm[0] / 30))
}
if sprite_index = spr_player_finishingblow_1 && floor(image_index) == 5
	instance_destroy(obj_glassblock)
if grav != 0
{
	x += hsp
	y += vsp
	vsp += grav
}