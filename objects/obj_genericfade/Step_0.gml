if fadein
{
	fade = approach(fade, maxfade, accel);
	if fade >= maxfade
		fadein = false;
}
else
{
	fade = approach(fade, 0, deccel);
	if fade <= 0
		instance_destroy();
}
