x = obj_parent_player.x
y = ((sprite_get_bbox_top(obj_parent_player.sprite_index) + obj_parent_player.y) - 40)
image_xscale = obj_parent_player.xscale
if (obj_parent_player.state == states.knightpepslopes or obj_parent_player.state == states.knightpep or room == rank_room)
	visible = false
else if (global.cowboyhat == 1)
	visible = true
else
	visible = false
