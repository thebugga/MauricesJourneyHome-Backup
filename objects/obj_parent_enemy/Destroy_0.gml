if (room == rm_editor)
    return;
if (ds_list_find_index(global.baddieroom, id) == -1 && ((!elite) || elitehit <= 0) && destroyable)
{
        with (instance_create(x, y, obj_deatheffect))
        {
            sprite_index = other.spr_dead
            spr_palette = other.spr_palette
            paletteselect = other.paletteselect
            usepalette = other.usepalette
            if (!usepalette)
                paletteselect = 0
            image_alpha = other.image_alpha
        }
}
if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
    if (global.prank_cankillenemy && (!global.prank_enemykilled))
    {
        global.prank_enemykilled = 1
        trace("W Rank started!")
    }
    if (!instance_exists(obj_bosscontroller))
    {
        if ((!elite) || elitehit <= 0)
        {
            with (obj_player1)
                supercharge += 1
        }
        if ((!elite) || elitehit <= 0)
        {
            global.combo += 1
            global.enemykilled += 1
            global.combotime = 60
        }
        if instance_exists(obj_hardmode)
            global.heatmeter_count++
        if ((!elite) || elitehit <= 0)
        {
            var combototal = (10 + floor((global.combo * 0.5)))
            global.collect += combototal
            global.comboscore += combototal
        }
    }
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    repeat (3)
    {
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
        }
    }
    instance_create(x, y, obj_bangeffect)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    if (object_index == obj_miniufo)
        instance_create(x, y, obj_playerexplosion)
    ds_list_add(global.baddieroom, id)
    if escape
        ds_list_add(global.escaperoom, id)
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
    trace("destroy unimportant")
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (3 / room_speed)
    }
    ds_list_add(global.baddieroom, id)
}
