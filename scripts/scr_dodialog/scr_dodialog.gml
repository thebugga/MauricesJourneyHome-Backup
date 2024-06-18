function do_dialog(argument0, argument1, argument2) //do_dialog
{
    with (instance_create(x, y, obj_dialogcontroller))
    {
        npcID = other.id
        dialogsidel = argument1
        dialogsider = argument2
        dialog = argument0
        dialogcharacter = dialog[0][1]
        dialogexpression = dialog[0][2]
        currenttext = scr_calculate_text(dialog[0][0])
        dialogheight = scr_calculate_height(currenttext)
    }
    with (obj_player)
    {
        sprite_index = spr_idle
        image_speed = 0.35
        state = states.actor
        hsp = 0
        vsp = 0
        movespeed = 0
    }
}

function npc_do_dialog() //npc_do_dialog
{
    do_dialog(dialog,dialogsidel,dialogsider)
}

function do_dialog_cutscene(argument0, argument1=0, argument2=0) //do_dialog_cutscene
{
    with (instance_create(argument1, argument2, obj_cutscene_handler))
    {
        scene_info = argument0
        for (var i = 0; i < array_length(scene_info); i++)
            scene_info[i][0] = method(id, scene_info[i][0])
    }
}

