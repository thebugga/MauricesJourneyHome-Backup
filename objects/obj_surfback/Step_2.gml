var target = obj_player1.id;
image_speed = obj_player1.image_speed;
if global.swapmode && obj_player1.character == "P"
	target = obj_swapmodefollow.id;
x = target.x;
y = target.y;
if target == obj_player1.id
{
	image_xscale = (target.Xscale * target.scale_xs);
	image_yscale = (target.yscale * target.scale_ys);
}
else
{
	image_xscale = target.image_xscale;
	image_yscale = target.image_yscale;
}
visible = target.visible;
image_alpha = target.image_alpha;
image_blend = target.image_blend;
depth = 0;
instance_destroy();
if ((target == obj_player1.id && (obj_player1.state == states.slipnslide || obj_player1.state == states.trashjump)) || room == rank_room)
	visible = false;
visible = false;
