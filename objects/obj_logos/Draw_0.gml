var _switch = false;
if logosbuffer > 0
	logosbuffer--;
else
	_switch = true;

if logosbuffer == 0{
logosbuffer = 340;
logos++
}	
switch(logos){
	case 0:
        draw_sprite(spr_fmod,-1,128,160)
		break
	case 1:
        draw_sprite(spr_tourdep,-1,0,0)
		break
	case 2:
        draw_sprite(spr_BALLS,-1,32,224)
		alarm[0] = 50
		break
}
		
		