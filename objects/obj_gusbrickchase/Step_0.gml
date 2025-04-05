image_speed = 0.35;
hsp = image_xscale * 10;
if ((x + hsp) > room_width || (x + hsp) < 0 || (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope)))
	image_xscale *= -1;
mask_index = spr_player_mask;
var _index = floor(image_index) == image_number - 1;
if _index && !steppy
{
	steppy = true;
	create_particle(x, y + 43, particle.cloudeffect);
}
else if !_index
	steppy = false;
scr_collision();
