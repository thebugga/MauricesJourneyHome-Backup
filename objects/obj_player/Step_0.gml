//whuh?_call
scr_collision()
scr_getinput();
	
switch state
{
	case states.normal:
		scr_maurice_normal();
		break;
	case states.jump:
		scr_maurice_jump();
		break;
	case states.mach:
		scr_maurice_mach();
		break
	case states.mach3:
		scr_maurice_mach3();
		break
	case states.nickel:
		scr_maurice_nickel();
		break;
	case states.runwall:
		scr_maurice_climbwall();
		break;
	case states.hurt:
		scr_maurice_hurt();
		break;
	case states.door:
		scr_maurice_door();
		break;
	case states.titlescreen:
		scr_maurice_titlescreen();
		break;
	case states.debugstate:
		scr_maurice_debugstate();
		break;
	case states.slide:
	    scr_maurice_machslide();
	break;
	case states.roll:
	    scr_maurice_roll();
		break;
	case states.actor:
	    scr_maurice_actor()
		break
}
if ((y > (room_height + 300) || y < -800))
{
		visible = true;
		state = states.normal;
		visible = false;
		hsp = 0;
		vsp = 0;
		with (instance_create(x, y + 540, obj_technicaldifficulty))
		{
			sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2);
			vsp = 10;
		}
}
image_xscale = xscale
scr_characterspr()
scr_playersounds()