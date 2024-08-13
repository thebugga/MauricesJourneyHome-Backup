function scr_player_Sjump()
{
	move_h = (key_right + key_left)
	move_v = (key_down - key_up)
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	if sprite_index != spr_superspringplayer
	{
		if superjumptimer > 0
		{
			if character == "D"
			{
				hsp = -lengthdir_x(sjumpvsp, sjumpangle)
				vsp = -lengthdir_y(sjumpvsp, sjumpangle)
			}
			else
				vsp = sjumpvsp
			superjumptimer--
			if steppybuffer > 0
				steppybuffer--;
			else
			{
				create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), particle.cloudeffect, 0);
				steppybuffer = 8;
			}
			if piledrivereffect > 0
				piledrivereffect--;
			else
			{
				with (instance_create(x, y, obj_parryeffect))
				{
					sprite_index = spr_piledrivereffect;
					image_yscale = -1;
				}
				piledrivereffect = 15;
			}
		}
		else if character != "D"
		{
			sprite_index = spr_machfreefall;
			if grounded
				state = states.normal
		}
	}
	else
	{
		hsp = 0
		vsp = -10
	}
	if character != "D"
		sjumpvsp -= 0.1;
	if character == "V" && image_index > 3
		vsp = -11;
	if sprite_index == spr_player_supersidejump
	{
		if a < 25
			a++;
		hsp = xscale * a;
		vsp = 0;
	}
	if character == "D" && (sprite_index == spr_superjump || sprite_index == spr_playerN_jetpackboost || sprite_index == spr_playerN_jetpackboostdown) 
	{
		if sjumpangle == 270
			sjumpangle += choose(-5, 5)
		if move_h == 0 && move_v == 0
		{
			if sjumpangle > 270 || sjumpangle < 90
			sjumpangle += 5
			if sjumpangle < 270 && sjumpangle > 90
			sjumpangle -= 5
		}
		else
		{
			var _diff = sign(angle_difference(sjumpangle, point_direction(0, 0, move_h, move_v)))
			move = clamp(move + _diff, -5,5)
			sjumpangle += move
		}
		var _dir = point_direction(0, 0, hsp, vsp)
		var _xscale = sign(lengthdir_x(sjumpvsp, _dir))
		if _dir > 45 && _dir < 135
			sprite_index = spr_superjump
		else if _dir > 245 && _dir < 295
			sprite_index = spr_playerN_jetpackboostdown
		else
		{
			sprite_index = spr_playerN_jetpackboost
			if _xscale != 0
				xscale = _xscale
		}
		if ((place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && sprite_index == spr_playerN_jetpackboost)
		{
			sprite_index = spr_slipbanan1
			movespeed = abs(lengthdir_x(sjumpvsp, _dir))
			if (movespeed > 14)
				movespeed = 14
			xscale *= -1
			hsp = (movespeed * xscale)
			image_index = 0
			state = states.slipbanan
			instance_create(x, y, obj_playerexplosion)
		}
		if grounded && vsp > 0
		{
			if sprite_index == spr_playerN_jetpackboost
			{
				jumpstop = true;
				vsp = -6;
				flash = true;
				movespeed = 13;
				image_index = 0;
				sprite_index = spr_rockethitwall;
				state = states.mach3;
				with (instance_create(x, y, obj_crazyrunothereffect))
					image_xscale = other.xscale;
			}
			else if sprite_index == spr_playerN_jetpackboostdown
			{
				sprite_index = spr_slipbanan1
				movespeed = abs(lengthdir_x(sjumpvsp, _dir))
				if (movespeed > 14)
					movespeed = 14
				if _xscale != 0
				xscale = _xscale
				hsp = (movespeed * xscale)
				vsp = -(lengthdir_y(sjumpvsp, _dir) / 2)
				image_index = 0
				state = states.slipbanan
			}
			instance_create(x, y, obj_playerexplosion)
		}
	}
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		pizzapepper = 0;
		a = 0;
		if sprite_index == spr_player_supersidejump
			sprite_index = spr_player_supersidejumpland;
		else
			sprite_index = spr_superjumpland;
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with obj_baddie
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				image_index = 0;
				if grounded
					vsp = -7;
			}
		}
		fmod_event_one_shot_3d("event:/sfx/maurice/groundpound", x, y);
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
	}
	else if ((key_attack2 || input_buffer_slap > 0) && character == "M" && sprite_index != spr_superspringplayer)
	{
			jumpstop = true
			input_buffer_slap = 0
		    sprite_index = spr_player_jumpdive1
			image_index = 0
			if move_h != 0
				xscale = move_h;
		    movespeed = 10
			vsp = -10
		    state = states.mach2
			fmod_event_one_shot_3d("event:/sfx/maurice/superjumpcancel", x, y)
	}
	if sprite_index == spr_player_Sjumpcancelstart
	{
		vsp = 0;
		if floor(image_index) == image_number - 1
		{
			jumpstop = true;
			vsp = -4;
			flash = true;
			movespeed = 13;
			image_index = 0;
			sprite_index = spr_player_Sjumpcancel;
			state = states.mach3;
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.xscale;
		}
	}
	image_speed = 0.5;
	scr_collide_player();
}
