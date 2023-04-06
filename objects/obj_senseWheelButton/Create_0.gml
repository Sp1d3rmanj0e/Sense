/// @description Insert description here
// You can write your code in this editor
event_inherited(); // Follow Camera

image_index = sense;
rotationOffset = 0;

// Initialized before create event

// startAngle - the default angle of the button if no offset is in place
// sense      - the sense the button represents
// parent     - the id of obj_spinnywheel creator
// senseSprite- the sprite the sense button represents

function switch_sense(_sense)
{
	with(parent) // Tell parent to set this button as the selected button
		change_sense(_sense);
		
	if (instance_exists(obj_player))
		obj_player.curSense = _sense;
}