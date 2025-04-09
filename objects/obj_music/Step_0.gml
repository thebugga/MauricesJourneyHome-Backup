prevpillar_on_camera = pillar_on_camera;
if (instance_exists(obj_pillar))
{
	fmod_studio_event_instance_set_paused(pillarmusicID, false);
	var p = false;
	with obj_pillar
	{
		if (bbox_in_camera(view_camera[0], 0))
			p = true;
	}
	if p != pillar_on_camera
		pillar_on_camera = p;
}
else
	pillar_on_camera = false;
if prevpillar_on_camera != pillar_on_camera
{
	if pillar_on_camera
		fmod_studio_system_set_parameter_by_name("pillarfade", 1, false);
	else
		fmod_studio_system_set_parameter_by_name("pillarfade", 0, false);
}
if global.panic.active
{
	if !panicstart
	{
		trace("Starting panic music: step");
		panicstart = true;
		fmod_studio_event_instance_start(panicmusicID);
		fmod_studio_event_instance_set_paused(panicmusicID, false);
		fmod_studio_event_instance_set_parameter_by_name_multiplatform(panicmusicID, "state", 0, true);
		if music != -4
		{
			fmod_studio_event_instance_stop(music.event, true);
			fmod_studio_event_instance_stop(music.event_secret, true);
		}
		fmod_studio_event_instance_stop(pillarmusicID, true);
		fmod_studio_system_set_parameter_by_name("pillarfade", 0, true);
		fmod_studio_event_instance_set_parameter_by_name_multiplatform(panicmusicID, "state", 0, true);
	}
	else if (event_instance_isplaying(panicmusicID))
	{
		if global.lap.active == false
		{
			var secs = 56;
			if (fmod_event_getParameter("character") >= 1)
				secs = 65;
			if global.panic.timer <= secs * 12
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(panicmusicID, "state", 1, true);
		}
		else
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(panicmusicID, "state", 2, true);
	}
}
else
{
	panicstart = false;
	fmod_studio_event_instance_stop(panicmusicID, true);
}
var _found = false;
if (exitmusic && event_instance_isplaying(panicmusicID))
	fmod_studio_event_instance_stop(panicmusicID, true);
