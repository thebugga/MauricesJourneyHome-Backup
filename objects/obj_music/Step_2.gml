if instance_exists(obj_player1)
{
    if (obj_player1.ispeppino)
        fmod_set_parameter("isnoise", 0, true)
    else
        fmod_set_parameter("isnoise", 1, true)
}
