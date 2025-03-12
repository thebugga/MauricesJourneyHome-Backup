ini_open_from_string(obj_savesystem.ini_str)
highscore = ini_read_real("Highscore", string(level), 0)
highscore_yray = array_create(string_width(highscore), 0)
color_array = array_create(string_width(highscore), 0)
for (var i = 0; i < array_length(color_array); i++)
{
	color_array[i] = irandom(3)
	highscore_yray[i][0] = 0
	highscore_yray[i][1] = -10
}
secret_count = ini_read_string("Secret", string(level), 0)
goochling[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
goochling[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
goochling[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
goochling[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
goochling[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
var _rank_map = ds_map_create()
ds_map_set(_rank_map, "p", 5)
ds_map_set(_rank_map, "s", 4)
ds_map_set(_rank_map, "a", 3)
ds_map_set(_rank_map, "b", 2)
ds_map_set(_rank_map, "c", 1)
ds_map_set(_rank_map, "d", 0)
rank = ds_map_find_value(_rank_map, ini_read_string("Ranks", string(level), "d"))
ini_close()

for (var i = 0; i < secret_count; i++)
{
	with (instance_create(x, y, obj_startgate_secret))
        {
            time_x += (i - 1)
            time_y += ((i - 1) * 2)
        }
}

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
		msg = "orEGANO DESERT"
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
		msg = "GNOME ForEST"
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

