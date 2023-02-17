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

// Animation frames
lSpriteFrame = 0;
rSpriteFrame = 0;

// Start heartbeat
alarm[0] = beatSpawnTime;

// Create a ds_list to store all beat x values
beats = ds_list_create();
#endregion

// Decorative sprites for every gadget
decSprites[GADGET.DASH] = [noone, noone];
decSprites[GADGET.ECHO] = [spr_echo_side_animation_left, spr_echo_side_animation_right];
decSprites[GADGET.LIGHT] = [noone, noone];
decSprites[GADGET.PHASE] = [noone, spr_phase_side_animation_right];
decSprites[GADGET.TASER] = [spr_taser_side_animation_left, spr_taser_side_animation_right];
decSprites[GADGET.TELEPORT] = [noone, noone];
decSprites[GADGET.NONE] = [noone, noone];