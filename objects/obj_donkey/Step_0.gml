if (cooldown > 0)
	cooldown--
if (sprite_index == spr_cowkick)
{
	if (animation_end())
		sprite_index = spr_cowidle
}
else if blink
{
	image_index = 1
	blink = 0
}
else
	image_index = 0
