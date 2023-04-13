/*
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


// Enums
enum DIFF
{
	EASY = 0,
	MEDIUM = 1,
	HARD = 2,
	HARDER = 3
}

enum STATE
{
	WANDER = 5,
	CHASE = 6,
	AGGRO = 7,
}

enum WORLD
{
	CELL_SIZE = 64
}

enum SENSE
{
	FEEL,
	HEAR,
	SEE,
	SMELL,
	TASTE,
	NONE
}

enum GADGET
{
	GPS,
	LURE,
	TELEPORT,
	DASH,
	THERMAL,
	NONE
}

enum PSTATE
{
	NORMAL,
	FREEZE,
	DASH
}

enum GPS
{
	PLAYER,
	AIRBORNE,
	GROUND,
	ENEMY
}

enum LISTTYPE
{
	OPTIONS,
	GRAPHICS,
	AUDIO,
	CONTROLS
}
