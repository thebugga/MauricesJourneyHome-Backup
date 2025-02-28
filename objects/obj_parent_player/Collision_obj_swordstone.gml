if grounded && other.visible && ((global.playerCharacter == Characters.Maurice && key_slap2) || (global.playerCharacter == Characters.Doise && state = states.handstandjump))
{
	//scr_soundeffect(sfx_knightsword)
	momentum = 0
	movespeed = 0
	image_index = 0
	image_speed = 0.35
	sprite_index = spr_knightpepstart
	state = states.knightpep
	hsp = 0
	vsp = 0
	tv_push_prompt_once(tv_create_prompt((global.playerCharacter == Characters.Maurice ? "Wizard Maurice arises!" : "Wizard Doise arises!"), "Press Slap to throw a whimsical baseball, & press it again to teleport to it. You can also double jump!", tvprompt.transfo, spr_tv_knight, 3), "knight")
}
