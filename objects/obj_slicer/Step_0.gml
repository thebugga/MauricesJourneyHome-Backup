scr_collision()
switch state
{
	case states.move:
		scr_enemy_move();
		break;

}
instance_create(x,y,obj_kinfebox)
if boundbox == 0
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
