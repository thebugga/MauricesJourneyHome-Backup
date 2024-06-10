//whuh?_call
//who coded this i will FUCKING KILL YOUI
function scr_maurice_jump()
{
	hsp = xscale * movespeed
	if move != 0 {
		xscale = move
		movespeed = 6
	}
	if (floor(image_index) >= image_number - 1)
		image_speed = 0 
	
	if grounded {
		state = states.normal;
	}
	
	if (vsp < -12)
		vsp += 2;
	scr_taunt();
}