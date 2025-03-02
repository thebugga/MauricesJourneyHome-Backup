if (global.playerCharacter != Characters.Pierre)
{
	instance_create(x, y, obj_genericpoofeffect)
	instance_destroy()
}
if (!trapped)
{
	if (playerid.sprite_index == spr_lonegustavo_hurt or playerid.state == states.ratmountpunch or playerid.state == states.ratmountgroundpound or playerid.state == states.ratmountgrind or playerid.state == states.ratmountladder or playerid.state == states.ratmountcrouch or playerid.state == states.ratmounttumble)
	{
		wait = 1
		sprite_index = spr_lonebrick_wait
		alarm[0] = 30
		depth = 0
		comeback = 0
	}
	if (comeback == 1)
	{
		var follower = (playerid.riderispeetzy != ispeetzy) ? obj_pierrefriendfollow : playerid
		depth = -99
		x = approach(x, follower.x, cbspeed)
		y = approach(y, follower.y, cbspeed)
		cbspeed = approach(cbspeed, 20, 1)
	}
	else if (wait == 0)
	{
		x += hsp
		y += vsp
		if (vsp < 20)
			vsp += 0.5
	}
	if comeback
		sprite_index = spr_lonebrick_comeback
}
else if (baddieID == noone)
{
	vsp = -10
	if ((y + vsp) < 80 or place_meeting_solid(x, (y - 78)))
		vsp = 0
	y += vsp
}
else if (!instance_exists(baddieID))
	trapped = 0
