/// @description Camera

// Get camera dimensions
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

var _camX = x - _camWidth/2;
var _camY = y - _camHeight/2;

// Camera does not go out of map bounds
_camX = clamp(_camX, 0, room_width - _camWidth + 150);
_camY = clamp(_camY, 0, room_height - 500); // -500 so the camera doesn't block the
											// bottom of the screen

// Get if viewport is activated
var _viewport = room_get_viewport(room, 0);
vp_visible = _viewport[0];

// Camera follows player
if (vp_visible)
	camera_set_view_pos(view_camera[0], _camX + irandom_range(-sShake, sShake), _camY + irandom_range(-sShake, sShake));
else
	camera_set_view_pos(view_camera[0], 0 + irandom_range(-sShake, sShake), 0 + irandom_range(-sShake, sShake));
