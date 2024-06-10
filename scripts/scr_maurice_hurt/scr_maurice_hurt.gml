function scr_maurice_hurt()
{

	if sprite_index == spr_maurice_jump
		hsp = -xscale * movespeed;
	if vsp >= 0
	{
		movespeed = 0;
		state = states.normal;
	}
	if (scr_solid(x + hsp, y)){
		movespeed = 0;
		state = states.normal;	
	}
	image_speed = 0.35;
}
