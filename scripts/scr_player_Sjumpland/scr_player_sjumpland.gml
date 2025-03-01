function scr_player_Sjumpland()
{
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	machslideAnim = 1
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	movespeed = 0
	start_running = 1
	alarm[4] = 14
	vsp = 0
	hsp = 0
	if (floor(image_index) == 6) && global.playerCharacter != Characters.Pierre
	{
		sprite_index = spr_machfreefall
		state = states.jump
		jumpAnim = 0
	}
	if global.playerCharacter == Characters.Pierre
	{
        GamepadSetVibration(0, 0.8, 0.8, 0.65)
        state = states.ratmountbounce
        instance_create(x, y, obj_highjumpcloud2)
        sprite_index = spr_player_ratmountwalljump
        image_index = 0
        vsp = -16
	}
	exit;
}

