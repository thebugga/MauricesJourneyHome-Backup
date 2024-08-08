selected = 0
depth = -100
function set_game_config() 
{
	ini_open("saveData.ini")
	ini_write_real("Option", "timer", global.option_timer)
	ini_write_real("Option", "timertype", global.option_timer_type)
	ini_close()
}