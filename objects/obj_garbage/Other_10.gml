/// @description Garbage collection

obj_player.trashCollected++;
instance_create_depth(x,y,depth+1,obj_poof);

audio_play_sound(snd_GPS_pickedUp, 1, 0);

instance_destroy();