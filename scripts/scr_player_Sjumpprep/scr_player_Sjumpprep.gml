function scr_player_Sjumpprep()
{
			if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
				Move = key_left + key_right;
			else
				Move = Xscale;
			if (!place_meeting(x, y + 1, obj_railparent))
				hsp = Move * Movespeed;
			else
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				hsp = (Move * Movespeed) + (_railinst.Movespeed * _railinst.dir);
			}
			if sprite_index == spr_superjumpprep
				Movespeed = approach(Movespeed, 0, 1);
			if (animation_end() && sprite_index == spr_superjumpprep)
				sprite_index = spr_superjumppreplight;
			if sprite_index == spr_superjumppreplight
				Movespeed = 2;
			if sprite_index != spr_superjumpprep
			{
				if (Move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
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
			if (((global.playerCharacter == Characters.Maurice && !scr_check_superjump()) || global.playerCharacter == Characters.Doise) && grounded && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && !place_meeting_solid(x, y - 16) && !place_meeting_solid(x, y - 32))
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
