/// @description Leave keybind mode

global.settingKeybind = false;
parent.selected = 0; // Tell button to leave keybind mode

with(obj_loadAndSaveKeybinds) saveKeybindsToFile();