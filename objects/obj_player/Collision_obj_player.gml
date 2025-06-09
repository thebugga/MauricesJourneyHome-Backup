if other.state != states.hurt
{
	if state == states.slap
	{
		other.state = states.hurt
		other.hsp = xscale * 8
		other.vsp = -12
		with obj_camera
			spotlight = other.player
	}
	if state == states.grab
	{
		if character == p_characters.undoised
		{
			var str = variable_instance_get(self, string_concat("spr_finishingblow_", string(irandom_range(1, 5))))
			reset_anim(asset_get_index(str))
			if (key_up.down)
				reset_anim(spr_finishingblowup)
			image_index = 3
			state = states.punchenemy
			other.state = states.hurt
			other.hsp = xscale * 20
			other.vsp = -8
			if sprite_index == spr_finishingblowup
			{
				other.hsp = xscale * 2
				other.vsp = -20
			}
			with obj_camera
				spotlight = other.player
		}
		else
		{
			other.multiholder = id
			other.sprite_index = other.spr_hurt
			reset_anim(spr_player_holdrise)
			state = states.hold
			if (abs(hsp) > 10)
			{
				state = states.swingding
				sprite_index = spr_player_swingding
				if !grounded
					vsp = -5
			}
			if (key_up.down)
			{
				state = states.piledriver
				sprite_index = spr_player_piledriver
				vsp = -18
			}
		}
	}
}