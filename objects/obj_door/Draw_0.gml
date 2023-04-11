/// @description Animations

/* All 4 frames 
0 [Closed]
1 [Open]
2 [Closed Highlighted]
3 [Open Highlighted]
*/

// Initialize the frame the door should be on
var _frame = doorOpen;

// If door is openable, switch to outlined sprites
if (openable) _frame += 2;

// Switch the frame to the correct one
image_index = _frame;

// Draw darkness under the door if it's the ending door
if (roomTarget != noone)
{
	draw_set_color(c_black);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
}

// Draw the door
draw_self();