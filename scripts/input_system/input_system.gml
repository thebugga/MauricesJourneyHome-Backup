function input_init(){
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
function input_get(){
	key_left = input_check("key_left", check.held);
	key_right = input_check("key_right", check.held);
	key_down = input_check("key_down", check.held);
	key_up = input_check("key_up", check.held);
	key_jump = input_check("key_jump", check.held);
	key_run = input_check("key_run", check.held);
	key_attack = input_check("key_attack", check.held);
	key_shoot = input_check("key_shoot", check.held);
	key_taunt = input_check("key_taunt", check.held);
	key_left2 = input_check("key_left", check.pressed);
	key_right2 = input_check("key_right", check.pressed);
	key_down2 = input_check("key_down", check.pressed);
	key_up2 = input_check("key_up", check.pressed);
	key_jump2 = input_check("key_jump", check.pressed);
	key_run2 = input_check("key_run", check.pressed);
	key_attack2 = input_check("key_attack", check.pressed);
	key_shoot2 = input_check("key_shoot", check.pressed);
	key_taunt2 = input_check("key_taunt", check.pressed);
}
