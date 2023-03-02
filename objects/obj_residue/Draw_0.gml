/// @description Draw glitch if glitched

// Draw concealed residue if not detected
if (!smelled) draw_self();
else
{
	// Draw the real residue if detected
	draw_sprite(realResidue, 0, x, y);
	
	// Draw glitches on top of residue if glitched
	if (glitched)
		draw_sprite(spr_resGlitches, 0, x, y);
}

if (!smelled)
{
	// Draw smellProgress healthbar
	draw_healthbar(bbox_left, bbox_bottom, bbox_right, bbox_bottom+12,
				   smellProgress, c_black, c_red, c_green, 0, true, true);
}