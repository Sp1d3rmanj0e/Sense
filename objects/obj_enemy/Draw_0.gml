/// @description Insert description here
// You can write your code in this editor

// Add hovering up and down  **CREDIT TO 1up Indie
hover = hover + sin(hoverTimer * 0.03) * 0.3;
hoverTimer++;

draw_sprite(sprite_index, image_index, x, y + hover);
draw_text(x,y,state);
draw_text(x,y+20,enemyMemoryTimer)
draw_text(x,y+40, image_index);