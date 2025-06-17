function cutscene_wait(argument0)
{
	timer++
	if (timer >= argument0)
	{
		timer = 0
		scene++
	}
	exit;
}


function cutscene_do_dialog(argument0, argument1, argument2)
{
	if timer
	{
		if !instance_exists(obj_dialogcontroller)
		{
			timer = 0
			scene++
		}
	}
	else
	{
		do_dialog(argument0, argument1, argument2)
		timer = true
	}
	exit;
}
function do_dialog(texts = dialog, chars = dialogchars) //do_dialog
{
    with (instance_create(x, y, obj_dialogcontroller))
    {
        npcID = other.id
        dialog = texts
		for (var xx = 0; xx < 2; xx++)
		{
			for (var yy = 0; yy < 4; yy++)
			{
				if chars[xx][yy] != -4
					dialogchars[xx][yy] = {
						sprite: 0,
						index: 0,
						character: chars[xx][yy],
						expression: 0,
						blinktime: irandom(500)
					}
			}
		}
    }
    with (obj_player)
    {
        sprite_index = spr_idle
        image_speed = 0.35
        state = states.actor
        hsp = 0
        vsp = 0
        movespeed = 0
    }
}

function cutscene_set_player_state(argument0)
{
	with (obj_player)
	{
		state = argument0
		image_speed = 0.35
	}
	scene++
	exit;
}


function cutscene_move_player(argument0, argument1)
{
	var finished = true
	with (obj_player)
	{
		movespeed = approach(movespeed, 8, movespeed > 8 ? 0.1 : 0.5)
		if (floor(movespeed) == 8)
			movespeed = 6
		hsp = approach(x, argument0 + (16 + player), movespeed) - x
		if x != argument0 + (16 + player)
		{
			finished = false
			
			sprite_index = spr_move
			xscale = sign(x - xprevious)
		
			if particle_timer > 0
				particle_timer--
			else
			{
				particle_timer = 12
				event_play_oneshot_3d("event:/sfx/player/step", x, y)
				create_effect(x, y + 43, spr_cloudeffect)
			}
		}
		else
		{
			sprite_index = spr_move
			xscale = argument1
		}
	}
	if finished
		scene++
	exit;
}
