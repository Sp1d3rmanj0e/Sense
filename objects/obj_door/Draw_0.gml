/// @description Insert description here
// You can write your code in this editor

shader_set(shd_outline);
shader_set_uniform_f(upixelW, texelW);
shader_set_uniform_f(upixelH, texelH);
draw_self();
shader_reset();