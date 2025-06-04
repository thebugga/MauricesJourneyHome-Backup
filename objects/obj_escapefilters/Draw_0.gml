if (flash == global.panic.active)
{
	depth = 300
	draw_set_alpha(flashAlpha);
	draw_set_color(c_white);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
}
if (obj_player.character == p_characters.undoised && global.panic.active)
{
	depth = 150
	//if !sprite_islocated(0,0,0,0,x_scroll,y_scroll,bg_doiseescapefilter)
	draw_sprite_tiled_ext(bg_doiseescapefilter,-1,x_scroll,y_scroll,1,1,c_white,0.7)
}
