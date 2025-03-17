var _actor = false;
var door = id;
with obj_parent_player
{
	if state == states.actor
		_actor = true;
}
if _actor
	exit;
if (!place_meeting(x, y, obj_doorblocked))
{
	with other
	{
		if (key_up && !instance_exists(obj_jumpscare) && grounded && (((state == states.ratmount || state == states.ratmountbounce) && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			event_play_oneshot("event:/sfx/misc/door");
			obj_camera.chargecamera = 0;
			ds_list_add(global.saveroom, id);
			with obj_parent_player
			{
				if global.playerCharacter == Characters.Pierre
					obj_player1.sprite_index = spr_ratmount_enterdoor;
				else
					obj_player1.sprite_index = obj_player1.spr_lookdoor;
				image_index = 0;
				if state != states.gotoplayer
					state = states.door;
				mach2 = 0;
				targetRoom = lastroom
			}
			if (instance_exists(obj_player2) && global.coop == 1)
			{
				if object_index == obj_player2
				{
					obj_player1.x = obj_player2.x;
					obj_player1.y = obj_player2.y;
				}
				if object_index == obj_player1
				{
					obj_player2.x = obj_player1.x;
					obj_player2.y = obj_player1.y;
				}
			}
			with obj_player2
			{
				if (instance_exists(obj_swapmodefollow))
					state = states.gotoplayer;
			}
			other.visited = true;
			if (ds_list_find_index(global.saveroom, other.id) == -1)
				ds_list_add(global.saveroom, other.id);
			instance_create(x, y, obj_fadeout)
		}
	}
}