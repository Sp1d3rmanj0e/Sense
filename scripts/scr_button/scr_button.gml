// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_button(_num){
	
	switch(_num)
	{
		case DIFF.EASY:
			show_debug_message("easy");
			global.difficulty = DIFF.EASY;
			break;
		case DIFF.MEDIUM:
			show_debug_message("med");
			global.difficulty = DIFF.MEDIUM;
			break;
		case DIFF.HARD:
			show_debug_message("hard");
			global.difficulty = DIFF.HARD;
			break;
		case DIFF.HARDER:
			show_debug_message("harder");
			global.difficulty = DIFF.HARDER;
			break;
	}
	show_debug_message(global.difficulty);
}

function set_gadget_to_use(_gadget)
{
	global.nextRoundGadget = _gadget;
	logVal("next round gadget set to", global.nextRoundGadget);
}