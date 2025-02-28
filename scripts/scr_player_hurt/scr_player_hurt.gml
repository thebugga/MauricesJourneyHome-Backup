function scr_player_hurt()
{
	if (sprite_index == spr_hurtjump)
		hsp = (Xscale * Movespeed)
	if (sprite_index == spr_hurt)
		hsp = ((-Xscale) * Movespeed)
	freefallsmash = 0
	combo = 0
	mach2 = 0
	bounce = 0
	jumpAnim = 1
	dashAnim = 1
	if grounded
		landAnim = 0
	else
		landAnim = 1
	jumpstop = 0
	MoveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	hit_connected = 0
	hurted = 1
	turning = 0
	skateboarding = 0
	alarm[5] = 2
	alarm[7] = 80
	if (grounded && vsp > 0)
	{
		Movespeed = 0
		state = states.normal
	}
	if place_meeting_solid((x + hsp), y)
		Movespeed = 0
	image_speed = 0.35
	exit;
}

