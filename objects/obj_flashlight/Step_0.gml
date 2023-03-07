/// @description Insert description here
// You can write your code in this editor

// Follow player
x = obj_player.x;
y = obj_player.y - 20;

// Point towards mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

// Toggle Light On/Off based on player's current sense
lightOn = (obj_player.curSense == SENSE.SEE);

// Flashlight will look off when light is off (and v/v)
image_index = lightOn;