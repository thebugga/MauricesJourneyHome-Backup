var gate = id;
with other
{
	if (place_meeting(x, y, other) && key_up && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.victory && state != states.comingoutdoor && spotlight == 1)
	{
		audio_stop_all();
		
		global.collect = 0;
		global.startgate = true;
		global.leveltosave = other.level;
		global.leveltorestart = other.targetRoom;
		global.levelattempts = 0;
		backtohubstartx = x;
		backtohubstarty = y;
		backtohubroom = room;
		mach2 = 0;
		obj_camera.chargecamera = 0;
		image_index = 0;
		state = states.victory;
		instance_create_unique(x, y, obj_doortransition)
		obj_player.sprite_index = spr_entergate                                                                                       
		obj_player2.backtohubstartx = x;
		obj_player2.backtohubstarty = y;
		obj_player2.backtohubroom = room;
		if global.coop == 1
		{
			with obj_player2
			{
				x = obj_player1.x;
				y = obj_player1.y;
				mach2 = 0;
				obj_camera.chargecamera = 0;
				image_index = 0;
				state = states.victory;
			}
		}
		exit;
	}
}
if ((floor(obj_player1.image_index) == (obj_player1.image_number - 1) && obj_player1.state == states.victory) || (floor(obj_player2.image_index) == (obj_player2.image_number - 1) && obj_player2.state == states.victory))
{
	with obj_player
	{
		obj_music.fadeoff = 0;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		{
			with (instance_create_unique(0, 0, obj_fadeout))
				restarttimer = true;     
		}
	}
}
