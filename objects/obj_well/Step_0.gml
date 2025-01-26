if ((!instance_exists(ID)) && obj_parent_player.state != states.mortattack && obj_parent_player.state != states.mort && obj_parent_player.state != states.mortjump && obj_parent_player.state != states.morthook && place_meeting(x, y, obj_parent_player))
{
	instance_destroy(obj_mort)
	with (instance_create(x, (y - 50), obj_mort))
		other.ID = id
}
