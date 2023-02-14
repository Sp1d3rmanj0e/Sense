// Set up controller

/*
	[
		[BASE TILE,[REPLACEMENT, WEIGHT],[REPLACEMENT, WEIGHT]]
		[BASE TILE,[REPLACEMENT, WEIGHT],[REPLACEMENT, WEIGHT]]
	]
*/

// Randomize
randomize();

controller =
[
	[6,[1,1],[7,1],[13,1],[19,1],[25,1],[31,1]],
	[12,[2,2],[8,2],[14,2],[20,2],[26,1],[32,1]],
	[18,[3,2],[9,2],[15,2],[21,2],[27,1],[33,1]],
	[24,[4,2],[10,2],[16,2],[22,2],[28,1],[34,1]],
	[30,[5,2],[11,2],[17,2],[23,2],[29,1],[35,1]]
	
	
	
];

// Gets tilemap id
var _tilemap = layer_tilemap_get_id("walls");

// Finds amount of tiles in map
var _tileX = ceil(room_width / WORLD.CELL_SIZE);
var _tileY = ceil(room_height / WORLD.CELL_SIZE);

// Goes through every tile
for (var i = 0; i < _tileX; i++)
{
	for (var j = 0; j < _tileY; j++)
	{
		// Go through every possible controller value to see if any match
		for (var k = 0; k < array_length(controller); k++)
		{
			// If one matches, go to the next step
			if (tilemap_get_at_pixel(_tilemap, i * WORLD.CELL_SIZE, j * WORLD.CELL_SIZE)
			==  controller[k][0])
			{
				var _totalWeight = 0;
				var _options = array_length(controller[k]);
				var _chosenTile = controller[k][_options-1][0];  // Sets to last value if none others match
				
				// Go through all replacement options and get total weight
				for (var l = 1; l < _options; l++)
				{
					_totalWeight += controller[k][l][1];
				}
				
				// Randomize which tile is chosen
				for (var l = 1; l < _options; l++)
				{
					// Calculate individual weight
					var _percWeight = controller[k][l][1] / _totalWeight * 100;
					
					// If tile is chosen, go to next step
					if (irandom(100) <= _percWeight)
					{
						_chosenTile = controller[k][l][0];
						break;
					}
				}
				
				tilemap_set(_tilemap, _chosenTile, i, j);
			}
		}
	}
}