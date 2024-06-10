switch type
{
	case afterimages.mach3:
		image_alpha = lerp(image_alpha, 0.5, 0.1);
		image_blend = choose(c_red, c_green);
		mach3_timer -= 0.1;
		if (mach3_timer <= 0)
			instance_destroy();
		break;
	case afterimages.pizzaface:
		image_alpha -= 0.1;
		if (image_alpha <= 0)
			instance_destroy();
		break;
}
