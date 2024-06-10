scr_collision()
switch state
{
	case states.move:
		scr_enemy_move();
		break;

}
instance_create(x,y,obj_kinfebox)