// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//global.midTransition = false;
global.roomTarget = noone;

// Creates a layer for the sequence to be on
function TransitionPlaceSequence(_type)
{
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999, "transition");
	
	// Spawn sequence at camera location
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	var _layID = layer_sequence_create(_lay, _camX, _camY, _type);
	return _layID;
}

// Create the transition
function TransitionStart(_type, _roomTarget)
{
	global.roomTarget = _roomTarget;
	var _layID = TransitionPlaceSequence(_type);
	return _layID;
}

// Switch rooms
function TransitionChangeRoom()
{
	room_goto(global.roomTarget);
	TransitionFinished();
}

// End the transition
function TransitionFinished()
{
	layer_sequence_destroy(self.elementID);
}