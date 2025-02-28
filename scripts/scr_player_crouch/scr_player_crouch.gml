function scr_player_crouch()
{
	move = (key_left + key_right)
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (move * movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	movespeed = 4
	mask_index = spr_crouchmask
	turning = 0
	if ((!grounded) && (!key_jump))
	{
		jumpAnim = 0
		state = states.crouchjump
		movespeed = 4
		crouchAnim = 1
		image_index = 0
	}
	if (grounded && (!key_down) && (!(place_meeting_solid(x, (y - 16)))) && (!(place_meeting_solid(x, (y - 32)))) && (!key_jump))
	{
		state = states.normal
		movespeed = 0
		crouchAnim = 1
		jumpAnim = 1
		image_index = 0
		mask_index = spr_player_mask
	}
	if (crouchAnim == 0)
	{
		if (move == 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_crouch
			else
				sprite_index = spr_shotgunduck
		}
		if (move != 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_crawl
			else
				sprite_index = spr_shotguncrawl
		}
	}
	if (crouchAnim == 1)
	{
		if (move == 0)
		{
			if (shotgunAnim == 0)
				sprite_index = spr_couchstart
			else
				sprite_index = spr_shotgungoduck
			if (floor(image_index) == (image_number - 1))
				crouchAnim = 0
		}
	}
	if (move != 0)
	{
		xscale = move
		crouchAnim = 0
	}
	if (key_jump && grounded && (!(place_meeting_solid(x, (y - 16)))) && (!(place_meeting_solid(x, (y - 32)))))
	{
		//scr_soundeffect(sfx_jump)
		vsp = -8
		state = states.crouchjump
		movespeed = 4
		image_index = 0
		crouchAnim = 1
		jumpAnim = 1
	}
if (input_buffer_slap > 0 && grounded && global.attackstyle != 2)
{
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        input_buffer_slap = 0
        movespeed = 12
        crouchslipbuffer = 25
        grav = 0.5
        sprite_index = spr_crouchslip
        image_index = 0
        machhitAnim = false
        state = states.tumble
        fmod_event_instance_play(snd_crouchslide)
}

	if (key_shoot2 && global.playerCharacter == Characters.MrOrange && (!instance_exists(dynamite_inst)))
	{
		if (move == 0)
			movespeed = 0
		state = states.dynamite
		image_index = 0
		sprite_index = spr_playerV_dynamitethrow
		with (instance_create(x, y, obj_dynamite))
		{
			image_xscale = other.xscale
			movespeed = 0
			vsp = -6
			other.dynamite_inst = id
			playerid = other.id
		}
	}
	if (key_slap2 && global.playerCharacter == Characters.MrOrange)
	{
		if (move == 0)
			movespeed = 0
		state = states.revolver
		image_index = 0
		sprite_index = spr_playerV_revolverstart
	}
	image_speed = 0.45
	exit;
}

