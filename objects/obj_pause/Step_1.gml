if instance_exists(obj_shell)
{
	if obj_shell.isOpen
		exit;
}
if instance_exists(obj_options) || instance_exists(obj_characterselect)
	exit;
	
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter))
{
	if !pause
	{
		pause = true
		pause_image = make_pause_image()
		video_pause()
		instance_deactivate_all(true)
		audio_pause_all()
	}
	else
	{
		pause = false
		instance_activate_all()
		video_resume()
		audio_resume_all()
	}
}
