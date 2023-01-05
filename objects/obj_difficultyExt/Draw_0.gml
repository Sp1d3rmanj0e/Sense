/// @description Insert description here
// You can write your code in this editor

// Draw all uncolored descriptions
for (var i = 0; i < count; i++)
{
	if (selColor != i) draw_sprite(spriteGrey,i,x + width * i, y);
}

// Draw selected description over it
for (var i = 0; i < count; i++)
{
	if (selColor = i) draw_sprite_ext(spriteColor,i,x + width * i, y,upsize,upsize,0,c_white,1);
}