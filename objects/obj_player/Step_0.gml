/// @description Interations with environment (+Feeling Sense)

// Start the player speed as normal
walkSp = origWalkSp;

// If colliding with janitor, match speed with him
if (place_meeting(x, y, obj_janitor))
{
		walkSp = obj_janitor.eSpeed;
}

// Slow down if colliding with webs
var _id = instance_place(x, y, obj_residue); // Get id of residue
if (_id != noone) && (_id.realResidue == spr_resWeb) // Check if the residue are webs
{
	walkSp *= 0.66; // Reduce speed by 1/3
}

// Feeling sense (vibrations when enemies are near)
if (tilemap_get_at_pixel(tilemap, mouse_x, mouse_y) && mouse_check_button(mb_left))
{
	curSense = SENSE.FEEL; // Set active sense to feel
	
	// Create a Ds_List to store how many enemies are within radius
	var _enemies = ds_list_create();
	
	// Check if enemies are within sense radius
	var _enemyNum = collision_circle_list(x, y, feelRad, enemies, false, 
										  false, _enemies, false); // Enemies are within circle
	for (var i = 0; i < _enemyNum; i++)
	{
		instance_create_layer(x, y, "Instances", obj_feelRing);
	}
}


