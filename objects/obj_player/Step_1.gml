/// @description Movement and Collisions
if (state = PSTATE.NORMAL)
{
	
// Keybinds
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyInteract = keyboard_check_pressed(vk_space);

// Calculate direction and speed
moveX = (keyRight - keyLeft);
moveY = (keyDown - keyUp);

if (moveX != 0 && moveY != 0) // Moving diagonally
{
	var _diagSpd = walkSp * sin(45) * sin(45);
	moveX *= _diagSpd;
	moveY *= _diagSpd;
}
else // Moving in only 1 axis
{
	moveX *= walkSp;
	moveY *= walkSp;
}

hsp = moveX;
vsp = moveY;

// Add collisions to the walls
collisions(hsp, vsp);

}
