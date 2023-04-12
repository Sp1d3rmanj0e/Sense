/// @description Insert description here
// You can write your code in this editor

#region unused code

#region beat vars
// Beat checkpoints
//startBeatX = 358;
//endBeatX = 910;

// Beat vars
//beatSpawnTime = 30;
//beatSpeed = 2;

// Animation frames
//lSpriteFrame = 0;
//rSpriteFrame = 0;

// Start heartbeat
//alarm[0] = beatSpawnTime;

//// Create a ds_list to store all beat x values
//beats = ds_list_create();
#endregion

// Decorative sprites for every gadget [left decoration, right decoration]
//decSprites[GADGET.ECHO]     = [spr_echo_side_animation_left, spr_echo_side_animation_right];
//decSprites[GADGET.NIGHTVIS] = [spr_night_vision_side_animation_left, spr_night_vision_side_animation_right]
//decSprites[GADGET.TASER]    = [spr_taser_side_animation_left, spr_taser_side_animation_right];
//decSprites[GADGET.TELEPORT] = [spr_teleport_side_animation_left, spr_teleport_side_animation_right];
//decSprites[GADGET.NONE]     = [noone, noone];

#endregion unused code

#region healthbars
// View properties
camWidth = camera_get_view_width(view_camera[0]);
	
// Bar properties
healthbarWidth = 500;
usesBarWidth = 400;
barHeight = 20;
rightPadding = sprite_get_width(spr_gadget_button)*1.75; // Push the bars left from the right wall by this value
topPadding = 10; // Spacing between the roof and other bars
	
// Bar locations
barEnd			= camWidth - rightPadding;
healthbarStart	= barEnd - healthbarWidth;
usesBarStart	= barEnd - usesBarWidth;

// Bar colors
healtbarColor = make_color_rgb(158, 11, 15);
usesBarColor = #7A95A1;
#endregion healthbars

#region heartrate monitor



#endregion heartrate monitor