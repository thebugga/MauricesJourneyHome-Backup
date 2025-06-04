if flashAlpha > 0
	flashAlpha -= 0.09

for (var i = 0; i < array_length(paniclayers); i++)
{
	var bg_id = layer_get_id(paniclayers[i][0])
	
	layer_set_visible(bg_id, paniclayers[i][1] == global.panic.active)
}

x_scroll++
y_scroll++