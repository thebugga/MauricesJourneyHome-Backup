if fadein
{
    fadealpha = approach(fadealpha, 1, 0.03)
    if (fadealpha >= 1)
    {
        if (!instance_exists(obj_player1))
            instance_activate_object(obj_parent_player)
        else
        {
            fadein = false
            //obj_player1.targetRoom = obj_player1.backtohubroom
            //obj_player2.targetRoom = obj_player1.backtohubroom
            //room_goto(obj_player1.backtohubroom)
			room_goto(rm_levelselect)
        }
    }
}
else
    fadealpha = approach(fadealpha, 0, 0.03)
