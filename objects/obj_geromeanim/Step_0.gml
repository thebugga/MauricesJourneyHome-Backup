if alarm[0] > 0
{
	x = lerp(576, xstart, alarm[0] / 60)
	y = lerp(320, ystart, alarm[0] / 60) - (sin(alarm[0] / 120) * 100)
}
if sprite_index = spr_player_finishingblow1 && floor(image_index) == 5
	instance_destroy(obj_glassblock)
if grav != 0
{
	x += hsp
	y += vsp
	vsp += grav
}