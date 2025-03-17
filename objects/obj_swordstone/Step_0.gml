var _player = (obj_player1.spotlight ? obj_player1 : obj_player2)
if (room == rm_editor)
	exit;
if _player.state == states.knightpep || _player.state == states.knightpepslopes || (_player.state == states.chainsaw && (_player.tauntstoredstate == states.knightpep || _player.tauntstoredstate == states.knightpepslopes))
	visible = false
else
	visible = true
if (visible && (!instance_exists(ID)))
{
	with (instance_create(x, (y - 20), obj_grabmarker))
		other.ID = id
}
else if (!visible && instance_exists(ID))
	instance_destroy(ID)
