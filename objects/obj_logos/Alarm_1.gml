array_push(stickerray,
{
	index : irandom(sprite_get_number(spr_voyagelogo_sticker) - 1),
	scale : 2
}
)
if array_length(stickerray) < 4
	alarm[1] = 20