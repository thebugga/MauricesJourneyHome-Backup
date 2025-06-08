if string_copy(room_get_name(room), 1, 5) == "tower"
	pausearray = [["RESUME", function() 
		{
			pause = false
			instance_activate_all()
			video_resume()
			audio_resume_all()
		}], ["OPTIONS", function() 
		{
				instance_create_depth(x, y, depth - 1, obj_options)
		}], ["SELECT CHARACTER", function() 
		{
				instance_create_depth(x, y, obj_pause.depth - 1, obj_characterselect)
		}], ["SAVE & QUIT", function() 
		{
			audio_stop_all()
			stop_music()
			instance_activate_all()
			video_resume()
			start_wiping()
			pause = false
		
			save_game()
			reset_level()
			with obj_player
			{
				spawn = "a"
				door_type = fade_types.none
				room_goto(mainmenu)
				state = states.actor
			}
		}]]
else
	pausearray = [["RESUME", function() 
	{
		pause = false
		instance_activate_all()
		video_resume()
		audio_resume_all()
	}], ["RESTART", function() 
	{
		audio_stop_all()
		stop_music()
		instance_activate_all()
		video_resume()
		start_wiping()
		pause = false
		
		reset_level()
		with obj_player
		{
			hsp = 0
			vsp = 0
			movespeed = 0
			spawn = restart_location.door
			door_type = fade_types.none
			room_goto(restart_location.room)
			state = states.actor
			reset_anim(obj_player.spr_exitdoor)
			image_speed = 0.35
		}
	}], ["OPTIONS", function() 
	{
			instance_create_depth(x, y, obj_pause.depth - 1, obj_options)
	}], ["EXIT LEVEL", function() 
	{
		audio_stop_all()
		stop_music()
		instance_activate_all()
		video_resume()
		start_wiping()
		pause = false
		
		reset_level()
		with obj_player
		{
			hsp = 0
			vsp = 0
			movespeed = 0
			spawn = noone
			x = return_location.x
			y = return_location.y
			door_type = fade_types.none
			room_goto(return_location.room)
			state = states.actor
			reset_anim(obj_player.spr_exitdoor)
			image_speed = 0.35
		}
	}]]