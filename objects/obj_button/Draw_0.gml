/// @description Insert description here
// You can write your code in this editor

draw_self();

// Set text to middle center + set color
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

// Draw text
draw_text_transformed(x,y,text, image_xscale, image_yscale, 0);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);