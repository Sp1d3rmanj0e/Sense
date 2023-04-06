/// @description Button Activation

show_debug_message(">>>>> Clicked <<<<<");

switch(bText) // Does different actions based on its text
{
	case "Graphics":
		new_list(LISTTYPE.GRAPHICS);
		break;
		
	case "Audio":
		new_list(LISTTYPE.AUDIO);
		break;
		
	case "Controls":
		new_list(LISTTYPE.CONTROLS);
		break;
		
	case "Return to Main Menu":
		with(pauseSpawner) event_user(0); // Unpause game
		resetGlobalVars();
		room_goto(rm_intro);
		break;
		
	case "Resume":
		with(obj_pauseList) destroyGen(0); // Destroy all lists and children of said lists (buttons)
		with(pauseSpawner) event_user(0); // Unpause game
		break;
		
	case "Move Left":
	case "Move Right":
	case "Move Up":
	case "Move Down":
	case "Interact":
	case "Activate Gadget":
	case "Sense 1 Hotkey":
	case "Sense 2 Hotkey":
	case "Sense 3 Hotkey":
	case "Sense 4 Hotkey":
	case "Sense 5 Hotkey":
	 
		if (selected == 1) // Entering keybind mode
		{
			// Create this object to get the next keyboard button
			// pressed, then set its creator's (this button) keybind to
			// the new button
			instance_create_layer(0,0, "Instances", obj_keybindSetter,
			{
				parent : id
			});
		}
		
		break;
		
	case "Fullscreen":
		global.fullscreen = selected;
		window_set_fullscreen(global.fullscreen);
		break;
		
	case "Arachnaphobia Mode":
		global.arachnaphobiaMode = selected;
		break;
		
	case "Volume":
		global.volume = selected;
		logVal("new volume", global.volume);
		break;
		
	default:
		show_debug_message("No button task assigned to this button");
}