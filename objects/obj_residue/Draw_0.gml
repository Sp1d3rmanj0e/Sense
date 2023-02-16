/// @description Draw glitch if glitched

// Draw concealed residue if not detected
if (!smelled) draw_self();
else
{
	// Draw the real residue if detected
	draw_sprite(realResidue, 0, x, y);
	draw_text(x, y, realResidue);
	
	// Draw glitches on top of residue if glitched
	if (glitched)
	{
		draw_sprite(spr_resGlitches, 0, x, y);
		draw_text(x, y+20, "glitched");
	}
}