/// @description Insert description here
// You can write your code in this editor

// Add hovering up and down  **CREDIT TO 1up Indie
hover = hover + sin(hoverTimer * 0.03) * 0.3;
hoverTimer++;

draw_sprite(sprite_index, image_index, x, y + hover);
draw_text(x,y,state);
draw_text(x,y+20,enemyMemoryTimer)
draw_text(x,y+40, image_index);

draw_line_width(x,y,x+lengthdir_x(75,dir),y+lengthdir_y(75,dir),5);

/* If sight line
draw_set_color(c_yellow);
_dir = point_direction(x, y, obj_player.x, obj_player.y); // Gets direction of player
draw_line_width(x,y,x+lengthdir_x(75,_dir),y+lengthdir_y(75,_dir),5);
draw_set_color(c_black);
*/