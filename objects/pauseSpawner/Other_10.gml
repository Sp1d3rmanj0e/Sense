/// @description Unpause game (manually)

gamePaused = false; // Unpause game

instance_activate_all(); // Reactivate the game
	
with(list) destroyGen(0); // Destroy all lists

//destroy_controller_mouse(existedPrior);