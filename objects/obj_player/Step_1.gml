/// @description Movement and Collisions

// Set variables for movement
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

// Complex keybinds
keyInteract = keyboard_check_pressed(vk_space);

// Calculate direction and speed
hsp = (keyRight - keyLeft) * walkSp;
vsp = (keyDown - keyUp) * walkSp;

// Add collisions to the walls
collisions(hsp, vsp);