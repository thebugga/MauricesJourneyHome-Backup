draw_self()
var player = instance_place(x, y - 2, obj_player)
if player
{
	draw_text(x, y, player.bbox_bottom - player.vsp <= bbox_top)
	draw_text(x, y + 16, player.movespeed)
	draw_text(x, y + 32, player.grounded)
}