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
		// (-1 signifies no options)
		case LISTTYPE.OPTIONS:
			addButton(_buttonArr, "Graphics", true);
			addButton(_buttonArr, "Controls", true);
			addButton(_buttonArr, "Audio", true);
			addButton(_buttonArr, "Copy", true);
			addButton(_buttonArr, "Exit", true);
			break;
			
		case LISTTYPE.GRAPHICS:
			addButton(_buttonArr, "Graphics Quality", false, ["Low", "Medium", "High"]);
			addButton(_buttonArr, "VSync", true, ["On", "Off"]);
			break;
			
		case LISTTYPE.CONTROLS:
			addButton(_buttonArr, "Keybind Ex. 1", true, [-1]);
			addButton(_buttonArr, "Keybind Ex. 2", true, [-1]);
			addButton(_buttonArr, "Keybind Ex. 3", true, [-1]);
			addButton(_buttonArr, "Keybind Ex. 4", true, [-1]);
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