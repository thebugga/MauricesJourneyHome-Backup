var _found = 0
with (obj_parent_player)
{
	if (state == states.mort or state == states.mortjump or state == states.mortattack or state == states.morthook)
		_found = 1
}
if _found
	image_alpha = 1
else
	image_alpha = 0.5
