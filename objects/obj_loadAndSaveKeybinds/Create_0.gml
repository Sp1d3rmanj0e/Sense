/// @description Store default inputs

def_keyLeft = ord("A");
def_keyRight = ord("D");
def_keyUp = ord("W");
def_keyDown = ord("S");
def_keyInteract = vk_space;

def_keyGadgetActivate = ord("Q");

def_keyHotkey1 = ord("1");
def_keyHotkey2 = ord("2");
def_keyHotkey3 = ord("3");
def_keyHotkey4 = ord("4");
def_keyHotkey5 = ord("5");

// Sets the custom keybind set to the current keybind setup
function saveKeybindsToFile()
{
	var _keybindData = [];
	array_push(_keybindData, global.kb_keyLeft);
	array_push(_keybindData, global.kb_keyRight);
	array_push(_keybindData, global.kb_keyUp);
	array_push(_keybindData, global.kb_keyDown);
	array_push(_keybindData, global.kb_keyInteract);
	array_push(_keybindData, global.kb_keyGadgetActivate);
	array_push(_keybindData, global.kb_keyHotkey1);
	array_push(_keybindData, global.kb_keyHotkey2);
	array_push(_keybindData, global.kb_keyHotkey3);
	array_push(_keybindData, global.kb_keyHotkey4);
	array_push(_keybindData, global.kb_keyHotkey5);
	
	// Save the keybinds to a file
	// Special thanks to Shaun Spalding https://www.youtube.com/watch?v=R84mR52QaMg
	var _string = json_stringify(_keybindData);
	var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "keybinds.save");
	buffer_delete(_buffer);
	
	show_debug_message("keybinds have been saved!" + _string);
}

// Gets a custom keybind set from the computer
function importKeybinds()
{
	var _buffer = buffer_load("keybinds.save");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	global.kb_keyLeft			= _loadData[0];
	global.kb_keyRight			= _loadData[1];
	global.kb_keyUp				= _loadData[2];
	global.kb_keyDown			= _loadData[3];
	global.kb_keyInteract		= _loadData[4];
	global.kb_keyGadgetActivate = _loadData[5];
	global.kb_keyHotkey1		= _loadData[6];
	global.kb_keyHotkey2		= _loadData[7];
	global.kb_keyHotkey3		= _loadData[8];
	global.kb_keyHotkey4		= _loadData[9];
	global.kb_keyHotkey5		= _loadData[10];
}

// Returns whether a custom keybind set exists or not
function keybindsExist()
{
	return (file_exists("keybinds.save"));
}