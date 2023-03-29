/// @description Button Activation

show_debug_message(">>>>> Clicked <<<<<");

// Does different actions based on its text
switch(text)
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
		
	case "Exit":
		with(obj_pauseList) destroyGen(0); // Destroy all lists and children of said lists (buttons)
		with(pauseSpawner) event_user(0); // Unpause game
		break;
		
	case "Copy":
		new_list(LISTTYPE.OPTIONS);
		break;
		
	default:
		show_debug_message("No button task assigned to this button");
}