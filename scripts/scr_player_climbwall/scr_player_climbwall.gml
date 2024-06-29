function scr_player_climbwall()
{
	switch character
	{
		case "P":
if (windingAnim < 200)
    windingAnim++
vsp = (-movespeed)
mach2 = 35
if (movespeed > 0)
    movespeed -= 0.5
crouchslideAnim = true
sprite_index = spr_player_climbwall
if (!key_attack)
{
    state = states.jump
    sprite_index = spr_player_fall
}
if (!(scr_solid((x + xscale), y)))
{
    instance_create(x, y, obj_jumpdust)
    vsp = 0
    mach2 = 35
    state = states.mach2
}
if ((scr_solid(x, (y + 1)) && movespeed <= 0) || movespeed <= 0)
{
    state = states.jump
    sprite_index = spr_player_fall
}
image_speed = 0.6
if (!instance_exists(obj_cloudeffect))
    instance_create(x, (y + 43), obj_cloudeffect)
if (key_jump && key_attack)
{
    instance_create(x, y, obj_jumpdust)
    mach2 = 35
    vsp = -9
    state = states.mach2
    xscale *= -1
}
			break;
		case "V":
			if windingAnim < 200
				windingAnim++;
			move = key_left + key_right;
			suplexmove = false;
			vsp = -wallspeed;
			if wallspeed < 24 && move == xscale
				wallspeed += 0.1;
			crouchslideAnim = true;
			sprite_index = spr_machclimbwall;
			if grabclimbbuffer > 0
				grabclimbbuffer--;
			if !key_attack && grabclimbbuffer == 0
			{
				state = states.normal
				movespeed = 0;
			}
			if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
			{
				sprite_index = spr_superjumpland;
				fmod_event_one_shot_3d("event:/sfx/maurice/groundpound", x, y);
				image_index = 0;
				state = states.Sjumpland;
				machhitAnim = false;
			}
			if (!scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway))
			{
				instance_create(x, y, obj_jumpdust);
				vsp = 0;
				if movespeed >= 6
					state = states.mach2;
				if movespeed >= 12
				{
					state = states.mach3;
					sprite_index = spr_mach4;
				}
			}
			if input_buffer_jump > 8
			{
				input_buffer_jump = 0;
				movespeed = 8;
				state = states.mach2;
				image_index = 0;
				sprite_index = spr_walljumpstart;
				vsp = -11;
				xscale *= -1;
				jumpstop = false;
			}
			if ((grounded && wallspeed <= 0) || wallspeed <= 0)
			{
				state = states.jump;
				sprite_index = spr_fall;
			}
			image_speed = 0.6;
			if (!instance_exists(obj_cloudeffect))
				instance_create(x, y + 43, obj_cloudeffect);
			break;
		case "N":
			hsp = 0;
			if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == image_number - 1)
				sprite_index = spr_playerN_wallcling;
			if sprite_index == spr_playerN_wallcling
				vsp = 2;
			else
				vsp = 0;
			wallclingcooldown = 0;
			if (floor(image_index) == image_number - 1 || !key_jump2)
			{
				vsp = -15;
				state = states.jump;
				sprite_index = spr_playerN_jump;
				image_index = 0;
			}
			if key_jump
			{
				vsp = -15;
				state = states.jump;
				sprite_index = spr_playerN_jump;
				image_index = 0;
			}
			image_speed = 0.35;
			break;
	}
}
