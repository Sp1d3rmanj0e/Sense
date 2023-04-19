
global.difficulty = DIFF.EASY;
global.lostSenses = [];
global.lostGadgets = [];
global.nextRoundGadget = GADGET.NONE;

global.level = 1;

// Pause menu
global.settingKeybind = false;
global.fullscreen = true;
global.volume = 2;
global.arachnaphobiaMode = false;

global.timeCompleted = 0;
global.senseUseTime = 0;

function resetGlobalVars()
{
	resetCounters(); // Reset the sense use time counters
	resetLostSenses(); // Reset the senses lost in the previous match
	resetLostGadgets();
	global.nextRoundGadget = GADGET.NONE;
	global.level = 1;
	global.timeCompleted = 0;
	global.senseUseTime = 0;
	logImportant("RESETTING GLOBAL VARS");
}