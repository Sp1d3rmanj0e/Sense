/// @description Insert description here
// You can write your code in this editor

#region beat vars
// Beat checkpoints
startBeatX = 358;
endBeatX = 910;

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

// Decorative sprites for every gadget [left decoration, right decoration]
decSprites[GADGET.ECHO]     = [spr_echo_side_animation_left, spr_echo_side_animation_right];
decSprites[GADGET.NIGHTVIS] = [spr_night_vision_side_animation_left, spr_night_vision_side_animation_right]
decSprites[GADGET.TASER]    = [spr_taser_side_animation_left, spr_taser_side_animation_right];
decSprites[GADGET.TELEPORT] = [spr_teleport_side_animation_left, spr_teleport_side_animation_right];
decSprites[GADGET.NONE]     = [noone, noone];