/// @description Insert description here
// You can write your code in this editor

// Turns the light on or off based on weighted chances
toggleLight = (irandom(100) > percentOff);

// If light gets turned off, flick back on
if (!toggleLight) alarm[1] = flickTime;
else alarm[0] = irandom_range(minTime, maxTime); // Restart alarm