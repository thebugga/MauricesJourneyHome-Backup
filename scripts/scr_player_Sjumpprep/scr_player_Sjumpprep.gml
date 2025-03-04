function scr_player_Sjumpprep()
{
	if global.playerCharacter != Characters.Gabbie
	{
			if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
				move = key_left + key_right;
			else
				move = Xscale;
			if (!place_meeting(x, y + 1, obj_railparent))
				hsp = move * movespeed;
			else
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
			}
			if sprite_index == spr_superjumpprep
				movespeed = approach(movespeed, 0, 1);
			if (animation_end() && sprite_index == spr_superjumpprep)
				sprite_index = spr_superjumppreplight;
			if sprite_index == spr_superjumppreplight
				movespeed = 2;
			if sprite_index != spr_superjumpprep
			{
				if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
				{
					if Xscale == 1
					{
						if key_right
							sprite_index = spr_superjumpright;
						if -key_left
							sprite_index = spr_superjumpleft;
					}
					if Xscale == -1
					{
						if key_right
							sprite_index = spr_superjumpleft;
						if -key_left
							sprite_index = spr_superjumpright;
					}
				}
				else
					sprite_index = spr_superjumppreplight;
			}
			if (((global.playerCharacter == Characters.Maurice && !scr_check_superjump()) || global.playerCharacter == Characters.Doise || global.playerCharacter == Characters.Pierre) && grounded && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && !place_meeting_solid(x, y - 16) && !place_meeting_solid(x, y - 32))
			{
				instance_create(x, y, obj_explosioneffect);
				sprite_index = spr_superjump;
				state = states.Sjump;
				sjumpvsp = global.playerCharacter == Characters.Doise ? 15 : -12;
				superjumptimer = global.playerCharacter == Characters.Doise ? 200 : 45;
				sjumpangle = 270
				hsp = 0
				image_index = 0;
			}
			image_speed = 0.35;
	}
	else
	{		
            hsp = 0
            vsp = 0
            pogochargeactive = 0
            pogocharge = 50
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_playerN_jetpackstart)
                {
                    if (pizzapepper == 0)
                    {
                        state = states.rocket
                        sprite_index = spr_playerN_jetpackboost
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 15
                    }
                    else
                    {
                        state = states.rocket
                        sprite_index = spr_crazyrun
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 21
                    }
                }
                else if (sprite_index == spr_superjumpprep)
                {
                    fmod_event_instance_set_parameter(superjumpsnd, "state", 2, 1)
                    instance_create(x, y, obj_explosioneffect)
                    sprite_index = spr_superjump
                    state = states.Sjump
                    vsp = -15
                }
            }
            if (sprite_index == spr_playerN_jetpackstart)
                image_speed = 0.5
            else
                image_speed = 0.3
	}
}
