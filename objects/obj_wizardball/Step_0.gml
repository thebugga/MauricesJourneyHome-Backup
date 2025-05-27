if movespeed = 0
{
	movespeed = 25
	hsp = lengthdir_x(movespeed, angle)
	vsp = lengthdir_y(movespeed, angle)
}
if (grounded || scr_hitwall(x + image_xscale, y - 1)) && grav != 0
{
	hsp = 0
	vsp = 0
	grav = 0
	with playerid
	{
		reset_anim(spr_wizardzoom)
		movespeed = 6
	}
}
if playerid.state != states.wizardgrapple
	instance_destroy()