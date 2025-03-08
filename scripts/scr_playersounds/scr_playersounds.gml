function scr_playersounds()
{
    with (obj_parent_player)
    {
        if instance_exists(obj_pizzamancer)
        {
            if (!event_instance_isplaying(global.snd_pizzafacemoving))
                fmod_studio_event_instance_start(global.snd_pizzafacemoving)
            with (obj_pizzamancer)
                fmod_event_set3DPosition(global.snd_pizzafacemoving, x, y)
		}
		else
			fmod_studio_event_instance_stop(global.snd_pizzafacemoving, true);
		if state == states.actor && sprite_index == spr_firemouthend
		{
			if (image_index > 8 && !event_instance_isplaying(burpsnd))
			{
				fmod_studio_event_instance_start(burpsnd);
				fmod_event_set3DPosition(burpsnd, x, y);
			}
		}
		if global.snd_alarm_baddieID != -4
		{
			if (!instance_exists(global.snd_alarm_baddieID))
			{
				global.snd_alarm_baddieID = -4;
				fmod_studio_event_instance_stop(global.snd_alarm, true);
			}
			else
				fmod_event_set3DPosition(global.snd_alarm, global.snd_alarm_baddieID.x, global.snd_alarm_baddieID.y);
		}
		if state != states.tube && sprite_index != spr_knightpepstart && state != states.bombgrab && state != states.chainsaw && state != states.secretenter && state != states.door && state != states.victory && state != states.stunned && state != states.gameover && state != states.fireass
		{
			if (!scr_transformationcheck())
			{
				if !transformationsnd
				{
					transformationsnd = true;
					if (irandom(100) <= 70)
						fmod_studio_event_instance_start(snd_voicetransfo);
					event_play_oneshot_3d("event:/sfx/misc/transfo", x, y);
				}
			}
			else if transformationsnd
			{
				transformationsnd = false;
				if (irandom(100) <= 70)
					fmod_studio_event_instance_start(snd_voiceouttransfo);
				event_play_oneshot_3d("event:/sfx/misc/detransfo", x, y);
			}
		}
		fmod_event_set3DPosition(snd_voiceouttransfo, x, y);
		fmod_event_set3DPosition(snd_voicetransfo, x, y);
		fmod_event_set3DPosition(snd_voiceok, x, y);
		fmod_event_set3DPosition(snd_voicehurt, x, y);
		fmod_event_set3DPosition(snd_uppercut, x, y);
		fmod_event_set3DPosition(snd_dive, x, y);
		fmod_event_set3DPosition(snd_crouchslide, x, y);
		fmod_event_set3DPosition(rollgetupsnd, x, y);
		fmod_event_set3DPosition(animatronicsnd, x, y);
		fmod_event_set3DPosition(snd_dashpad, x, y);
		fmod_event_set3DPosition(gallopingsnd, x, y);
		if (state == states.freefall || state == states.freefallprep || (state == states.superslam || (state == states.chainsaw && tauntstoredstate == states.superslam)))
		{
			if (!event_instance_isplaying(freefallsnd))
				fmod_studio_event_instance_start(freefallsnd);
			fmod_studio_event_instance_set_paused(freefallsnd, false);
			fmod_event_set3DPosition(freefallsnd, x, y);
		}
		else
			fmod_studio_event_instance_stop(freefallsnd, true);
		if ((global.playerCharacter == Characters.Maurice && (state == states.mach2 || state == states.mach3 || state == states.climbwall)) || (state == states.rocket && sprite_index != spr_rocketstart))
		{
			fmod_studio_event_instance_set_paused(machsnd, false);
			if (!event_instance_isplaying(machsnd))
				fmod_studio_event_instance_start(machsnd);
			var s = 0;
			if state == states.mach2 && sprite_index == spr_mach1 && grounded
				s = 1;
			else if ((state == states.mach2 && sprite_index == spr_mach) || state == states.climbwall)
				s = 2;
			else if state == states.mach3 && sprite_index != spr_crazyrun
				s = 3;
			else if sprite_index == spr_crazyrun
				s = 4;
			if state == states.rocket
				s = 4;
			fmod_event_set3DPosition(machsnd, x, y);
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(machsnd, "state", s, true);
		}
		else
			fmod_studio_event_instance_stop(machsnd, true);
		if ((state == states.knightpepslopes && grounded && vsp > 0) || state == states.grind || (state == states.trashroll && grounded && vsp > 0 && sprite_index == spr_player_trashslide))
		{
			if (!event_instance_isplaying(knightslidesnd))
				fmod_studio_event_instance_start(knightslidesnd);
			fmod_event_set3DPosition(knightslidesnd, x, y);
		}
		else if (event_instance_isplaying(knightslidesnd))
			fmod_studio_event_instance_stop(knightslidesnd, true);
		
		var sjumpsnd = superjumpsnd;
		if global.playerCharacter == Characters.Maurice
		{
			if state == states.Sjumpprep
			{
				if (!event_instance_isplaying(sjumpsnd))
				{
					fmod_studio_event_instance_set_parameter_by_name_multiplatform(sjumpsnd, "state", 0, true);
					fmod_studio_event_instance_start(sjumpsnd);
				}
			}
			else if state == states.Sjump
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(sjumpsnd, "state", 1, true);
			else if state != states.Sjump
			{
				if (event_instance_isplaying(sjumpsnd) && fmod_event_getParameter(sjumpsnd, "state") < 1)
					fmod_studio_event_instance_stop(sjumpsnd, true);
				else if (!event_instance_isplaying(sjumpsnd))
					fmod_studio_event_instance_set_parameter_by_name_multiplatform(sjumpsnd, "state", 0, true);
			}
			if (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_playerN_sidewayspin)
				fmod_studio_event_instance_stop(sjumpsnd, true);
			if (event_instance_isplaying(sjumpsnd))
				fmod_event_set3DPosition(sjumpsnd, x, y);
		}
		else
			fmod_studio_event_instance_stop(sjumpsnd, true);
		
		if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
		{
			if (!event_instance_isplaying(tumblesnd))
			{
				fmod_studio_event_instance_start(tumblesnd);
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(tumblesnd, "state", 0, true);
				if sprite_index == spr_tumblestart
					tumbleintro = true;
			}
			if sprite_index == spr_tumble && !tumbleintro
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(tumblesnd, "state", 1, true);
			fmod_event_set3DPosition(tumblesnd, x, y);
		}
		else
		{
			if (event_instance_isplaying(tumblesnd))
			{
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(tumblesnd, "state", 2, true);
				fmod_event_set3DPosition(tumblesnd, x, y);
			}
			tumbleintro = false;
		}
		if (sprite_index == spr_machroll)
		{
			if (!event_instance_isplaying(machrollsnd))
				fmod_studio_event_instance_start(machrollsnd);
			fmod_event_set3DPosition(machrollsnd, x, y);
		}
		else
			fmod_studio_event_instance_stop(machrollsnd, true);
		if (event_instance_isplaying(suplexdashsnd))
		{
			if state != states.handstandjump
				fmod_studio_event_instance_stop(suplexdashsnd, true);
			fmod_event_set3DPosition(suplexdashsnd, x, y);
		}
		if state == states.trashroll && sprite_index == spr_playercorpsesurf && grounded && vsp > 0
		{
			if (!event_instance_isplaying(gravecorpsesnd))
				fmod_studio_event_instance_start(gravecorpsesnd);
			fmod_event_set3DPosition(gravecorpsesnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(gravecorpsesnd, true);
		if ((state == states.barrelslide && grounded && vsp > 0))
		{
			if (!event_instance_isplaying(barrelslidesnd))
				fmod_studio_event_instance_start(barrelslidesnd);
			fmod_event_set3DPosition(barrelslidesnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(barrelslidesnd, true);
		if state == states.slipnslide && sprite_index == spr_currentplayer
		{
			if (!event_instance_isplaying(waterslidesnd))
				fmod_studio_event_instance_start(waterslidesnd);
			fmod_event_set3DPosition(waterslidesnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(waterslidesnd, true);
		if state == states.stringfall
		{
			if (!event_instance_isplaying(mrpinchsnd))
				fmod_studio_event_instance_start(mrpinchsnd);
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(mrpinchsnd, "state", 0, true);
			fmod_event_set3DPosition(mrpinchsnd, x + hsp, y + vsp);
		}
		else if (event_instance_isplaying(mrpinchsnd))
		{
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(mrpinchsnd, "state", 1, true);
			fmod_event_set3DPosition(mrpinchsnd, x + hsp, y + vsp);
		}
		if (hamkuffID != -4 && instance_exists(hamkuffID) && !launched)
		{
			if (!event_instance_isplaying(hamkuffsnd))
				fmod_studio_event_instance_start(hamkuffsnd);
			if launch
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(hamkuffsnd, "state", 1, true);
			else
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(hamkuffsnd, "state", 0, true);
			fmod_event_set3DPosition(hamkuffsnd, x + hsp, y + vsp);
		}
		else
		{
			if (event_instance_isplaying(hamkuffsnd))
			{
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(hamkuffsnd, "state", 2, true);
				fmod_event_set3DPosition(hamkuffsnd, x + hsp, y + vsp);
			}
			hamkuffID = -4;
		}
		if ((state == states.ratmount || state == states.ratmountjump) && (sprite_index == spr_player_ratmountattack || sprite_index == spr_player_ratmountmach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dash || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_lonegustavo_dashjump))
		{
			if (!event_instance_isplaying(ratmountmachsnd))
				fmod_studio_event_instance_start(ratmountmachsnd);
			s = 0;
			if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dashjump)
				s = 1;
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(ratmountmachsnd, "state", s, true);
			if grounded
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(ratmountmachsnd, "ground", 1, true);
			else
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(ratmountmachsnd, "ground", 0, true);
			fmod_event_set3DPosition(ratmountmachsnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(ratmountmachsnd, true);
		if state == states.ratmountpunch
		{
			if (!event_instance_isplaying(ratmountpunchsnd))
				fmod_studio_event_instance_start(ratmountpunchsnd);
			fmod_event_set3DPosition(ratmountpunchsnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(ratmountpunchsnd, true);
		if state == states.ratmountbounce && sprite_index == spr_player_ratmountwalljump
		{
			if (!event_instance_isplaying(ratmountgroundpoundsnd))
				fmod_studio_event_instance_start(ratmountgroundpoundsnd);
			s = 0;
			if (instance_exists(superslameffectid))
				s = 1;
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(ratmountgroundpoundsnd, "state", s, true);
			fmod_event_set3DPosition(ratmountgroundpoundsnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(ratmountgroundpoundsnd, true);
		if state == states.animatronic && global.playerCharacter == Characters.Maurice
		{
			if (!event_instance_isplaying(animatronicsnd))
				fmod_studio_event_instance_start(animatronicsnd);
			fmod_event_set3DPosition(animatronicsnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(animatronicsnd, true);
		if (instance_exists(obj_brickball))
		{
			if (!event_instance_isplaying(ratmountballsnd))
				fmod_studio_event_instance_start(ratmountballsnd);
			fmod_event_set3DPosition(ratmountballsnd, obj_brickball.x + obj_brickball.hsp, obj_brickball.y + obj_brickball.vsp);
		}
		else
			fmod_studio_event_instance_stop(ratmountballsnd, true);
		if (instance_exists(obj_balloongrabbableeffect))
		{
			if (!event_instance_isplaying(ratdeflatesnd))
				fmod_studio_event_instance_start(ratdeflatesnd);
			fmod_event_set3DPosition(ratdeflatesnd, obj_balloongrabbableeffect.x, obj_balloongrabbableeffect.y);
		}
		else
			fmod_studio_event_instance_stop(ratdeflatesnd, true);
		if state == states.cheeseball && grounded && vsp > 0
		{
			if (!event_instance_isplaying(cheeseballsnd))
				fmod_studio_event_instance_start(cheeseballsnd);
			fmod_event_set3DPosition(cheeseballsnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(cheeseballsnd, true);
		if (state == states.rideweenie && abs(hsp) > 8 && grounded)
		{
			if (!event_instance_isplaying(gallopingsnd))
				fmod_studio_event_instance_start(gallopingsnd);
		}
		else if (event_instance_isplaying(gallopingsnd))
			fmod_studio_event_instance_stop(gallopingsnd, true);
		if state == states.boxxedpepspin
		{
			if (!event_instance_isplaying(boxxedspinsnd))
				fmod_studio_event_instance_start(boxxedspinsnd);
			fmod_event_set3DPosition(boxxedspinsnd, x + hsp, y + vsp);
		}
		else
			fmod_studio_event_instance_stop(boxxedspinsnd, true);
		if (event_instance_isplaying(pizzapeppersnd))
		{
			if state == states.jetpackjump
			{
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(pizzapeppersnd, "state", 0, true);
				fmod_event_set3DPosition(pizzapeppersnd, x + hsp, y + vsp);
			}
			else
				fmod_studio_event_instance_set_parameter_by_name_multiplatform(pizzapeppersnd, "state", 1, true);
		}
		if (state == states.ghost && sprite_index != spr_ghostidle && sprite_index != spr_ghostjump && (global.playerCharacter == Characters.Doise || ghostdash))
		{
			if (!event_instance_isplaying(ghostspeedsnd))
				fmod_studio_event_instance_start(ghostspeedsnd);
			s = 0;
			if ghostpepper == 1
				s = 1;
			else if ghostpepper == 2
				s = 2;
			else if ghostpepper >= 3
				s = 3;
			fmod_event_set3DPosition(ghostspeedsnd, x, y);
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(ghostspeedsnd, "state", s, true);
		}
		else if (event_instance_isplaying(ghostspeedsnd))
			fmod_studio_event_instance_stop(ghostspeedsnd, false);
	}
}
