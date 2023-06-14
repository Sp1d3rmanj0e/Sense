/// @description Controller Mouse

// Move like a mouse
hsp = gamepad_axis_value(global.connectedPad, gp_axisrh);
vsp = gamepad_axis_value(global.connectedPad, gp_axisrv);

hsp *= 5;
vsp *= 5;

x += hsp;
y += vsp;

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);