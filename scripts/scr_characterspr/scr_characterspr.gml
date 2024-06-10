// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_characterspr()
{
	if (character == "M")
	{
		spr_idle = spr_maurice_idle;
		spr_jump = spr_maurice_jump;
		spr_move = spr_maurice_move;
		spr_nickel1 = spr_maurice_nickel1;
		spr_nickel2 = spr_maurice_nickel2;
		spr_mach2 = spr_maurice_mach2;
	}
	if (character == "D")
	{
		spr_idle = spr_dragonmount_idle;
		spr_jump = spr_dragonmount_idle;
		spr_move = spr_dragonmount_idle;
		spr_nickel1 = spr_dragonmount_idle;
		spr_nickel2 = spr_dragonmount_idle;
		spr_mach2 = spr_dragonmount_idle;
	}
}