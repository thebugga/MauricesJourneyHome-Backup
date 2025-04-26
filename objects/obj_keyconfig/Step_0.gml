get_input()

if !binding
	selected = clamp(selected + (-uikey_up.pressed + uikey_down.pressed), -1, array_length(binds) - 1)

if selected == -1
{
	if uikey_accept.pressed
		instance_destroy()
}

if binding 
{
	if keyboard_check_pressed(vk_anykey)
	{
		var bindname = binds[selected].globalname
		global.keybinds[$ bindname] = keyboard_key
		
		quick_ini_write_real("globalsave.ini", "keybinds", bindname, keyboard_key)
		
		binds[selected].input = keyboard_key
		binding = false
	}
}
else
{
	if uikey_accept.pressed && !selected == -1
		binding = true
	if uikey_deny.pressed
		instance_destroy()
}