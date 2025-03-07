scr_collision();
fmod_event_set3DPosition(snd, x, y);
if obj_swapmodefollow.sprite_index != obj_swapmodefollow.spr_breakdance
{
	instance_create(x, y, obj_genericpoofeffect);
	instance_destroy();
}
