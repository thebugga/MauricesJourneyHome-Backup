with (instance_create(x, y, obj_enemycorpse))
{
    image_xscale = other.image_xscale
    sprite_index = spr_peppinobullet_dead
    vsp = random_range(-3, -6)
    hsp = (-image_xscale) * 4
}