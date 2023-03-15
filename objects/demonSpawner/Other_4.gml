/// @description

switch(global.difficulty)
{
	
	case DIFF.EASY:
		sanity = 3000;
		break;
	case DIFF.MEDIUM:
		sanity = 2500;
		break;
	case DIFF.HARD:
		sanity = 2000;
		break;
	case DIFF.HARDER:
		sanity = 1750;
		break;
}

startSanity = sanity;

// Get player spawn location (to later summon the demon on)
startX = obj_player.x;
startY = obj_player.y;
