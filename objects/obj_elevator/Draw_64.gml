if showinside
{
draw_set_color(c_black)
draw_rectangle(0, 0, 10000, 10000, false)
draw_set_color(c_white)
draw_sprite(elavatorsprite, 0, irandom_range(-shake, shake), irandom_range(-shake, shake))
draw_sprite(charsprite, charindex, irandom_range(-shake, shake) , chary + irandom_range(-shake, shake))
}
draw_set_alpha(fadealpha)
draw_set_color(c_black)
draw_rectangle(0, 0, 10000, 10000, false)
draw_set_alpha(1)
