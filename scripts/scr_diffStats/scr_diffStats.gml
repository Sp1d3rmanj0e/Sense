// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_diffStats(_easy, _medium, _hard, _hCore)
{
	switch(global.difficulty)
	{
		case DIFF.EASY:   return _easy;
		case DIFF.MEDIUM: return _medium;
		case DIFF.HARD:   return _hard;
		case DIFF.HARDER: return _hCore;
		default: return _easy;
	}
}