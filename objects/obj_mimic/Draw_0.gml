/// @description Insert description here
// You can write your code in this editor

draw_self();

var _string = (distance_to_object(enemies) < transformDist) && (stateScript == defaultScript)

draw_set_color(c_white);
draw_text(x,y,_string);
draw_text(x,y+20,stateScript);
draw_text(x,y+40,mimicFormTimer);
draw_text(x,y+60,anger);
draw_set_color(c_black);