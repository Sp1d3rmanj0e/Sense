/// @description Insert description here
// You can write your code in this editor

// Add hovering up and down  **CREDIT TO 1up Indie
hover = hover + sin(hoverTimer * 0.03) * 0.3;
hoverTimer++;

draw_sprite_ext(sprite_index, image_index, x, y + hover, image_xscale, image_yscale, 0, c_white, 1);

draw_set_color(c_white);
//draw_text(x,y+20,stateScript);
//draw_text(x,y+40,mimicFormTimer);
draw_text(x,y+60,anger);
draw_set_color(c_black);

draw_text(x,y+20, sign(lengthdir_x(1,dir)));
draw_text(x,y-20, image_xscale);