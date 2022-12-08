
// Door vars
openable = false;

// Shader vars
pixelScale = 6;

upixelH = shader_get_uniform(shd_outline, "pixelH");
upixelW = shader_get_uniform(shd_outline, "pixelW");
texelW = pixelScale * texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = pixelScale * texture_get_texel_height(sprite_get_texture(sprite_index, 0));