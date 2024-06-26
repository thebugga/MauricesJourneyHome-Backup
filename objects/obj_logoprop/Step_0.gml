var d = 0.03;
input_get();
if key_jump2
{
	if alarm[1] > 0
		event_perform(2, 1);
	instance_destroy();
}
if fadein
	image_alpha = Approach(image_alpha, 1, d);
else
{
	image_alpha = Approach(image_alpha, 0, d);
	if image_alpha <= 0
		instance_destroy();
}
