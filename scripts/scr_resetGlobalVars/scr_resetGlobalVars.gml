// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function resetGlobalVars(){
	
	resetCounters(); // Reset the sense use time counters
	resetLostSenses(); // Reset the senses lost in the previous match
	resetLostGadgets();
	global.nextRoundGadget = GADGET.NONE;
	global.level = 1;
	logImportant("RESETTING GLOBAL VARS")
}