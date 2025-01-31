x = playerid.x
y = sprite_get_bbox_top(playerid.sprite_index) + playerid.y - 40
image_xscale = playerid.xscale
visible = !(playerid.state == states.knightpepslopes || playerid.state == states.knightpep || room == rank_room)