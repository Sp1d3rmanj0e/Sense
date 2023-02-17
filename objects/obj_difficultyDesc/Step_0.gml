/// @description Insert description here
// You can write your code in this editor

// Reset sel color
selColor = -1;

for (var i = 0; i < count; i++)
{
	//get top left and bottom right corners
	var _x1 = 0;
	var _y1 = bbox_top + height*i;
	var _x2 = room_width;
	var _y2 = bbox_bottom + height*i+30;
	
	// Get mouse coords
	var _mx = mouse_x;
	var _my = mouse_y;
	
	//  If mouse is on a button section
	if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2))
	{
		selColor = i;
	}
}