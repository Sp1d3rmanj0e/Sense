/// @description Spawn residue (Smell sense)

with(instance_create_layer(x,y,"Senses", obj_residue))
{
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
			show_debug_message("Creating mimic glitches");
			break;
			
		case scr_spiderA:
			realResidue = spr_resWeb;
			break;
	}
	
	if (other.object_index == obj_mimic)
	{
		glitched = true;
		show_debug_message("This is a mimic");
	}
}



alarm[0] = residueTimer;