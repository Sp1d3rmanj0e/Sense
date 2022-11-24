/// @description Insert description here
// You can write your code in this editor

// Enemy variables
eSpeed = 4;
idleTime = 4;

// Other variables
task = -1;
newPath = true;

// Timers
idleTimer = -1;

// Create the path
path = path_add();
state = STATE.WANDER;