function scr_maurice_debugstate()
{
	visible = true;
	image_blend = c_white;
	var _spd = 6;
	if key_attack
		_spd = 10;
	hsp = move * _spd;
	vsp = -(key_up - key_down) * _spd;
	image_speed = 1;
	solid = false 
	sprite_index = spr_idle;
	if (key_jump || key_attack2)
	{
		image_speed = 0.35;
		state = states.normal;
	}
}
