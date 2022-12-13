/// @description Start flicker timer

// Light variables
toggleLight = true;
minTime = 0.25 * room_speed;
maxTime = 1 * room_speed;

percentOff = 10;

flickTime = 0.20 * room_speed;

// Start alarm
alarm[0] = irandom_range(minTime, maxTime);