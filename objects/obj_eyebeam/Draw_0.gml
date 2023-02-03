/// @description Insert description here
// You can write your code in this editor

draw_self();

// Get theoretical player hitbox
var x1, x2, y1, y2;
x1 = obj_player.bbox_left;
x2 = obj_player.bbox_right;
y1 = obj_player.bbox_bottom;
y2 = obj_player.bbox_top - 48;

draw_rectangle(x1,y1,x2,y2,false);