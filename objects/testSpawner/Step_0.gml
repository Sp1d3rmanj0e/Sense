/// @description Insert description here
// You can write your code in this editor

if (room != rm_testingHub)
{
	// Check for line change command
	moveUp = keyboard_check_pressed(vk_up);
	moveDown = keyboard_check_pressed(vk_down);

	// Check for change status command
	moveLeft = keyboard_check_pressed(vk_left);
	moveRight = keyboard_check_pressed(vk_right);

	moveY = (moveDown - moveUp);
	moveX = (moveRight - moveLeft);
	
	obj_player.playerHealth = 100;
}

// Move line accordingly
if (moveY != 0)
{
	// Change selected line
	scrlY += moveY;
	
	// Check if line change goes out of bounds (change accordingly)
	if (scrlY > totalBars) scrlY = 0;
	else if (scrlY < 0) scrlY = totalBars;
}

// Move horizontally if needed
if (moveX != 0)
{
	switch(scrlY)
	{
		case 0: // Entity select
			var arrLen = array_length(entities)-1;
			scrlX += moveX;
			
			// Cap scrlX if needed
			if (scrlX < 0) scrlX = arrLen; // Send to end of list
			else if (scrlX > arrLen) scrlX = 0; // Send to front of list
			
			selEntity = entities[scrlX][1];
			break;
		case 1: // Lights
			lightsOn = !lightsOn; 
			break;
		case 2: // Enemy speed
			if (moveX == 1) // Scroll right
			{
				curSpd += 0.25; // Increment
			}
			else // Scroll left
			{
				curSpd = max(curSpd - 0.25, 0); // Decrement
			}
			break;
		case 3: // Sim running
			simRunning = !simRunning; 
			break;
		case 4:
			viewRing = !viewRing;
			break;
		case 5:
			if (moveX == 1) // Scroll right
			{
				viewRange += 0.25 * WORLD.CELL_SIZE; // Increment
			}
			else // Scroll left
			{
				viewRange = max(viewRange - 0.25 * WORLD.CELL_SIZE, 0); // Decrement
			}
			break;
	}
}

// Spawn lighting instance if lighting is turned on
if (lightsOn == true)
{
	if (!instance_exists(obj_lighting))
	{
		instance_create_layer(x,y,"Lighting",obj_lighting);
	}
}
else if (instance_exists(obj_lighting))
{
	instance_destroy(obj_lighting);
}

// Start simulation
if (simRunning) && (lock == false)
{
	lock = true;
	
	// Spawn every entity in the list
	for (var i = 0; i < entityCnt; i++)
	{
		// Get ds_grid data
		var _x  = ds_grid_get(enemyArr, 1, i);
		var _y  = ds_grid_get(enemyArr, 2, i);
		var _id = ds_grid_get(enemyArr, 3, i);
		
		var _spawnID = instance_create_layer(_x, _y, "Instances", _id)
		
		//with(_spawnID) eSpeed = other.curSpd;
		with(_spawnID) maxViewDist = other.viewRange;
		
		// Spawn it in
		ds_list_add(enemyID, _spawnID);
	}
}
else if (!simRunning)
{
	lock = false;
	
	for (var j = 0; j < ds_list_size(enemyID); j++)
	{
		instance_destroy(ds_list_find_value(enemyID, j));
	}
	ds_list_clear(enemyID);
}