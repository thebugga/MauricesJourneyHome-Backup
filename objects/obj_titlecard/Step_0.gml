fracturescale = approach(fracturescale, showing, 0.05)
fractureangle += fracturescale == 1 ? 0.25 : 10
if fracturescale != 0
	cardx += fracturescale == 1 ? 1 : 50
creditalpha = approach(creditalpha, creditshow, 0.1)
if showing
{
	if fracturescale == 1 && alarm[2] <= 0
		alarm[2] = 100
	playeroff = lerp(playeroff, 10, 0.1)
	if /*image_index == 0 &&*/ wipshow
	{
		if wipscale > 1
		{
			wipscale -= 0.2
			wipangle += 5
			if wipscale == 1
			{
				wipshake = 20
				event_play_oneshot("event:/sfx/misc/breakmetal")
			}
		}
		else
			wipshake = approach(wipshake, 0, 1)
	}
}
else
playeroff = lerp(playeroff, 0, 0.1)
if fracturescale == 0 && cardx > 0
	instance_destroy()