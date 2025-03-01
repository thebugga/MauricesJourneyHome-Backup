if (fadealpha > 1 && (!fadein))
{
	if obj_pause.pause
	{
		instance_activate_all()
		scr_deactivate_escape()
		alarm[0] = 1
	}
	else if (!obj_pause.pause)
	{
		var guisurface = obj_drawfixer.gui_surf
		obj_pause.appsprite = sprite_create_from_surface(application_surface, 0, 0, 960, 540, 0, 0, 0, 0)
		obj_pause.guisprite = sprite_create_from_surface(guisurface, 0, 0, surface_get_width(guisurface), surface_get_height(guisurface), false, false, 0, 0)
		instance_deactivate_all(true)
		instance_activate_object(obj_pause)
		instance_activate_object(obj_drawfixer)
		instance_activate_object(obj_inputAssigner)
	}
	obj_pause.pause = (!obj_pause.pause)
	fadein = 1
}
fadealpha += ((!fadein) ? 1 : -1)
if (fadein && fadealpha < 0)
	instance_destroy()
