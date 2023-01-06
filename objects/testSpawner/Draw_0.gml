/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);

if (room != rm_testingHub)
{
	// If on enemy selection, preview enemy spawning
	if (scrlY == 0)
	{
		// Draw preview enemy
		var _mx = mouse_x;
		var _my = mouse_y;

		// Get sprite of selected entity
		var _sprite = entities[scrlX][2];

		draw_sprite_ext(_sprite, 0, _mx, _my, 1, 1, 0, c_white, 0.5);
	
		// Add enemy details to array when clicked
		if (mouse_check_button_pressed(mb_left) && (entityCnt < maxEntities))
		{
			//[ID, X, Y]
		
			// Add sprite ID
			ds_grid_set(enemyArr,0,entityCnt,entities[scrlX][2]);
		
			// Add x and y vars
			ds_grid_set(enemyArr,1,entityCnt,_mx);
			ds_grid_set(enemyArr,2,entityCnt,_my);
		
			// Add actual ID
			ds_grid_set(enemyArr,3,entityCnt,entities[scrlX][0]);
		
			// Add one more entity
			entityCnt++;
		}
	}

	if (!simRunning)
	{
		// Draw all placed entities
		for (var i = 0; i < entityCnt; i++)
		{
			// Get ds_grid data
			var _sprite = ds_grid_get(enemyArr, 0, i);
			var _x  = ds_grid_get(enemyArr, 1, i);
			var _y  = ds_grid_get(enemyArr, 2, i);
		
			// Draw all sprites in data set
			draw_sprite(_sprite, 0, _x, _y);
		}
	}
}

draw_set_color(c_black);