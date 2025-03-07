scr_collision()
fmod_event_set3DPosition(snd, x, y)
if (obj_player1.sprite_index != obj_player1.spr_breakdance)
{
    instance_create(x, y, obj_genericpoofeffect)
	fmod_studio_system_set_parameter_by_name("musicmuffle", 0, 0)
    instance_destroy()
}
else
{
	fmod_studio_system_set_parameter_by_name("musicmuffle", 1, 0)
}