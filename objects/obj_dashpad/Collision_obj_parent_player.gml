var t = id
with (other)
{
	if (state != states.gotoplayer && state != states.ghost && state != states.actor)
	{
		if (boxxed == 0 && global.playerCharacter != Characters.Pierre && other.buffer == 0 && other.sprite_index == spr_dashpad)
		{
			if (state == states.trashjump || state == states.trashjumpprep)
				create_debris(x, y, spr_player_trashlid)
			var changecoord = true
			if (place_meeting(x, y, obj_superspring))
				changecoord = false
			if (changecoord)
				y = other.y - 14
			vsp = 0
			create_particle(x, y, particle.jumpdust, 0)
			if (global.playerCharacter == Characters.Maurice || global.playerCharacter == Characters.Mrorange)
			{
				if (sprite_index != spr_dashpadmach)
				{
					sprite_index = spr_dashpadmach
					image_index = 0
				}
			}
			else if (global.playerCharacter == Characters.Doise)
			{
				if (sprite_index != spr_crazyrun)
				{
					sprite_index = spr_crazyrun
					image_index = 0
				}
			}
			//scr_soundeffect(sfx_dashpad)
			machhitAnim = false
			state = states.mach3
			Xscale = sign(other.image_xscale)
			dir = Xscale
			if (movespeed < 14)
			{
				movespeed = 14
				hsp = Xscale * movespeed
			}
			else
			{
				movespeed += 0.5
				hsp = Xscale * movespeed
			}
			other.buffer = 30
		}
		else
		{
			if (boxxed && other.buffer == 0 && other.sprite_index != spr_dashpad)
			{
				changecoord = true
				if (place_meeting(x, y, obj_superspring))
					changecoord = false
				if (changecoord)
					y = other.y - 14
				vsp = 0
				create_particle(x, y, particle.jumpdust, 0)
				Xscale = sign(other.image_xscale)
				dir = Xscale
				boxxeddash = true
				if (abs(movespeed) < 14)
					movespeed = Xscale * 14
				else
					movespeed += (Xscale * 0.5)
				sprite_index = spr_boxxedpepwalk
				boxxeddashbuffer = 40
				state = states.boxxedpep
				other.buffer = 30
			}
			if (global.playerCharacter == Characters.Pierre && other.buffer == 0 && gusdashpadbuffer == 0)
			{
				//scr_soundeffect(sfx_dashpad)
				changecoord = true
				if (place_meeting(x, y, obj_superspring))
					changecoord = false
				if (changecoord)
					y = other.y - 14
				vsp = 0
				create_particle(x, y, particle.jumpdust, 0)
				Xscale = sign(other.image_xscale)
				dir = Xscale
				with (instance_create(x, y, obj_crazyrunothereffect))
					image_xscale = t.image_xscale
				with (instance_create(x, y, obj_superdashcloud))
					image_xscale = t.image_xscale
				other.buffer = 30
				ratmount_movespeed = 14
				gustavodash = 51
				state = states.ratmount
				if (abs(movespeed) < 14)
					movespeed = other.image_xscale * 14
				gusdashpadbuffer = 25
			}
		}
	}
}
