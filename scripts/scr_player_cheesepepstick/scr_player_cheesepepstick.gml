function scr_player_cheesepepstick()
{
	hsp = 0
	vsp = 0
	if key_jump
		input_buffer_jump = 0
	if ((!grounded) && (!(place_meeting((x + 1), y, obj_solid))) && (!(place_meeting((x - 1), y, obj_solid))))
	{
		state = states.cheesepepjump
		jumpAnim = 0
		sprite_index = spr_cheesepepfall
	}
	if grounded
	{
		state = states.cheesepep
		sprite_index = spr_cheesepepland
		image_index = 0
		landAnim = 1
	}
	move = (key_left + key_right)
	if (input_buffer_jump < 8 && sprite_index != spr_cheesepepjumpstart && sprite_index != spr_cheesepepland)
	{
		image_index = 0
		sprite_index = spr_cheesepepjumpstart
	}
	if (sprite_index == spr_cheesepepjumpstart && animation_end())
	{
		//scr_soundeffect(sfx_jump)
		Xscale *= -1
		dir = Xscale
		state = states.cheesepepjump
		sprite_index = spr_cheesepepjump
		image_index = 0
		movespeed = (Xscale * 3)
		vsp = -11
	}
	exit;
}

function scr_player_cheesepepstickside()
{
	sprite_index = spr_cheesepepstickside
	image_speed = 0.35
	alarm[5] = 2
	alarm[7] = 60
	hurted = 1
	move = (key_down - key_up)
	moveside = (key_left + key_right)
	if (global.playerCharacter == Characters.Maurice && global.playerCharacter == Characters.Doise && move != 0)
		Yscale = (-move)
	hsp = 0
	vsp = (move * movespeed)
	if key_jump
		input_buffer_jump = 0
	if (input_buffer_jump < 8)
		input_buffer_jump++
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.5
		else if (movespeed == 6)
			movespeed = 6
	}
	else
		movespeed = 0
	if place_meeting((x - 1), y, obj_solid)
		Xscale = 1
	else if place_meeting((x + 1), y, obj_solid)
		Xscale = -1
	if (input_buffer_jump < 8 && (!(place_meeting_solid(x, (y - 16)))))
	{
		sprite_index = spr_cheesepepjump
		input_buffer_jump = 8
		x += Xscale
		vsp = -11
		image_index = 0
		state = states.cheesepep
		hsp = (move * movespeed)
		cheesepep_buffer = 0
	}
	if ((!(place_meeting((x + 1), y, obj_solid))) && (!(place_meeting((x - 1), y, obj_solid))))
	{
		grav = 0.5
		state = states.cheesepep
		sprite_index = spr_cheesepepidle
		hsp = (move * movespeed)
		cheesepep_buffer = 0
	}
	if (grounded && moveside == Xscale)
	{
		cheesepep_buffer = 0
		grav = 0.5
		state = states.cheesepep
		sprite_index = spr_cheesepepidle
		hsp = (move * movespeed)
	}
	if place_meeting_solid(x, y)
	{
		var tx = try_solid(Xscale, 0, 312, 64)
		if (tx != -1)
			x += (tx * Xscale)
		else
		{
			tx = try_solid((-Xscale), 0, 312, 64)
			if (tx != -1)
				x -= (tx * Xscale)
		}
	}
	var rvsp = round(vsp)
	if (rvsp == 0 && vsp != 0)
		rvsp = move
	var stickside = (Xscale > 0 ? bbox_left : bbox_right)
	var bbox_y = (rvsp > 0 ? bbox_bottom : bbox_top)
	var colside = collision_line(x, (bbox_y + (sign(rvsp) * 2)), (stickside - (8 * Xscale)), (bbox_y + (sign(rvsp) * 2)), obj_solid, false, true)
	if (rvsp != 0 && colside == -4 && place_meeting_solid((x - Xscale), y) && (!(place_meeting(x, (y + 1), obj_platform))))
	{
		if (cheesepep_buffer <= 0)
		{
			var old_x = x
			x -= Xscale
			var ty = try_solid(0, sign(rvsp), 312, 64)
			if (ty != -1)
				y += (ty * sign(rvsp))
			x = old_x
			Xscale = (-Xscale)
			x += (16 * Xscale)
			if (rvsp > 0)
			{
				stickdir = -1
				state = states.cheesepepstickup
				sprite_index = spr_cheesepepstickceiling
				vsp = 0
				hsp = (Xscale * movespeed)
			}
			else
			{
				state = states.cheesepep
				mask_index = spr_player_mask
				sprite_index = spr_cheesepepidle
				vsp = 0
				hsp = (Xscale * movespeed)
			}
		}
		else
			vsp = 0
	}
	exit;
}

