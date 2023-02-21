/// @description Movement and Collisions

show_debug_message("speed is: " + string(walkSp)); 

if (state = PSTATE.NORMAL)
{
	
// Set variables for movement
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

// Complex keybinds
keyInteract = keyboard_check_pressed(vk_space);

// Calculate direction and speed
moveX = (keyRight - keyLeft);
moveY = (keyDown - keyUp);

// Get the hypotenuse of moving diagonally
if (moveX != 0 && moveY != 0)
{
	var _diagSpd = walkSp * sin(45) * sin(45);
	moveX *= _diagSpd;
	moveY *= _diagSpd;
}
else
{
	moveX *= walkSp;
	moveY *= walkSp;
}

hsp = moveX;
vsp = moveY;

// Add collisions to the walls
collisions(hsp, vsp);
}
