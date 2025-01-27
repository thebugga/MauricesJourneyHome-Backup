function scr_player_changeCharacter(argument0 = obj_player1, argument1)
{
    with (argument0)
    {
        global.playerCharacter = argument1;
        scr_characterspr();
    }
}