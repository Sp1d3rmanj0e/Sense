/// @description Randomize location of garbage

// get number of garbages currently on the map
var _numGarbage = instance_number(obj_garbage);

// Initialize ds_list
garbage = ds_grid_create(2,_numGarbage);

// Go through every garbage item in the level
for (var i = 0; i < _numGarbage; i++)
{
	// Get the id of the closest garbage pile
	var _id = instance_nearest(0,0,obj_garbage);
	
	// Store the x and y coordinates of the garbage
	ds_grid_set(garbage, 0, i, _id.x);
	ds_grid_set(garbage, 1, i, _id.y);
	
	// Delete the garbage
	instance_destroy(_id);
}

// Choose a random location from the list to be the garbage
var _randLoc = (irandom(ds_grid_height(garbage) -1));

// Get the data from that garbage row
var _x = ds_grid_get(garbage, 0, _randLoc);
var _y = ds_grid_get(garbage, 1, _randLoc);

// Spawn in garbage at said location
instance_create_layer(_x, _y, "Instances", obj_garbage);