/// @description Insert description here
// You can write your code in this editor

// Stores all the buttons the list object will make
buttonArr = [];

// Property vars
buttonHeight = 50;
padding = 5;

// Stores the IDs of all buttons made
buttonIDs = ds_list_create();

// Functions

function createButtons()
{
	for (var i = 0; i < array_length(buttonArr); i++)
	{
		// Get the button array
		var _button = buttonArr[i];
		
		// Create a new button and store its ID
		var _buttonID = instance_create_layer(x, y + (i * (buttonHeight + padding)), "Instances", obj_pauseButton,
		{
			generation : generation,
			text : _button[0],
			isToggle : _button[1],
			options : _button[2],
			selected : _button[3],
			height : buttonHeight,
			width : 300
		});
		
		ds_list_add(buttonIDs, _buttonID); // Add the button ID to the list
	}
}

// Destroy all buttons the list has created
function destroy()
{
	for (var i = 0; i < ds_list_size(buttonIDs); i++)
	{
		var _ID = ds_list_find_value(buttonIDs, i);
		instance_destroy(_ID); 
	}
	
	instance_destroy();
}

function destroyGen(_gen)
{	
	if (generation >= _gen)
	{
		if (buttonParent != noone) buttonParent.listID = noone; // Reset target Id because list is going to be destroyed
		destroy();
	}
}