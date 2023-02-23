/// @description Spawn residue (Smell sense)

with(instance_create_layer(x,y,"Senses", obj_residue))
{
	// Place residue based on the enemy's animation script
	switch(other.animScript)
	{
		case scr_eyeballA:
			realResidue = spr_resTeardrop;
			break;
			
		case scr_ghostA:
			realResidue = spr_resGoo;
			break;
			
		case scr_janitorA:
			realResidue = spr_resMudprints;
			break;
			
		case scr_mimicA:
			realResidue = spr_resGlitches;
			break;
			
		case scr_spiderA:
			realResidue = spr_resWeb;
			break;
	}
	
	// If the enemy is secretly a mimic, leave a glitch residue behind as well
	if (other.object_index == obj_mimic)
	{
		glitched = true;
	}
}



alarm[0] = residueTimer;