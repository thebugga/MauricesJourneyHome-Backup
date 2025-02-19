if (text_pos >= array_length(text))
{
	if slowscore >= approachscore
	{
		slowscore = approachscore
		instance_create((room_width / 2), (room_height / 2), obj_rank)
		if instance_exists(obj_treasureviewer)
			exit;
		obj_player1.visible = false
		obj_player2.visible = false
		if (global.collect >= global.collectN)
		{
			with (instance_create(obj_player2.x, obj_player2.y, obj_dashcloud))
				sprite_index = spr_bombexplosion
			repeat (6)
				instance_create(obj_player2.x, obj_player2.y, obj_baddiegibs)
		}
		if (global.collectN > global.collect)
		{
			with (instance_create(obj_player1.x, obj_player1.y, obj_dashcloud))
				sprite_index = spr_bombexplosion
			repeat (6)
				instance_create(obj_player1.x, obj_player1.y, obj_baddiegibs)
			//scr_soundeffect(sfx_explosion)
		}
	}
	else
	{
		var sub = 0
		for (var i = 0; i < array_length(text); i++)
		{
			if (text[i][0])
				sub += 40
		}
		slowscore += (approachscore / (320 - sub))
		alarm[0] = 1
	}
}
else
{
	if text[text_pos][2] > 0
	{
		with (obj_camera)
		{
			shake_mag = 2
			shake_mag_acc = 3 / room_speed
		}
		//scr_soundeffect(sfx_killingblow)
		text[text_pos][0] = true
		text_pos++
		alarm[0] = 40
	}
	else
	{
		text_pos++
		alarm[0] = 1
	}
}