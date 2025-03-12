countdown -= 0.5
if (place_meeting((x + 1), y, obj_ratblock) || place_meeting((x - 1), y, obj_ratblock) || place_meeting(x, (y - 1), obj_ratblock) || place_meeting(x, (y + 1), obj_ratblock))
	instance_destroy()
if (place_meeting_solid((x + 1), y) || place_meeting_solid((x - 1), y))
	drop = 1
if place_meeting(x, (y + 1), obj_solid)
	hsp = 0
if place_meeting(x, (y + 1), obj_railparent)
{
	var _railinst = instance_place(x, (y + 1), obj_railparent)
	hsp = (_railinst.movespeed * _railinst.dir)
}
if (vsp < 12)
	vsp += grav
if (countdown < 50)
	sprite_index = spr_bomblit
if (countdown == 0)
	instance_destroy()
if place_meeting_solid((x + floor(hsp)), y)
{
	x = floor(x)
	while (!(place_meeting_solid((x + sign(hsp)), y)))
		x += sign(hsp)
	hsp = 0
}
x += hsp
if place_meeting_solid(x, (y + floor(vsp)))
{
	y = floor(y)
	while (!(place_meeting_solid(x, (y + sign(vsp)))))
		y += sign(vsp)
	vsp = 0
}
y += floor(vsp)
