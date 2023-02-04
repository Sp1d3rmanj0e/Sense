/// @description Insert description here
// You can write your code in this editor

#region beat vars
// Beat checkpoints
startBeatX = 358;
endBeatX = 945;

// Beat Location
beatY = 551 

// Beat vars
beatSpawnTime = 30;
beatSpeed = 2;

// Start heartbeat
alarm[0] = beatSpawnTime;

// Create a ds_list to store all beat x values
beats = ds_list_create();
#endregion