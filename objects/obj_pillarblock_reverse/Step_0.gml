if global.panic.active
{
	x = -1000
	y = -1000
	sprite_index = spr_pillarblock
	facesprite = spr_pillarblock_face_sleep
}
else
{
	x = xstart
	y = ystart
	sprite_index = spr_pillarblock_awake
	facesprite = spr_pillarblock_face_woke
}
