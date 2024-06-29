if image_index == 1 && global.panic == false
{
	with obj_player
	{
		if (state == states.comingoutdoor && floor(image_index) == image_number - 2)
		{
			GamepadSetVibration(0, 1, 1, 0.9);
			GamepadSetVibration(1, 1, 1, 0.9);
			with obj_player1
			{
				lastroom = room;
				sprite_index = spr_Timesup;
				image_index = 0;
				with obj_camera
				{
					shake_mag = 10;
					shake_mag_acc = 30 / room_speed;
				}
			}
			if global.coop == 1
			{
				with obj_player2
				{
					lastroom = room;
					sprite_index = spr_Timesup;
					image_index = 0;
					with obj_camera
					{
						shake_mag = 10;
						shake_mag_acc = 30 / room_speed;
					}
				}
			}
			other.image_index = 0;
			ds_list_add(global.saveroom, other.id);
		}
	}
}
if drop && dropstate != states.idle
	exit;
with obj_player
{
	if (grounded && (x > (other.x - 160) && x < (other.x + 160)) && key_up && (state == states.normal || state == states.Sjumpprep || state == states.mach1 || state == states.mach2 || state == states.mach3) && (global.panic == true || global.snickchallenge == 1 || other.random_secret))
	{
		global.noisejetpack = false;
		global.startgate = false;
		if global.collect <= 0
			global.collect = 10;
	}
}
