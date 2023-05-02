/// @description State engine and line of sight

// Get direction of motion
event_inherited();

if (!stunned)
	script_execute(stateScript);

