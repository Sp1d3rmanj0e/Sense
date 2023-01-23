global.difficulty = DIFF.EASY;

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

enum SENSES
{
	SEE,
	HEAR,
	FEEL,
	TASTE,
	SMELL
}