function scr_player_cheesepepstickup()
{
	sprite_index = (stickdir == -1 ? spr_cheesepepstickceiling : spr_cheesepepstickfloor)
	image_speed = 0.35
	alarm[5] = 2
	alarm[7] = 60
	hurted = 1
	move = (key_left + key_right)
	vsp = 0
	if (!(place_meeting(x, (y + stickdir), obj_railparent)))
		hsp = (move * movespeed)
	else
	{
		var _railinst = instance_place(x, (y + stickdir), obj_railparent)
		hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	if (move != 0)
		Xscale = sign(move)
	if key_jump
		input_buffer_jump = 0
	if (input_buffer_jump < 8)
		input_buffer_jump++
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.5
		else if (movespeed == 6)
			movespeed = 6
	}
	else
		movespeed = 0
	if (move == sign(hsp) && place_meeting((x + sign(hsp)), y, obj_solid))
	{
		sprite_index = spr_cheesepepstickside
		cheesepep_buffer = cheesepep_max
		state = states.cheesepepstickside
		vsp = (move * movespeed)
	}
	if (input_buffer_jump < 8 && (!((place_meeting(x, (y + 1), obj_solid) && place_meeting(x, (y - 1), obj_solid)))))
	{
		mask_index = spr_player_mask
		if place_meeting(x, y, obj_solid)
		{
			while place_meeting(x, y, obj_solid)
				y++
		}
		input_buffer_jump = 8
		state = states.cheesepep
		cheesepep_buffer = 0
		vsp = 2
		hsp = (move * movespeed)
	}
	if ((!(place_meeting(x, (y - 1), obj_solid))) && (!(place_meeting(x, (y + 1), obj_solid))))
	{
		state = states.cheesepep
		cheesepep_buffer = 0
		hsp = (move * movespeed)
	}
	if (!(place_meeting(x, (y + (4 * stickdir)), obj_solid)))
	{
		if (!(place_meeting(x, (y - (4 * stickdir)), obj_solid)))
		{
			state = states.cheesepep
			cheesepep_buffer = 2
			hsp = (move * movespeed)
			sprite_index = spr_cheesepepidle
		}
		else
		{
			state = states.cheesepepstickup
			stickdir *= -1
		}
	}
	var _sideup = (stickdir == -1 ? bbox_top : bbox_bottom)
	var colup = collision_line((x + (Xscale * 2)), y, (x + (Xscale * 2)), (_sideup + (8 * stickdir)), obj_solid, false, true)
	if (colup == -4 && place_meeting_solid(x, (y + stickdir)))
	{
		if (cheesepep_buffer <= 0)
		{
			var old_y = y
			y += stickdir
			tx = try_solid(Xscale, 0, 312, 64)
			if (tx != -1)
				x += (tx * Xscale)
			y = old_y
			y += (16 * stickdir)
			cheesepep_buffer = cheesepep_max
			state = states.cheesepepstickside
			sprite_index = spr_cheesepepstickside
			hsp = 0
			vsp = (move * movespeed)
		}
		else
			hsp = 0
	}
	exit;
}

