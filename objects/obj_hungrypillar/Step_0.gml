if (room == rm_editor)
	exit;
var player = instance_nearest(x, y, obj_player)
if (player.x > (x - 400) && player.x < (x + 400) && player.y >= bbox_top && player.y <= bbox_bottom && ((player.xscale > 0 && x >= player.x) or (player.xscale < 0 && x <= player.x)))
{
	if (sprite_index != spr_hungrypillar_angry && (player.state == states.chainsawbump or player.state == states.mach3 or player.state == states.rideweenie or player.state == states.rocket or player.state == states.tacklecharge or player.state == states.knightpepslopes or (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
	{
		sprite_index = spr_hungrypillar_angry
		scaredbuffer = 100
	}
}
if scaredbuffer > 0
	scaredbuffer--
else
	sprite_index = spr_hungrypillar
for (var i = 0; i < image_yscale; i++)
{
	var spr = sprite_get_name(sprite_index)
	spr = asset_get_index(concat(spr, totem_face[i]))
	if (spr > -1)
	{
		totem_index[i] += 0.35
		if floor(totem_index[i]) >= (sprite_get_number(spr))
			totem_index[i] = 0
	}
}