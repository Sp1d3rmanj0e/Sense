/// @description Insert description here
// You can write your code in this editor

logImportant("created button");

// Property vars
defaultColor = make_color_rgb(150, 50*generation + 50, 50*generation + 50);
selColor = c_white;

titleOffset = width*0.25;
valueOffset = width*(2/3);

// Value vars
listID = noone; // Stores a listID if the
				// button makes a new list

/*
 Default create vars (happens before create event)

 		generation : generation,
		bText : _button[0],
		isToggle : _button[1],
		options : _button[2],
		selected : _button[3],
		height : buttonHeight,
		width : 300
*/

// Functions

/*
 * Draws arrows that looks like this
 * Ex. drawDecorArrow(0, 0, 1, 3, 1)
 *
 * \ \ \
 *  \ \ \
 *  / / /
 * / / /
 */

/*
 * @param _startX - place where the first arrow will start
 * @param _centerY - middle of the arrow
 * @param _height - how tall the arrow will be from either side of _centerY
 * @param _width - how wide the arrows will be
 * @param _instances - how many arrows there will be
 * @param _spacing - how separated the arrows are from eachother
 */
function draw_decor_arrow(_startX, _centerY, _height, _width, _instances, _spacing)
{
	for (var i = 0; i < _instances; i++)
	{
		var _offset = (i * _width) + (i * _spacing);
		
		// Line pointing down
		draw_line(_startX + _offset, _centerY, _startX + _width + _offset, _centerY + _height);
	
		// Line pointing up
		draw_line(_startX + _offset, _centerY, _startX + _width + _offset, _centerY - _height);
	}
}

function new_list(_type)
{
	if (listID != noone) // Create a list if none have been made
	{
		with (listID) destroy();
		listID = noone;
	}
	else
	{
	with(obj_pauseList) destroyGen(other.generation+1);
	//listID = scr_createList(_type, x+width, 0, generation+1, id); // Flat version
	listID = scr_createList(_type, x+width, y, generation+1, id); // Drop-down version
	}
}