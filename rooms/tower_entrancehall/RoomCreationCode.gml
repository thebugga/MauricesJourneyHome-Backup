pal_swap_init_system(shd_pal_swapper)
with (obj_player1)
{
	if (targetDoor == "D")
	{
		targetDoor = "HUB"
		verticalhallway = 0
		backtohubstartx = (obj_doorC.x + 32)
		backtohubstarty = (obj_doorC.y - 14)
		sprite_index = spr_slipbanan1
		image_index = 10
	}
}
