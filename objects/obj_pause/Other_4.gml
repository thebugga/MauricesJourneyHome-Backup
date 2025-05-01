if string_copy(room_get_name(room), 1, 5) == "tower"
	pausearray = [["RESUME", function() 
		{
			audio_stop_sound(mu_pause)
			pause = false
			instance_activate_all()
			audio_resume_all()
		}], ["OPTIONS", function() 
		{
				instance_create_depth(x, y, depth - 1, obj_options)
		}], ["SELECT CHARACTER", function() 
		{
				instance_create_depth(x, y, obj_pause.depth - 1, obj_characterselect)
		}], ["SAVE & QUIT", function() 
		{
			game_end()
		}]]
else
	pausearray = [["RESUME", function() 
	{
		audio_stop_sound(mu_pause)
		pause = false
		instance_activate_all()
		audio_resume_all()
	}], ["RESTART", function() 
	{
		start_wiping()
		audio_stop_all()
		with obj_music
		{
			fmod_event_instance_stop(music.event, true);
			fmod_event_instance_stop(music.event_secret, true);
		}
		pause = false
		instance_activate_all()
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
		}
	}], ["OPTIONS", function() 
	{
			instance_create_depth(x, y, obj_pause.depth - 1, obj_options)
	}], ["EXIT LEVEL", function() 
	{
		start_wiping()
		audio_stop_all()
		with obj_music
		{
			fmod_event_instance_stop(music.event, true);
			fmod_event_instance_stop(music.event_secret, true);
		}
		pause = false
		instance_activate_all()
		
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
		}
	}]]