if (textbuffer > 0)
    textbuffer--
else
{
    currentpos++
    if (currentpos <= string_length(currenttext))
    {
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, (string_length(displaytext) + 1))
        displaytext = scr_separate_text(displaytext, 960 - (rpadding * 2))
        textbuffer = textspeed
    }
    else if obj_player1.key_jump
    {
		if (currentpos < string_length(currenttext))
		{
		    while (currentpos <= string_length(currenttext))
		    {
		        currentpos++
		        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, (string_length(displaytext) + 1))
		        displaytext = scr_separate_text(displaytext, 960 - (rpadding * 2))
		    }
		}
		else
		{
			var func = dialog[currentdialog][4]
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
	        if (currentdialog < (array_length(dialog) - 1))
	        {
				
	            currentdialog += 1
	            currentpos = 0
	            textbuffer = textspeed
	            displaytext = ""
	            currenttext = scr_calculate_text(dialog[currentdialog][0])
	            dialogheight = scr_calculate_height(currenttext)
	            dialogcharacter = dialog[currentdialog][1]
	            dialogexpression = dialog[currentdialog][2]
				effect_shake = 0
				if dialog[currentdialog][3] != -4
				{
					switch dialog[currentdialog][3]
					{
						case "angershake":
						effect_shake = 1
						break
					}
				}
	            
	        }
	        else
			{
	            obj_player1.input_buffer_jump = 0
	            instance_destroy()
			}
	    }
	}
}

if currentpos < string_length(currenttext)
{
	if (talk_sprites[dialogcharacter][dialogexpression][1] != -4 && dialogsprite != talk_sprites[dialogcharacter][dialogexpression][3])
		dialogsprite = talk_sprites[dialogcharacter][dialogexpression][1]
	else if(talk_sprites[dialogcharacter][dialogexpression][1] == -4 && dialogsprite != talk_sprites[dialogcharacter][dialogexpression][2])
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
if dialogsprite && floor(dialogindex) > (sprite_get_number(dialogsprite) - 1)
{
	if (dialogsprite == talk_sprites[dialogcharacter][dialogexpression][2] || dialogsprite == talk_sprites[dialogcharacter][dialogexpression][3])
		dialogsprite = talk_sprites[dialogcharacter][dialogexpression][0]
	dialogindex = 0
}
for (var i = 0; i < 4; i++)
{
if dialogsidel[i] == dialogcharacter
dialogcharx = (rpadding + (75 * i))
else if dialogsider[i] == dialogcharacter
dialogcharx = ((960 - rpadding) - (75 * i))
}
