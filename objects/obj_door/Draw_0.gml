/// @description Insert description here
// You can write your code in this editor

// Adds outline around door if openable
if (openable)
{
	shader_set(shd_outline);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
}
draw_self();
shader_reset();

draw_text(x,y,openable);
draw_text(x,y+20, doorOpen);