function input_init_2(){
	key_left = false;
	key_right = false;
	key_down = false;
	key_up = false;
	key_jump = false;
	key_run = false;
	key_attack = false;
	key_shoot = false;
	key_taunt = false;
	key_left2 = false;
	key_right2 = false;
	key_down2 = false;
	key_up2 = false;
	key_jump2 = false;
	key_run2 = false;
	key_attack2 = false;
	key_shoot2 = false;
	key_taunt2 = false;
}
function input_get_2(){
	key_left = input_check("key_leftD", check.held);
	key_right = input_check("key_rightD", check.held);
	key_down = input_check("key_downD", check.held);
	key_up = input_check("key_upD", check.held);
	key_jump = input_check("key_jumpD", check.held);
	key_run = input_check("key_runD", check.held);
	key_attack = input_check("key_attackD", check.held);
	key_shoot = input_check("key_shootD", check.held);
	key_taunt = input_check("key_tauntD", check.held);
	key_left2 = input_check("key_leftD", check.pressed);
	key_right2 = input_check("key_rightD", check.pressed);
	key_down2 = input_check("key_downD", check.pressed);
	key_up2 = input_check("key_upD", check.pressed);
	key_jump2 = input_check("key_jumpD", check.pressed);
	key_run2 = input_check("key_runD", check.pressed);
	key_attack2 = input_check("key_attackD", check.pressed);
	key_shoot2 = input_check("key_shootD", check.pressed);
	key_taunt2 = input_check("key_tauntD", check.pressed);
}
