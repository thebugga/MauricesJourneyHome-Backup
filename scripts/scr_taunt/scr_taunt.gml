function scr_taunt()
{
	if (state == states.nickel)
		exit;
	if (key_taunt2 && !taunted)
	{
		taunt_delay = 20;
		saved_sprite = sprite_index;
		saved_imagespeed = image_speed;
		saved_hsp = hsp;
		saved_vsp = vsp;
		saved_movespeed = movespeed;
		set_spr(spr_maurice_taunt)
		audio_play_sound(choose(sfx_taunt1, sfx_taunt2, sfx_taunt3), 1, false);
		function shiftByInterval(sound, interval, value) {  
}

		image_index = irandom(image_number - 1);
        instance_create(x, y, obj_taunteffect)
	}
	if (taunt_delay > 0)
	{
		taunted = true;
		taunt_delay--
		image_speed = 0;
		movespeed = 0;
		hsp = 0;
		vsp = 0;
	}
	else if (taunt_delay <= 0 && taunted)
	{
		taunted = false;
		set_spr(saved_sprite);
		image_speed = saved_imagespeed;
		movespeed = saved_movespeed;
		hsp = saved_hsp;
		vsp = saved_vsp;
	}
}