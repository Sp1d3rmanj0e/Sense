/// @description Insert description here
// You can write your code in this editor


// Variables created in constructor
// enemyThatKilledPlayer - object_index of the enemy that killed the player

// Deactivate enemies
instance_destroy(enemies);

// Stop sanity demon from spawning
instance_destroy(demonSpawner);

alarm[0] = 3 * room_speed;