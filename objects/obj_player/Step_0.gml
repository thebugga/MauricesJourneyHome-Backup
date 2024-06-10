//whuh?_call
scr_collision()
scr_getinput();
move = key_right - key_left
prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
prevxscale = xscale;

if key_attack2
	input_buffer_shoot = 10;
if key_attack2
	input_buffer_slap = 12;
if key_jump
	input_buffer_jump = 15;
if key_down2
	input_buffer_down = 15;
if key_run2
	input_buffer_mach = 15;
if key_taunt2
	input_taunt_p2 = 5;
	

if grounded && vsp > 0
	coyote_time = 8;
if vsp < 0
	coyote_time = 0;
can_jump = (grounded && vsp > 0) || (coyote_time && vsp > 0);
switch state
{
	case states.normal:
		scr_maurice_normal();
		break;
	case states.jump:
		scr_maurice_jump();
		break;
	case states.mach2:
		scr_maurice_mach2();
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

if coyote_time > 0
	coyote_time--;
scr_characterspr()
