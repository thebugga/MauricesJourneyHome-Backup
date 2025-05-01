function tv_expression(spr)
{
	switch (spr)
	{
		case spr_tv_idle:
			state_togo = tv_states.normal
			break;
		case spr_tv_hurt:
		case spr_tv_collect:
			state_togo = tv_states.expr
			alarm[0] = 120
			expr_sprite = spr
			break;
		default:
			state_togo = tv_states.expr
			expr_sprite = spr
			break;
	}
	state = tv_states.transition
	t_index = 0
}

function tv_cardboard(ind)
{
	cardboardindex = ind
	cardboardtimer = 120
}

function scr_tvtopmessage(_message = "")
{
	var q = -4
	with (obj_tv)
	{
		q = 
		{
			text: _message,
			timer: 500,
			alpha: 1
		}
		trace(q)
		ds_list_add(messagelist, q)
	}
	return q;
}