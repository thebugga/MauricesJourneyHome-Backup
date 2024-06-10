if (image_alpha < 1 && !debounce)
	image_alpha += 0.1;
else if (image_alpha >= 1 && !debounce)
{
	    target_door = other.target_door;
		if (room != obj_player.target_room)
		{
			var r = room;
			room_goto(obj_player.target_room)
			with (obj_player)
			{
					visible = true;
					state = states.normal;
			}
		}
		obj_player.y = obj_doorA.y - 15
		obj_player.x = obj_doorA.x 
}
else if (image_alpha > 0 && debounce)
	image_alpha -= 0.1;