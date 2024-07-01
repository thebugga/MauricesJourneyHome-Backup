function scr_panicbg_start()
{
	if (!variable_global_exists("panicbg_surface") || !surface_exists(global.panicbg_surface))
		global.panicbg_surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	if event_type == ev_draw && event_number == 0
	{
		surface_set_target(global.panicbg_surface);
		draw_clear_alpha(0, 0);
		var _cam_x = camera_get_view_x(view_camera[0]);
		var _cam_y = camera_get_view_y(view_camera[0]);
		var bg1 = layer_get_id("Backgrounds_1");
		var bg2 = layer_get_id("Backgrounds_2");
		var bg3 = layer_get_id("Backgrounds_3")
		var bg4 = layer_get_id("Backgrounds_scroll");
		var bg5 = layer_get_id("Backgrounds_scroll2");
		var bg6 = layer_get_id("Backgrounds_scroll3");
		var bg7 = layer_get_id("Backgrounds_scroll4");
		var bg8 = layer_get_id("Backgrounds_still1");
		var bg9 = layer_get_id("Backgrounds_still2");
		var bg10 = layer_get_id("Backgrounds_stillH1");
		var bg11 = layer_get_id("Backgrounds_stillH2");
		var bg12 = layer_get_id("Backgrounds_stillH3");
		var bg13 = layer_get_id("Backgrounds_stillH4");
		var bg14 = layer_get_id("Backgrounds_zigzag1");
		var bg15 = layer_get_id("Backgrounds_zigzag2");
		var bg16 = layer_get_id("Backgrounds_stillZH1");
		var bg37 = layer_get_id("Backgrounds_stillZH2")
		layer_x(bg1, layer_get_x(bg1) - _cam_x);
		layer_y(bg1, layer_get_y(bg1) - _cam_y);
		layer_x(bg2, layer_get_x(bg2) - _cam_x);
		layer_y(bg2, layer_get_y(bg2) - _cam_y);
		layer_x(bg3, layer_get_x(bg3) - _cam_x);
		layer_y(bg3, layer_get_y(bg3) - _cam_y);
		layer_x(bg4, layer_get_x(bg4) - _cam_x);
		layer_y(bg4, layer_get_y(bg4) - _cam_y);
		layer_x(bg5, layer_get_x(bg5) - _cam_x);
		layer_y(bg5, layer_get_y(bg5) - _cam_y);
		layer_x(bg6, layer_get_x(bg6) - _cam_x);
		layer_y(bg6, layer_get_y(bg6) - _cam_y);
		layer_x(bg7, layer_get_x(bg7) - _cam_x);
		layer_y(bg7, layer_get_y(bg7) - _cam_y);
		layer_x(bg8, layer_get_x(bg8) - _cam_x);
		layer_y(bg8, layer_get_y(bg8) - _cam_y);
		layer_x(bg9, layer_get_x(bg9) - _cam_x);
		layer_y(bg9, layer_get_y(bg9) - _cam_y);
		layer_x(bg10, layer_get_x(bg10) - _cam_x);
		layer_y(bg10, layer_get_y(bg10) - _cam_y);
		layer_x(bg11, layer_get_x(bg11) - _cam_x);
		layer_y(bg11, layer_get_y(bg11) - _cam_y);
		layer_x(bg12, layer_get_x(bg12) - _cam_x);
		layer_y(bg12, layer_get_y(bg12) - _cam_y);
		layer_x(bg13, layer_get_x(bg13) - _cam_x);
		layer_y(bg13, layer_get_y(bg13) - _cam_y);
		layer_x(bg14, layer_get_x(bg14) - _cam_x);
		layer_y(bg14, layer_get_y(bg14) - _cam_y);
		layer_x(bg15, layer_get_x(bg15) - _cam_x);
		layer_y(bg15, layer_get_y(bg15) - _cam_y);
		layer_x(bg16, layer_get_x(bg16) - _cam_x);
		layer_y(bg16, layer_get_y(bg16) - _cam_y);
	}
}
