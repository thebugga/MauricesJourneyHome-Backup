ini_open_from_string(obj_savesystem.ini_str)
highscore = ini_read_real("Highscore", string(level), 0)
secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
ini_close()

switch level
{
	case "graveyard":
		msg = "Garbage Graveyard"
		break
	case "wizard":
		msg = "Pizzardry"
		break
	case "lair":
		msg = "Dragon's Lair"
		break
	case "school":
		msg = "Snick's Classroom"
		break
	case "floorroom":
		msg = "OREGANO DESERT"
		break
	case "graveyard2":
		msg = "THE WASTEYARD"
		break
	case "farm":
		msg = "FUN FARM"
		break
	case "ufo":
		msg = "SPACE PINBALL"
		break
	case "strongcold":
		msg = "STRONGCOLD"
		break
	case "forest":
		msg = "GNOME FOREST"
		break
	case "beach":
		msg = "PINEAPPLE BEACH"
		break
	case "dragonlair":
		msg = "DRAGON LAIR"
		break
	case "snickchallenge":
		msg = "SNICK CHALLENGE"
		break
}

