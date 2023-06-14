/// @description Movement and Collisions
if (state = PSTATE.NORMAL)
{
	
// Keybinds
if (!global.controllerConnected)
{
	keyRight = keyboard_check(global.kb_keyRight);
	keyLeft = keyboard_check(global.kb_keyLeft);
	keyUp = keyboard_check(global.kb_keyUp);
	keyDown = keyboard_check(global.kb_keyDown);
	keyInteract = keyboard_check_pressed(global.kb_keyInteract);
	
	// Calculate direction and speed
	moveX = (keyRight - keyLeft);
	moveY = (keyDown - keyUp);

	if (moveX != 0 && moveY != 0) // Moving diagonally
	{
		var _diagSpd = walkSp * sin(45) * sin(45);
		moveX *= _diagSpd;
		moveY *= _diagSpd;
	}
	else // Moving in only 1 axis
	{
		moveX *= walkSp;
		moveY *= walkSp;
	}
}
else // Controller is connected - use controller inputs instead
{
	moveX = gamepad_axis_value(global.connectedPad, gp_axisrh);
	moveY = gamepad_axis_value(global.connectedPad, gp_axisrv);
	keyInteract = gamepad_button_value(global.connectedPad, gp_shoulderrb);
	
	logImportant(string(keyInteract));
	
	moveX *= walkSp;
	moveY *= walkSp;
}

hsp = moveX;
vsp = moveY;

// Add collisions to the walls
collisions();

}
else if (state == PSTATE.DASH)
{
	// Saving hsp and vsp so it can be
	// reestablished after collisions
	var _hspSave = hsp;
	var _vspSave = vsp;
	
	collisions(); // Collisions sets hsp and vsp to 0
	
	hsp = _hspSave;
	vsp = _vspSave;
	
	// Create a particle dash
	part_type_sprite(dashTrail, obj_player.sprite_index, true, true, false); // Set particle to player's sprite_index
	part_type_scale(dashTrail, image_xscale, image_yscale);					 // Flip the particle if necessary
	part_particles_create(pSystem, x, y, dashTrail, 1);						 // Create the particle
	
	// Stun any enemies the player collides with
	var _collId = instance_place(x, y, enemies); // Get Id of collided enemies
	if (_collId != noone)
		with(_collId) stun(3 * room_speed); // Stun for 3 seconds
}
