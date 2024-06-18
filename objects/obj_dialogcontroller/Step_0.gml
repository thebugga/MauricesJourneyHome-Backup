if (textbuffer > 0)
    textbuffer--
else
{
    currentpos++
    if (currentpos <= string_length(currenttext))
    {
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, (string_length(displaytext) + 1))
        displaytext = scr_separate_text(displaytext)
        textbuffer = textspeed
    }
    else if obj_player.key_jump2
    {
        if (currentdialog < (array_length(dialog) - 1))
        {
            currentdialog += 1
            currentpos = 0
            textbuffer = textspeed
            displaytext = ""
            currenttext = scr_calculate_text(dialog[currentdialog][0])
            obj_player.key_jump = 0
            dialogheight = scr_calculate_height(currenttext)
            dialogcharacter = dialog[currentdialog][1]
            dialogexpression = dialog[currentdialog][2]
			
            var func = dialog[currentdialog][3]

            if (func != -4)
            {
                if (npcID != noone && instance_exists(npcID))
                {
                    with (npcID)
                        method(id, func)()
                }
                else
                    method(id, func)()
            }
        }
        else
            instance_destroy()
    }
}
if (currentpos < string_length(currenttext) && obj_player.key_jump2)
{
    while (currentpos <= string_length(currenttext))
    {
        currentpos++
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, (string_length(displaytext) + 1))
        displaytext = scr_separate_text(displaytext)
    }
}
	if currentpos < string_length(currenttext)
	{
	if (talk_sprites[dialogcharacter][dialogexpression][1] != -4 && dialogsprite != talk_sprites[dialogcharacter][dialogexpression][3])
	dialogsprite = talk_sprites[dialogcharacter][dialogexpression][1]
	else if( talk_sprites[dialogcharacter][dialogexpression][1] == -4 && dialogsprite != talk_sprites[dialogcharacter][dialogexpression][2])
	dialogsprite = talk_sprites[dialogcharacter][dialogexpression][0]
	}
	if( currentpos > string_length(currenttext) && dialogsprite != talk_sprites[dialogcharacter][dialogexpression][2])
	dialogsprite = talk_sprites[dialogcharacter][dialogexpression][0]
	if dialogblinktime > 0
	dialogblinktime--
	else
	{
	if currentpos <= string_length(currenttext)
	{
	if (talk_sprites[dialogcharacter][dialogexpression][1] != -4 && talk_sprites[dialogcharacter][dialogexpression][3] != -4)
	dialogsprite = talk_sprites[dialogcharacter][dialogexpression][3]
	else if( talk_sprites[dialogcharacter][dialogexpression][1] == -4 && talk_sprites[dialogcharacter][dialogexpression][2] != -4)
	dialogsprite = talk_sprites[dialogcharacter][dialogexpression][2]
	}
	else if( talk_sprites[dialogcharacter][dialogexpression][2] != -4)
	dialogsprite = talk_sprites[dialogcharacter][dialogexpression][2]
	dialogblinktime = irandom_range(20, 1000)
	}
dialogindex += 0.35
if floor(dialogindex) >= (sprite_get_number(dialogsprite) - 1)
{
if (dialogsprite == talk_sprites[dialogcharacter][dialogexpression][2] || dialogsprite == talk_sprites[dialogcharacter][dialogexpression][3])
dialogsprite = talk_sprites[dialogcharacter][dialogexpression][0]
dialogindex = 0
}
