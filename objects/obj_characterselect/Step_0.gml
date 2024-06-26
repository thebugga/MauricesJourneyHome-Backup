image_speed = 0.35
if ((obj_player1.key_right2) && selected == 0 && ready == 0 ||(obj_player1.key_right2) && selected == 1 && ready == 0 )
{
    selected += 1
}
if ((obj_player1.key_left2) && selected == 2 && ready == 0||(obj_player1.key_left2) && selected == 1 && ready == 0 )
{
    selected -= 1
}
if (obj_player1.key_attack && selected == 0)
{
    ready = 1
    obj_peppinoselect.image_index = 0
    with (obj_player1)
    {
        character = "M"
        scr_characterspr()
    }
    with (obj_player2)
    {
        character = "D"
        scr_characterspr()
    }
    alarm[0] = 100
}
if (obj_player1.key_attack && selected == 1)
{
    ready = 1
    obj_noiseselect.image_index = 0
    with (obj_player1)
    {
        character = "D"
        scr_characterspr()
    }
    alarm[0] = 100
}
if (obj_player1.key_attack && selected == 2)
{
    ready = 1
    obj_noiseselect.image_index = 0
    with (obj_player1)
    {
        character = "C"
        scr_characterspr()
    }
    alarm[0] = 100
}
