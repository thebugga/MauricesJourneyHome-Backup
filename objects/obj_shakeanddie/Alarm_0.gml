with (instance_create(x, y, obj_enemycorpse))
{
	event_play_oneshot("event:/sfx/enemies/kill")
    sprite_index = other.sprite_index
    image_xscale = other.image_xscale
}
instance_destroy()
