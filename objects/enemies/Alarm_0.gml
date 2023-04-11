/// @description Spawn residue (Smell sense)

var isMimic = (object_index == obj_mimic);

with(instance_create_layer(x,y,"Structures", obj_residue))
{
	// Place residue based on the enemy's animation script
	switch(other.animScript)
	{
		case scr_eyeballA:
			realResidue = spr_resTeardrop;
			if (isMimic) realResidue = spr_resTeardropGlitched;
			break;
			
		case scr_ghostA:
			realResidue = spr_resGoo;
			if (isMimic) realResidue = spr_resGooGlitched;
			break;
			
		case scr_janitorA:
			realResidue = spr_resMudprints;
			if (isMimic) realResidue = spr_resMudprintsGlitched;
			break;
			
		case scr_mimicA:
			realResidue = spr_resGlitches;
			break;
			
		case scr_spiderA:
			realResidue = spr_resWeb;
			if (isMimic) realResidue = spr_resWebGlitched;
			break;
	}
	
	// If the enemy is secretly a mimic, leave a glitch residue behind as well
	if (other.object_index == obj_mimic)
	{
		glitched = true;
	}
}



alarm[0] = residueTimer;