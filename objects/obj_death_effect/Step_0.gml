if (vsp < 20)
	vsp += grav
if (buffer > 0)
	buffer--
if (d > 150)
	d -= 20
make_colour_hsv(255, 255, d)
if place_meeting((x + floor(hsp)), y, noone)
{
	x = floor(x)
	while (!(place_meeting((x + sign(hsp)), y, noone)))
		x += sign(hsp)
	hsp = 0
}
x += hsp
if place_meeting(x, (y + floor(vsp)), noone)
{
	y = floor(y)
	while (!(place_meeting(x, (y + sign(vsp)), noone)))
		y += sign(vsp)
	vsp = 0
}
y += floor(vsp)
