var player = instance_place(x, y - 2, obj_player)
if player && hsp == 0 && player.hsp != 0 && player.movespeed > 8 && player.bbox_bottom - player.vsp <= bbox_top && player.grounded && !place_meeting(x + player.hsp, y, par_collision)
{
	hsp = player.movespeed * image_xscale
	with player
	{
		prev.state = state
		prev.hsp = hsp
		state = states.actor
		hsp = 0
		vsp = 0
		reset_anim(spr_grind)
		image_speed = 0.35
	}
}
else if hsp != 0 && place_meeting(x, y, par_collision)
{
	hsp = 0
	image_xscale *= -1
	do
		x += image_xscale
	until !place_meeting(x, y, par_collision)
	with player
	{
		state = prev.state
		reset_anim(spr_superjumpfall)
		hsp = prev.hsp
		vsp = -8
		jumpstop = true
	}
}

x += round(hsp)
y += round(vsp)