function scr_enemy_idle() //gml_Script_scr_enemy_idle
{
    hsp = 0
    if (vsp > 1 && (grounded || (grounded && (!(place_meeting(x, y, obj_platform))))))
    {
        create_particle(x, y, (12 << 0), 0)
        image_index = 0
    }
    if ((vsp >= 0 || object_index == obj_miniufo || object_index == obj_kentukybomber) && sprite_index == scaredspr && scaredbuffer <= 0)
    {
        state = states.walk
        sprite_index = walkspr
    }
    if (scaredbuffer > 0)
        scaredbuffer -= 1
    if (sprite_index == spr_forknight_turn && animation_end())
    {
        sprite_index = walkspr
        state = states.walk
    }

    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp += (_railinst.movespeed * _railinst.dir)
    }
    image_speed = 0.35
}

