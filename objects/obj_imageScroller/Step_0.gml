/// @description

// Slowly scale out of image
scale -= scaleSpeed;
image_xscale = scale;
image_yscale = scale;

// Fade in / out the image
image_alpha = alpha;
alpha = clamp(alpha + alphaDirection, 0, 1);


// Calculate when to start the fade transition
var _startFade = ((bbox_left+fadeBuffer >= 0) 
			 || (bbox_right-fadeBuffer <= room_width) 
			 || (bbox_top+fadeBuffer >= 0) 
			 || (bbox_bottom-fadeBuffer <= room_height));

if (_startFade) fadeTransition();