#macro DISCORD_APP_ID "1251993866530193508"
ready = 0
if (!(np_initdiscord(DISCORD_APP_ID, 1, 0)))
{
    show_message("Failed to initiate Discord presence. Ensure NekoPresence_x64.dll is installed.")
    instance_destroy()
}
largeimage = "3aescfat"
moretexta = ""
moretextb = ""
state = "im journey my home"
details = ""
smallimage = "pdssss"
