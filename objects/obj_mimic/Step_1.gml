/// @description State Machine

// Get direction of motion
event_inherited();

script_execute(stateScript);

// Transform into nearby enemies
if (distance_to_object(enemies) < transformDist)
{
	show_debug_message("copying new enemy");
	// Start the transformation timer
	mimicFormTimer = mimicFormTime * room_speed;
	
	// Get ID of copied enemy
	instance_deactivate_object(id);
	copyID = instance_nearest(x,y,enemies);
	instance_activate_object(id);
	
	// Take enemy's behavior
	stateScript = copyID.stateScript;
	
	// Take enemy's sprite
	sprite_index = copyID.sprite_index;
}

// Decrement timer
if (mimicFormTimer > 0) mimicFormTimer--;
else mimicFormTimer = -1;

// If close to player, transform into demon
if (scr_sight(viewConeDeg,maxViewDist,dir)  || place_meeting(x,y,obj_player))
{
	stateScript = defaultScript;
	sprite_index = defaultSprite;
}