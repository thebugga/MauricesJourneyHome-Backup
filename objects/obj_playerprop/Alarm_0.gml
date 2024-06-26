with (instance_create(x, y, obj_playereffectprop))
{
	sprite_index = other.sprite_index;
	image_index = other.image_index - 1;
	depth = other.depth + 1;
	hsp = other.fake_hsp;
}
alarm[0] = 5;
