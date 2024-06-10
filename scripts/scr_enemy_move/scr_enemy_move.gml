
function scr_enemy_move(){
	sprite_index = spr_move
	if ((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1) || place_meeting((x + hsp), y, obj_hallway))
	{
	   image_xscale *= -1
	}
	hsp = (image_xscale * movespeed)
}