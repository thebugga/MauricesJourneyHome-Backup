	with obj_player
	{
		state = states.actor;
		image_blend = make_colour_hsv(0, 0, 255);
		hsp = 0;
		movespeed = 0;
		flash = false;
	}
	flamey -= 4;
	if introshake > 0
		introshake -= introshake_acc;
	var a = 0.1;
	if arenabuffer > 0
		arenabuffer--;
	else
	{
		switch arenastate
		{
			case 0:
				if (playerx <= 10 && playerx2 <= 5)
				arenastate++;
				break;
			case 1:
				var btx = 960;
				bossx = lerp(bossx, btx, a);
				break;
			case 2:
				whitefade += 0.02;
				if whitefade >= 2
				{
					whitefade = 0;
					arenastate++;
					arenabuffer = 300;
					introshake = 20;
					introshake_acc = 0.5;
				}
				break;
			case 3:
				state = states.normal;
				with obj_player
				{
					state = states.actor;
					hsp = 0;
					movespeed = 0;
					flash = false;
				}
				break;
		}
	}
