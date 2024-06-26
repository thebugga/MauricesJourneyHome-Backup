var collect_x = irandom_range(-collect_shake, collect_shake);
var collect_y = irandom_range(-collect_shake, collect_shake);
if collect_shake > 0
    collect_shake = 1
if showinside
{
draw_sprite(elavatorsprite, trapopen, collect_x, collect_y)
draw_sprite(charsprite, trapopen, 0 + collect_x , chary + collect_y)
}
draw_set_alpha(fadealpha)
draw_set_color(c_black)
draw_rectangle(0, 0, 10000, 10000, false)
draw_set_alpha(1)
