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