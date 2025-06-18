function state_boss_arenaround()
{
	image_speed = 0.35
	hsp = (x > (room_width / 4) + ((room_width / 2) * team) ? -10 : 10)
	if (hsp != 0 && grounded)
	{
		sprite_index = spr_move
		image_xscale = sign(hsp)
	}
	else if grounded
		sprite_index = spr_idle
	else
		sprite_index = spr_fall
}

function scr_bossplayer_normal()
{
	if grounded && sprite_index != spr_jumpprep && sprite_index != spr_land && sprite_index != spr_duck && sprite_index != spr_punch
	{
		image_speed = 0.3
		hsp = bp_move * 6
		if hsp == 0
			sprite_index = spr_idle
		else
			sprite_index = spr_move
		if key_jump.pressed
		{
			hsp = 0
			sprite_index = spr_jumpprep
			image_index = 0
		}
		if key_down.down
		{
			hsp = 0
			sprite_index = spr_duck
		}
		if key_grab.pressed
		{
			hsp = 0
			sprite_index = spr_punch
			with instance_create(x, y, obj_lungehitbox)
			{
				playerid = other.id
				offsetx = 170
				offsety = 30
			}
		}
	}
	else
		image_speed = 0.45
	if anim_ended()
	{
		if sprite_index == spr_jumpprep
		{
			hsp = bp_move * 7
			vsp = -15
			sprite_index = spr_jump
			image_index = 0
			landAnim = true
		}
		if sprite_index == spr_jump
			sprite_index = spr_fall
		if sprite_index == spr_land || sprite_index == spr_punch
			sprite_index = spr_idle
	}
	if vsp >= 0 && grounded && landAnim
	{
		hsp = 0
		sprite_index = spr_land
		image_index = 0
		landAnim = false
	}
	if !key_down.down && sprite_index == spr_duck
	{
		sprite_index = spr_idle
	}
	
	if key_taunt.pressed
	{
		prev = {
			lag: 20,
			state: self.state,
			x: self.x,
			y: self.y,
			hsp: self.hsp,
			vsp: self.vsp,
			sprite_index: self.sprite_index,
			image_index: self.image_index,
		}
		
		instance_create(x, y, obj_taunteffect)
		state = states.taunt
		
		if key_up.down && SP >= 100
		{
		}
		else
		{
			sprite_index = spr_taunt
			image_index = random_range(0, image_number)
			event_play_oneshot_3d("event:/sfx/player/taunt", x, y)
			instance_create(x, y, obj_parrybox)
		}
	}
	
	if key_left.pressed
	{
		if image_xscale == 1
			input_text += "L"
		else
			input_text += "R"
	}
	if key_right.pressed
	{
		if image_xscale == 1
			input_text += "R"
		else
			input_text += "L"
	}
	if key_up.pressed
		input_text += "U"
	if key_down.pressed
		input_text += "D"
	if key_jump.pressed
		input_text += "Z"
	if key_grab.pressed
		input_text += "X"
}

function state_boss_taunt()
{
	image_speed = 0
	hsp = 0
	vsp = 0
	if prev.lag > 0
	{
		prev.lag--
		if place_meeting(x, y, obj_lungehitbox)
		{
			playerinst = instance_place(x, y, obj_lungehitbox)
			if instance_exists(playerinst)
			{
				reset_anim(parryspr)
				
			}
		}
	}
	else
	{
		image_speed = 0.35
		state = prev.state
		hsp = prev.hsp
	}
}

function state_boss_parry()
{
	image_speed = 0.35
	hsp = (movespeed * (-image_xscale))
	if (image_index > (image_number - 1))
		state = states.normal
	if (movespeed > 0)
		movespeed -= 0.5
	else
		movespeed = 0
}

function state_boss_hitlag()
{
	hsp = 0
	vsp = 0
	image_speed = 0
	x = (prev.x + irandom_range(-4, 4))
	y = (prev.y + irandom_range(-4, 4))
	prev.lag--
	if (prev.lag <= 0)
	{
		image_speed = 0.35
		x = prev.x
		y = prev.y
		state = prev.state
		hsp = prev.hsp
		vsp = prev.vsp
	}
}

function state_boss_stun()
{
	image_speed = 0
	if sprite_index == spr_hurt
	{
		hsp = approach(hsp, 0, 0.25)
		if hsp == 0
		{
			sprite_index = spr_idle
			state = states.normal
		}
	}
	else if sprite_index == spr_flung
	{
		hsp = movespeed * image_xscale
		if ((grounded || (grounded && (!(place_meeting(x, y, obj_platform))))) && vsp > 0)
		{
			movespeed = approach(movespeed, 0, 0.25)
			funnyangle = 0
			if image_index == 0
			{
				image_index = 1
				grav = 0.5
				bouncetimes--
				if bouncetimes > 0
				{
					image_index = 1
					stunnedbuffer = 5
				}
				else
				{
					image_index = 2
					stunnedbuffer = 25
				}
			}
			else
			{
				if (stunnedbuffer > 0)
					stunnedbuffer--
				else
				{
					if bouncetimes > 0
						vsp = -5 * bouncetimes
					else
					{
						bouncetimes = 3
						sprite_index = spr_idle
						state = states.normal
					}
				}
			}
		}
		else
		{
			image_index = 0
			funnyangle = point_direction(0, 0, hsp, vsp)
			if image_xscale == 1
				funnyangle += 180
		}
	}
	exit;
}
