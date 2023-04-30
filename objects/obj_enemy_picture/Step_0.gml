/// @description Interact code

// If player is close to the painting and hits
// the interact button, take them to the enemy
// tutorial room.
if (distance_to_object(obj_player) < 5)
{
	if (keyboard_check_pressed(global.kb_keyInteract))
	{
		// Create a controller to tp the player back to this point
		// when the player returns to this room
		instance_create_layer(0, 0, "Instances", obj_tpPlayerController);
		
		// Get the tutorial room to go to when activated
		switch(startFrame)
		{
			case 0: room_goto(rm_tut_ghost); break;
			case 1: room_goto(rm_tut_eyeball); break;
			case 2: room_goto(rm_tut_janitor); break;
			case 3: room_goto(rm_tut_mimic); break;
			case 4: room_goto(rm_tut_spider); break;
			case 5: room_goto(rm_tut_sanityDemon); break;
		}
	}
	
	image_index = startFrame + 6; // Outlined version
}
else image_index = startFrame; // Not outlined version
