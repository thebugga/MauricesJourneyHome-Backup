if obj_player.key_down2 && saveselect > 1
saveselect--
if obj_player.key_up2 && saveselect < 2
saveselect++
if obj_player.key_jump2 && cooldown == 0
{
global.savefile = saveselect
room = hub_outside
}
if cooldown > 0 
cooldown--