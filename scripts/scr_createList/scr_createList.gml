// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createList(_type, _x, _y, _gen, _parent){

	// Create a new list
	var _listID = instance_create_layer(_x, _y, "Instances", obj_pauseList,
	{
		generation : _gen,
		buttonParent : _parent
	});
	
	logImportant("Created list");
	
	// Create an array to contain button data
	var _buttonArr = [];
	
	/*
	 * Function to easily add buttons to the buttonArr
	 *
	 * @param         _arr[][][] - the array to push to
	 * @param String  _text      - the text the button will have
	 * @param boolean _isToggle  - true is an on/off, false is an arrow selector
	 * @param         _options[] - the options the button can be
	 * @param e		  _default   - value to start the button with
	 */
	function addButton(_arr, _text, _isToggle, _options = [-1], _default = 0)
	{
		array_push(_arr, [_text, _isToggle, _options, _default]);
	}
	
	/*
	 * Possible types:
	 * > OPTIONS  - Creates a new list with audio and keybind options
	 * > KEYBINDS - Change any keybind on the list (no duplicates allowed)
	 * > AUDIO    - Change audio volume
	 */
	
	switch(_type)
	{
		// (-1/no fourth input  signifies no options)
		case LISTTYPE.OPTIONS:
			addButton(_buttonArr, "Graphics", true);
			addButton(_buttonArr, "Controls", true);
			addButton(_buttonArr, "Audio", true);
			addButton(_buttonArr, "Return to Main Menu", true);
			addButton(_buttonArr, "Resume", true);
			break;
			
		case LISTTYPE.GRAPHICS:
			addButton(_buttonArr, "Arachnaphobia Mode", true, ["On", "Off"]);
			addButton(_buttonArr, "Fullscreen", true, ["On", "Off"]);
			break;
			
		case LISTTYPE.CONTROLS:
			addButton(_buttonArr, "Move Left", true, [getUnicodeString(global.kb_keyLeft), "Press any key..."]);
			addButton(_buttonArr, "Move Right", true, [getUnicodeString(global.kb_keyRight), "Press any key..."]);
			addButton(_buttonArr, "Move Up", true, [getUnicodeString(global.kb_keyUp), "Press any key..."]);
			addButton(_buttonArr, "Move Down", true, [getUnicodeString(global.kb_keyDown), "Press any key..."]);
			addButton(_buttonArr, "Interact", true, [getUnicodeString(global.kb_keyInteract), "Press any key..."]);
			addButton(_buttonArr, "Activate Gadget", true, [getUnicodeString(global.kb_keyGadgetActivate), "Press any key..."]);
			addButton(_buttonArr, "Sense 1 Hotkey", true, [getUnicodeString(global.kb_keyHotkey1), "Press any key..."]);
			addButton(_buttonArr, "Sense 2 Hotkey", true, [getUnicodeString(global.kb_keyHotkey2), "Press any key..."]);
			addButton(_buttonArr, "Sense 3 Hotkey", true, [getUnicodeString(global.kb_keyHotkey3), "Press any key..."]);
			addButton(_buttonArr, "Sense 4 Hotkey", true, [getUnicodeString(global.kb_keyHotkey4), "Press any key..."]);
			addButton(_buttonArr, "Sense 5 Hotkey", true, [getUnicodeString(global.kb_keyHotkey5), "Press any key..."]);
			break;
			
		case LISTTYPE.AUDIO:
			addButton(_buttonArr, "Volume", false, ["10%", "25%", "50%", "75%", "100%"]);
			break;
	}
	
	with (_listID) 
	{
		buttonArr = _buttonArr;
		createButtons();
	}
	return _listID;
}