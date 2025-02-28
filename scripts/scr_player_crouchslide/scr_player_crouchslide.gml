function scr_player_crouchslide()
{
	if (!(place_meeting(x, (y + 1), obj_railparent)))
		hsp = (Xscale * Movespeed)
	else
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((Xscale * Movespeed) + (_railinst.Movespeed * _railinst.dir))
	}
	Move = (key_left + key_right)
	if (Movespeed >= 0 && grounded)
		Movespeed -= 0.2
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 20
		jumpstop = 1
	}
	if key_jump
		input_buffer_jump = 0
	if (grounded && input_buffer_jump < 8 && (!(place_meeting_solid((x + 27), (y - 32)))) && (!(place_meeting_solid((x - 27), (y - 32)))) && (!(place_meeting_solid(x, (y - 32)))) && (!(place_meeting_solid(x, (y - 16)))))
	{
		sprite_index = spr_player_jumpdive1
		image_index = 0
		vsp = -11
		with (instance_create(x, y, obj_superdashcloud))
		{
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	if (grounded && (sprite_index == spr_player_jumpdive1 or sprite_index == spr_player_jumpdive2) && vsp > 0)
	{
		sprite_index = spr_crouchslip
		jumpstop = 0
	}
	if (sprite_index == spr_player_jumpdive1 && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_jumpdive2
	mask_index = spr_crouchmask
	if (grounded && key_attack && (!(place_meeting_solid((x + 27), (y - 32)))) && (!(place_meeting_solid((x - 27), (y - 32)))) && (!(place_meeting_solid(x, (y - 32)))) && (!(place_meeting_solid(x, (y - 16)))))
	{
		Movespeed = 8
		state = states.mach2
		image_index = 0
		sprite_index = spr_rollgetup
	}
	if (((Movespeed <= 5 or (place_meeting_solid((x + 1), y) && Xscale == 1) or (place_meeting_solid((x - 1), y) && Xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) or Movespeed <= 0)
		state = states.crouch
	if (place_meeting_solid((x + 1), y) && Xscale == 1 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)))
		state = states.crouch
	if (place_meeting_solid((x - 1), y) && Xscale == -1 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)))
		state = states.crouch
	if ((!instance_exists(obj_slidecloud)) && grounded && Movespeed > 5)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.Xscale
	}
	image_speed = (Movespeed / 24)
	exit;
}

