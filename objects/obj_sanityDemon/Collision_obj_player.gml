/// @description Insert description here
// You can write your code in this editor

// Make player lose all lives
obj_player.playerHealth = 1;
with(obj_player) takeDmg(other.object_index);
