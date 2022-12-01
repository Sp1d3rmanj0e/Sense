/// @description Fade if in front of player

draw_self();

if (depth <= obj_player.depth)
{
	image_alpha = fadedAlpha;
}
else
{
	image_alpha = 1;
}