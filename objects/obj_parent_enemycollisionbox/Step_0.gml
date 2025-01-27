if ((!instance_exists(baddieID)) && room != custom_lvl_room)
	instance_destroy()
if instance_exists(baddieID)
{
	x = baddieID.x
	y = baddieID.y
	image_xscale = baddieID.image_xscale
}
for (var i = 0; i < 2; i++)
{
	var _obj_player = asset_get_index(concat("obj_parent_player", (i + 1)))
	var _playerindex = (i + 1)
	if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
	{
		if (baddieID.state != states.grabbed && (!baddieID.invincible) && baddieID.state != states.ghostpossess)
		{
			with (_obj_player)
			{
				if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && (!global.kungfu) && sprite_index != spr_player_mach2jump && ((state == states.boots && vsp > 0) or state == states.jump or state == states.mach1 or state == states.grab) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
				{
					scr_soundeffect(sfx_stompenemy)
					image_index = 0
					if (other.baddieID.object_index != obj_tank)
					{
						if (x != other.baddieID.x)
							other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
						other.baddieID.hsp = (xscale * 5)
						other.baddieID.vsp = -5
						other.baddieID.state = states.stun
						if (other.baddieID.stunned < 100)
							other.baddieID.stunned = 100
						other.baddieID.xscale = 1.4
						other.baddieID.yscale = 0.6
					}
					if (other.baddieID.object_index == obj_pizzaball)
					{
						with (other.baddieID)
						{
							scr_pizzaball_go_to_thrown(0, -5, 0)
							vsp = 5
						}
					}
					if key_jump2
					{
						instance_create(x, (y + 50), obj_stompeffect)
						stompAnim = 1
						vsp = -14
						if (state == states.jump)
							sprite_index = spr_stompprep
					}
					else
					{
						instance_create(x, (y + 50), obj_stompeffect)
						stompAnim = 1
						vsp = -9
						if (state == states.jump)
							sprite_index = spr_stompprep
					}
				}
				if (instance_exists(other.baddieID) && state == states.lungegrab)
				{
					other.baddieID.grabbedby = _playerindex
					other.baddieID.state = states.grabbed
					other.baddieID.hp = -99
					if key_down
					{
						sprite_index = spr_piledriver
						vsp = -5
						state = states.superslam
						image_index = 0
						image_speed = 0.35
					}
					else
					{
						sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
						image_index = 0
						hsp = 0
						movespeed = 0
						state = states.finishingblow
					}
				}
				if (instance_exists(other.baddieID) && other.baddieID.state != states.ratgrabbed && (!other.baddieID.invincible) && state == states.ratmountattack)
				{
					other.baddieID.ratplayerid = id
					other.baddieID.state = states.ratgrabbed
					ratgrabbedID = other.baddieID.id
					state = states.ratmount
				}
				if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) or state != states.tumble) && ((state == states.handstandjump && global.attackstyle == 1) or instakillmove == 1) && other.baddieID.state != states.grabbed && (!other.baddieID.invincible) && other.baddieID.instantkillable)
					Instakill()
				else if (state == states.handstandjump && global.attackstyle == 0)
				{
					var otherbaddie = other.baddieID
					otherbaddie.image_xscale = (-xscale)
					if (!key_up)
					{
						sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
						image_index = 0
						otherbaddie.hithsp = (-otherbaddie.image_xscale * 25)
						otherbaddie.hitvsp = -8
					}
					else if key_up
					{
						sprite_index = spr_uppercutfinishingblow
						image_index = 3
						otherbaddie.hithsp = 0
						otherbaddie.hitvsp = -25
					}
					otherbaddie.stunned = 100
					hitLag = 5
					hitX = x
					hitY = y
					otherbaddie.hitLag = 5
					otherbaddie.hitX = otherbaddie.x
					otherbaddie.hitY = otherbaddie.y
					state = states.tackle
					movespeed = 3
					vsp = -6
					instance_create(otherbaddie.x, otherbaddie.y, obj_parryeffect)
					global.combotime = 60
					global.heattime = 60
					GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.8, 0.8, 0.65)
					scr_soundeffect(sfx_punch)
					scr_soundeffect(sfx_killingblow)
					otherbaddie.thrown = true
					otherbaddie.alarm[3] = 1
					otherbaddie.state = states.stun
					instance_create(x, y, obj_slapstar)
					instance_create(x, y, obj_slapstar)
					instance_create(x, y, obj_slapstar)
					instance_create(x, y, obj_baddiegibs)
					instance_create(x, y, obj_baddiegibs)
					instance_create(x, y, obj_baddiegibs)
					with (obj_camera)
					{
						shake_mag = 3
						shake_mag_acc = (3 / room_speed)
					}
					otherbaddie.hsp = otherbaddie.hithsp
					otherbaddie.vsp = otherbaddie.hitvsp
					otherbaddie.linethrown = true
				}
				else if (state == states.handstandjump && global.attackstyle == 3)
				{
					var _ms = movespeed
					movespeed = 0
					baddiegrabbedID = other.baddieID
					grabbingenemy = 1
					var _prevstate = other.baddieID.state
					other.baddieID.state = states.grabbed
					other.baddieID.grabbedby = _playerindex
					if global.pummeltest
					{
						if (image_index > 6)
						{
							if key_up
							{
								state = states.finishingblow
								sprite_index = spr_uppercutfinishingblow
								image_index = 4
								movespeed = 0
							}
							else if key_down
							{
								sprite_index = spr_piledriver
								vsp = -5
								state = states.superslam
								image_index = 4
								image_speed = 0.35
							}
							else
							{
								state = states.finishingblow
								sprite_index = spr_player_lungehit
								image_index = 0
							}
						}
						else
						{
							other.baddieID.state = _prevstate
							grabbingenemy = 0
							movespeed = _ms
						}
					}
					else
					{
						image_index = 0
						if key_up
						{
							state = states.finishingblow
							sprite_index = spr_uppercutfinishingblow
							image_index = 4
							movespeed = 0
						}
						else if key_down
						{
							sprite_index = spr_piledriver
							vsp = -5
							state = states.superslam
							image_index = 4
							image_speed = 0.35
						}
						else
						{
							state = states.finishingblow
							sprite_index = spr_player_lungehit
							image_index = 0
						}
					}
				}
				if (place_meeting(x, (y + 1), other) && state == states.pogo && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && (!other.baddieID.invincible))
				{
					switch pogochargeactive
					{
						case 0:
							pogospeedprev = 0
							other.baddieID.vsp = -3
							scr_soundeffect(sfx_stompenemy)
							other.baddieID.state = states.stun
							if (other.baddieID.stunned < 100)
								other.baddieID.stunned = 100
							sprite_index = spr_playerN_pogobounce
							break
						case 1:
							pogospeedprev = 0
							scr_throwenemy()
							sprite_index = spr_playerN_pogobouncemach
							break
					}

					instance_create(x, (y + 50), obj_stompeffect)
					image_index = 0
					movespeed = 0
					vsp = 0
				}
				var pepp_grab = 0
				if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == states.tumble or state == states.mach2) && other.baddieID.state != states.punch && other.baddieID.state != states.hit && (!pepp_grab) && other.baddieID.thrown == false && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != states.grabbed && other.baddieID.state != states.chainsawbump && other.baddieID.state != states.chainsaw && (!other.baddieID.invincible))
				{
					var lag = 0
					other.baddieID.stuntouchbuffer = 15
					with (other.baddieID)
					{
						xscale = 0.8
						yscale = 1.3
						instance_create(x, y, obj_bangeffect)
						state = states.hit
						image_xscale = (-other.xscale)
						hithsp = (other.xscale * 12)
						hitvsp = (((other.y - 180) - y) / 60)
						trace([hithsp, hitvsp])
						hitLag = lag
						hitX = x
						hitY = y
						invtime = (lag + 5)
						flash = 1
					}
					scr_soundeffectpitched(sfx_mach2bump)
					tauntstoredstate = state
					tauntstoredsprite = sprite_index
					tauntstoredmovespeed = movespeed
					tauntstoredvsp = vsp
					state = states.chainsaw
					hitLag = lag
					hitX = x
					hitY = y
					repeat (2)
					{
						with (create_debris(x, y, spr_slapstar))
							vsp = irandom_range(-6, -11)
					}
				}
				if (instance_exists(other.baddieID) && state == states.grabbing && (!other.baddieID.invincible))
				{
					if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != states.handstandjump && other.baddieID.state != states.grabbed && sprite_index != spr_player_mach2jump && (state == states.jump or state == states.mach1 or (state == states.grab && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
					{
						scr_soundeffect(sfx_stompenemy)
						if (x != other.baddieID.x)
							other.baddieID.image_xscale = (-(sign((other.baddieID.x - x))))
						image_index = 0
						other.baddieID.state = states.stun
						if (other.baddieID.stunned < 100)
							other.baddieID.stunned = 100
						if key_jump2
						{
							instance_create(x, (y + 50), obj_stompeffect)
							stompAnim = 1
							other.baddieID.image_index = 0
							vsp = -14
							if (state != states.grab)
								sprite_index = spr_stompprep
						}
						else
						{
							instance_create(x, (y + 50), obj_stompeffect)
							stompAnim = 1
							other.baddieID.image_index = 0
							vsp = -9
							if (state != states.grab)
								sprite_index = spr_stompprep
						}
					}
					if (other.baddieID.thrown == false && (global.playerCharacter == Characters.Maurice or global.playerCharacter == Characters.Doise))
					{
						movespeed = 0
						image_index = 0
						sprite_index = spr_haulingstart
						state = states.grab
						other.baddieID.state = states.grabbed
						other.baddieID.grabbedby = _playerindex
					}
				}
			}
		}
	}
}
