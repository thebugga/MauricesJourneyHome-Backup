function scr_player_gotoplayer()
{
	pogochargeactive = 0
	movespeed = 0
	visible = false
		playerid = (object_index == obj_player2 ? obj_player1 : obj_player2)
		var _dir = point_direction(x, y, playerid.x, playerid.y)
		hsp = lengthdir_x(16, _dir)
		vsp = lengthdir_y(16, _dir)
		var t = 16
		repeat (8)
			create_particle((x + irandom_range((-t), t)), (y + irandom_range((-t), t)), particle.cloudeffect, 0)
}
