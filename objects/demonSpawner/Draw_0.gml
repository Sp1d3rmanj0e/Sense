/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_text(obj_player.x, obj_player.y, "sanity remaining: " + string(sanity));
draw_text(obj_player.x, obj_player.y+20, "maxSpawns: " + string(maxSpawns));
draw_set_color(c_black);