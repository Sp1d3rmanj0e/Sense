/// @description Insert description here
// You can write your code in this editor

obj_player.trashCollected++;
instance_create_depth(x,y,depth+1,obj_poof);
instance_destroy();