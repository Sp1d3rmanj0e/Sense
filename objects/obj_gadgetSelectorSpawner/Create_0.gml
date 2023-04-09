/// @description

function getGadgetName(_gadget)
{
	switch(_gadget)
	{
		case GADGET.DASH:			return "Dash";
		case GADGET.GPS:			return "Tracker";
		case GADGET.LURE:			return "Decoy";
		case GADGET.TELEPORT:		return "Teleporter";
		case GADGET.THERMAL:		return "Thermal";
	}
	
	return "NO NAME";
}

function getNextRoom()
{
	switch(global.level)
	{
		case 1: return rm_Gwall_1; // Theoretically should never happen because level 1 is started by another button
		case 2:	return rm_Gwall_2;
		case 3:	return rm_Gwall_3;
		case 4:	return rm_Gwall_4;
		case 5:	return rm_Gwall_5;
		case 6:	return rm_intro; // Will be switched to win area
		default: show_debug_message("room not found"); return rm_intro;
	}
}

numButtons = 5;

buttonPadding = 25; // Creates empty space on either side of the
					// wall before buttons start spawning
				
buttonSpacing = (room_width - buttonPadding*2) / (numButtons+1);

// The leftmost gadgets will be the leftmost buttons
// when the buttons are created on the screen
gadgetSpawnOrder = [GADGET.DASH, GADGET.GPS, GADGET.LURE, GADGET.TELEPORT, GADGET.THERMAL];

for (var gadget = 0; gadget < numButtons; gadget++) {
	
	// By default, gadgets aren't lost, but the
	// following program will turn that to true
	// if the checked gadget was lost
	var gadgetIsLost = false;
	
	// Get a gadget from the list to check if it
	// is lost or not
	var gadgetToCheck = gadgetSpawnOrder[gadget];
	
	for (var lostGadgets = 0; lostGadgets < array_length(global.lostGadgets); lostGadgets++) {
	
		// Get one of the lost gadgets and check if the
		// gadget being checked is equal to one of the already
		// lost gadgets, if so, turn gadgetIsLost to true
		var lostGadget = global.lostGadgets[lostGadgets];
		if (gadgetToCheck == lostGadget) gadgetIsLost = true;
	}
	
	// If the gadget is lost, create a button
	// saying that the gadget is lost, otherwise,
	// create a button allowing the player to choose
	// that gadget
	var _buttonName = getGadgetName(gadgetToCheck); // Get the name of the gadget
													// that the button represents
	if (gadgetIsLost)
	{
		
		instance_create_layer(buttonPadding + buttonSpacing * (gadget+1), room_height * (4/5),
								"Instances", obj_button,
								{
									text : "[DESTROYED]"
								});
	}
	else
	{	
		instance_create_layer(buttonPadding + buttonSpacing * (gadget+1), room_height * (4/5),
								"Instances", obj_button,
								{
									text : _buttonName,
									executeCode : [set_gadget_to_use,gadgetToCheck],
									condition : "nextRoundGadget",
									valueForCondition : gadgetToCheck
								});
	}
	
}

// Create a continue button at the bottom of that all
instance_create_layer(room_width/2, room_height * (9/10),
						"Instances", obj_button,
						{
							text : "Confirm!",
							roomCode : getNextRoom() // Gets the next level to go to
						});