/// @description Insert description here
// You can write your code in this editor

// Draw all uncolored descriptions
for (var i = 0; i < count; i++)
{
	if (selColor != i) draw_sprite(spriteGrey,i,x, y + height * i);
}

// Draw selected description over it
for (var i = 0; i < count; i++)
{
	if (selColor = i) draw_sprite_ext(spriteColor,i,x, y + height * i,upsize,upsize,0,c_white,1);
}