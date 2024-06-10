	var player = obj_player.id;
	if (player.x > (x - 400) && player.x < (x + 400) && player.y > (y - 300) && player.y < (y + 300)) 
		sprite_index = spr_pizzaboy_worry;
	else
		sprite_index = spr_pizzaboy;
		