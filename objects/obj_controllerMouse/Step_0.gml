/// @description Controller Mouse

// Move like a mouse
hsp = gamepad_axis_value(global.connectedPad, gp_axislh);
vsp = gamepad_axis_value(global.connectedPad, gp_axislv);

hsp *= 5;
vsp *= 5;

x += hsp;
y += vsp;

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);