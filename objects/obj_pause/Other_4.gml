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
		audio_stop_sound(mu_pause)
		pause = false
		instance_activate_all()
		audio_resume_all()
		start_wiping()
	}], ["OPTIONS", function() 
	{
			instance_create_depth(x, y, obj_pause.depth - 1, obj_options)
	}], ["EXIT LEVEL", function() 
	{
		start_wiping()
		audio_stop_sound(mu_pause)
		pause = false
		instance_activate_all()
		audio_resume_all()
		reset_level()

		with obj_player
		{
			spawn = noone
			state = states.backtohub
			vsp = 0
			rotation = 0
			sprite_index = spr_slipbanana1
			x = return_location.x
			y = return_location.y
			room_goto(return_location.room)
		}

		instance_create(0, 0, obj_fadevisual)
	}]]