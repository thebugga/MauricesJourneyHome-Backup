switch room
{
	case garbage_1:
	case garbage_2:
	case garbage_3:
	case garbage_4:
	case garbage_5:
	case garbage_6:
	case garbage_7:
		paniclayers = [[layer_get_id("Backgrounds_H2"), true], [layer_get_id("Effect_1"), false], [layer_get_id("Effect_escape"), true]]
		flash = 1
		break;
	case garbage_8:
	case garbage_9:
	case garbage_10:
	case garbage_10b:
	case garbage_11:
		paniclayers = [[layer_get_id("Backgrounds_H2"), true], [layer_get_id("Effect_1"), false], [layer_get_id("Effect_escape"), true]]
		break;
}