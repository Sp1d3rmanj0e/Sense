/// @description

scale = 3;
scaleSpeed = 0.0035;

alpha = 1;							// Control the alpha of the image
alphaDirection = 0;					// Control whether fading in or out
fadeTime = 1*room_speed;			// How long to complete the fade transition
fadeSpeed = 1 / fadeTime;			// How much alpha to remove per frame to meet 
fadeBuffer = 140;					// How much space before the image edges start to appear
									//     before starting the fade transition
									
darknessAlpha = 0.5;

fadeActivated = false;

function fadeTransition()
{
	if (!fadeActivated)
	{
		fadeActivated = true;
		alphaDirection = -fadeSpeed;
		alarm[0] = fadeTime;
	}
}

// Move the image around a little bit to give
// some variety in scaling motion
function randomizeImageLocation()
{
	x = irandom_range(room_width/4, room_width * (3/4));
	y = irandom_range(room_height/4, room_height * (3/4));
}

function changeImage()
{
	scale = 3; // Reset the scale
	image_index++; // Switch to new image
	
	randomizeImageLocation();
}