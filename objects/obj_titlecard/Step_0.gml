fracturescale = approach(fracturescale, showing, 0.05)
fractureangle += fracturescale == 1 ? 0.25 : 10
if fracturescale != 0
	cardx += fracturescale == 1 ? 1 : 50
creditalpha = approach(creditalpha, creditshow, 0.1)
if showing
{
	pinholescale = lerp(pinholescale, 1, 0.075)
	if fracturescale == 1 && alarm[2] <= 0
		alarm[2] = 150
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
				fmod_event_one_shot("event:/sfx/misc/breakmetal")
			}
		}
		else
			wipshake = approach(wipshake, 0, 1)
	}
}
else
{
	playeroff = lerp(playeroff, 0, 0.1)
	if cardx > 0
	{
		pinholescale += 0.05
		pinholealpha -= 0.05
		if fracturescale == 0
			instance_destroy()
	}
}