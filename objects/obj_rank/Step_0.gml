if (animation_end())
	image_speed = 0
if (global.playerCharacter == Characters.Maurice)
{
	if (global.rank == "s")
		sprite_index = spr_rankS
	if (global.rank == "a")
		sprite_index = spr_rankA
	if (global.rank == "b")
		sprite_index = spr_rankB
	if (global.rank == "c")
		sprite_index = spr_rankC
	if (global.rank == "d")
		sprite_index = spr_rankD
	if (global.rank == "p")
		sprite_index = spr_rankP
}
else
{
	if (global.rank == "s")
		sprite_index = spr_rankNS
	if (global.rank == "a")
		sprite_index = spr_rankNA
	if (global.rank == "b")
		sprite_index = spr_rankNB
	if (global.rank == "c")
		sprite_index = spr_rankNC
	if (global.rank == "d")
		sprite_index = spr_rankND
	if (global.rank == "p")
		sprite_index = spr_rankP
}
bg_x -= 1;
bg_y -= 1;

if obj_endlevelfade.receiptonscreen
{
	bg_alpha = approach(bg_alpha, 1, 0.02)
}
