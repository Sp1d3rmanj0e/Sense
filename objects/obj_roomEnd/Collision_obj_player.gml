/// @description When player reaches the end door

// Only activate once
if (!activated)
{
	activated = true;
	
	// Destroy all enemies
	with(enemies) instance_destroy();

	// Create a cutscene
	TransitionStart(sq_loseSense);
}