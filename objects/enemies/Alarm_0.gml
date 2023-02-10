/// @description Spawn residue

with(instance_create_layer(x,y,"Senses", obj_residue))
{
	switch(other.object_index)
	{
		case obj_eyeball:
			realResidue = spr_resTeardrop;
			break;
			
		case obj_ghost:
			realResidue = spr_resGoo;
			break;
			
		case obj_janitor:
			realResidue = spr_resMudprints;
			break;
			
		case obj_mimic:
			realResidue = spr_resGlitches;
			break;
			
		case obj_spider:
			realResidue = spr_resWeb;
			break;
	}
}

alarm[0] = residueTimer;