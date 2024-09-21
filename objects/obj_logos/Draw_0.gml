var _switch = false
if logosbuffer > 0
	logosbuffer--
else
	_switch = true

if logosbuffer == 0
{
	logosbuffer = 150
	logos++
}	
switch(logos){
	case 0:
        draw_sprite(spr_fmod,-1,128,160)
		break
	case 1:
        draw_sprite(spr_tourdep,-1,0,0)
		alarm[0] = 140
		break
	case 2:
        draw_sprite(spr_BALLS,-1,32,224)
		break
}
		
		