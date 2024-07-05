if (room == Oldtitlescreen or room == hub_loadingscreen or room == rank_room)
	exit;
if (instance_exists(obj_pause) && obj_pause.pause)
	exit;
draw_set_color(c_white)
var seconds = 0
var minutes = 0
var s_str = ""
var m_str = ""
seconds = global.level_seconds
minutes = global.level_minutes
var mm = frac(seconds)
mm = string(mm)
mm = string_copy(mm, 3, string_length(mm) - 3)
while (string_length(mm) < 1)
	mm += "0"
while (string_length(mm) > 2)
	mm = string_delete(mm, string_length(mm), 1)
var sd = floor(seconds)
if (sd < 10)
	s_str = concat(0, sd)
else
	s_str = string(sd)
minutes = floor(minutes)
for (var hours = 0; minutes > 59; hours++)
	minutes -= 60
if (minutes < 10)
	m_str = concat(0, minutes)
else
	m_str = string(minutes)
if (hours < 10)
	hours = concat(0, hours)
else
	hours = string(hours)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(font_add_sprite_ext(spr_truefont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz:.!0123456789?'\"ÁÄÃÀÂÉÈÊËÍÎÏÓÖÕÔÚÙÛÜáäãàâéèêëíîïóöõôúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль/", true, 2))
draw_set_alpha(1)
draw_set_color(c_white)
var _roomname = room_get_name(room);
#macro ENTITY obj_player.state
var _name = variable_struct_get_names(obj_player.state);
var finalstr = concat(hours, ":", m_str, ":", s_str, ".", mm)
//draw_text(32, 32, "fps = " + string(fps_real));
//draw_text(32, 52, "character = " + string(obj_player.character));
//draw_text(32, 72, "hsp = " + string(obj_player.hsp));
//draw_text(32, 92, "vsp = " + string(obj_player.vsp));
//draw_text(32, 112, "movespeed = " + string(obj_player.movespeed));
//draw_text(32, 132, "grounded = " + string(obj_player.grounded));
//draw_text(32, 152, "sprite_index = " + string(obj_player.sprite_index));
//draw_text(32, 172, "image_index = " + string(obj_player.image_index));
//draw_text(32, 192, "x = " + string(obj_player.x));
//draw_text(32, 212, "y = " + string(obj_player.y));
//draw_text(32, 232, "current room = " + room_get_name(room));
//draw_text(32, 252, "doise = " + string(obj_player.ispeppino));
//draw_text(960 - ((string_length(finalstr) - 1) * string_width("A")), 540 - 8, finalstr)
//draw_text(32, 64 - 8, "https://discord.gg/2avBw3ztEu")
