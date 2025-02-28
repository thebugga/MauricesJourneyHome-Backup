if (!other.grabbable)
	exit;
if (state != states.boxxedpepspin)
{
	if (state == states.handstandjump or state == states.lungeattack or state == states.punch)
	{
		if (other.state == states.normal && scr_transformationcheck() && (!cutscene) && state != states.bombgrab && (state == states.handstandjump or state == states.punch or state == states.lungeattack))
		{
			state = states.bombgrab
			image_index = 0
			sprite_index = spr_haulingstart
			other.defused = 1
			bombgrabID = other.id
			Movespeed = 6
			with (other)
			{
				state = states.grabbed
				playerid = other.id
			}
			tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", tvprompt.transfo, spr_tv_bombpep, 3), "bombpep")
		}
	}
}
else if (other.kickbuffer <= 0)
{
	other.vsp = -9
	other.Movespeed = 7
	other.image_xscale = Xscale
	other.kickbuffer = 15
	other.y--
	other.defused = 1
}
