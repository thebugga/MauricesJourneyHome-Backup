if (flashActive && global.panic.active) {
	draw_set_alpha(flashAlpha);
	draw_set_color(c_white);
	draw_rectangle(0, 0, room_width, room_height, false);
    flashTimer -= room_speed;
    if (flashTimer <= 0) {
        flashActive = false;
    }
}
