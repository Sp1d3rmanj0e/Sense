// Door vars
openable = false;
// doorOpen = most likely false

// Put a wall under the door if
// the door started out closed
if (!doorOpen) event_user(0);

// Timers
interactDelay = 1;
interactDelayTimer = -1;

// Shader vars
var pixelScale = 6;

upixelH = shader_get_uniform(shd_outline, "pixelH");
upixelW = shader_get_uniform(shd_outline, "pixelW");
texelW = pixelScale * texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = pixelScale * texture_get_texel_height(sprite_get_texture(sprite_index, 0));