if (ready == 0)
{
    if (selected == 0)
    {
        draw_sprite(spr_player1cursor, -1, 344, 94)
    }
    if (selected == 1)
    {
        draw_sprite(spr_player1cursor, -1, 528, 94)
    }
    if (selected == 2)
    {
        draw_sprite(spr_player1cursor, -1, 448, 256)
    }
}
else
{
    if (selected == 0)
    {
        draw_sprite(spr_player1cursorselected, -1, 344, 94)
    }
    if (selected == 1)
    {
        draw_sprite(spr_player1cursorselected, -1, 528, 94)
    }
    if (selected == 2)
    {
        draw_sprite(spr_player1cursorselected, -1, 448, 256)
    }
}
