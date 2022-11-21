/// @description Movement and Collisions

// Set variables for movement
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

// Calculate direction and speed
hsp = (keyRight - keyLeft) * walkSp;
vsp = (keyDown - keyUp) * walkSp;

// Collisions - Credit to Shaun Spalding
var bbox_side;

if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top) != 0 || (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom) != 0))
{
	if (hsp > 0) x = x - (x mod WORLD.TILE_SIZE) + (WORLD.TILE_SIZE - 1) - (bbox_right - x);
	else x = x - (x mod WORLD.TILE_SIZE) - (bbox_left - x);
	hsp = 0;
}

if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) != 0 || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp) != 0))
{
	if (vsp > 0) y = y - (y mod WORLD.TILE_SIZE) + (WORLD.TILE_SIZE - 1) - (bbox_bottom - y);
	else y = y - (y mod WORLD.TILE_SIZE) - (bbox_top - y);
	vsp = 0;
}

x += hsp;
y += vsp;