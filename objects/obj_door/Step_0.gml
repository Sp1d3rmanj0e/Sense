/// @description Check if entities near

// Check if entity is near
if (distance_to_object(canOpenDoors) < WORLD.CELL_SIZE)
{
	var cellSize = WORLD.CELL_SIZE;
	var checkLength = cellSize * 3;
	var checkWidth = cellSize;
	var topOrigin = y - cellSize;
	var leftOrigin = x - cellSize;
	
	// Origin is in the top right
	// The check shape is similar to a "+"
	if (collision_rectangle(leftOrigin, checkWidth, leftOrigin + checkLength) != noone) // Horizontal (-)
	&& (collision_rectangle() != noone) // Vertical   (|)
	{
		
	}
}