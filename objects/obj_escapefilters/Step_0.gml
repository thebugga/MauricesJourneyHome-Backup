if flashAlpha > 0
	flashAlpha -= 0.09

for (var i = 0; i < array_length(paniclayers); i++)
{
	var bg_id = paniclayers[i]
	
	layer_set_visible(bg_id[0], bg_id[1] == global.panic.active)
}

x_scroll++
y_scroll++