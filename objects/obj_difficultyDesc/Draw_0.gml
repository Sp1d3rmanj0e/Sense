/// @description Insert description here
// You can write your code in this editor

// Draw all uncolored descriptions
for (var i = 0; i < count; i++)
{
	if (selColor != i) draw_sprite_ext(spriteGrey,i,x, y + height * i, 2, 2, 0, c_white, 1);
}

// Draw selected description over it
for (var i = 0; i < count; i++)
{
	if (selColor = i) draw_sprite_ext(spriteColor,i,x, y + height * i,1 + upsize,1 + upsize,0,c_white,1);
}