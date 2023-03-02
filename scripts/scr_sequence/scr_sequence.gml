// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.midTransition = false;

// Creates a layer for the sequence to be on
function TransitionPlaceSequence(_type)
{
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999, "transition");
	layer_sequence_create(_lay, 0, 0, _type);
}

// Create the transition
function TransitionStart(_type)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		TransitionPlaceSequence(_type);
		return true;
	}
	else return false;
}

// End the transition
function TransitionFinished()
{
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}

// Might need to just merge stair animation with sense loss animation
function TransitionBySense()
{
	// End the current transition before making a new one
	TransitionFinished();
	
	// Create a different seq based on the sense the player will lose
	switch(obj_player.curGadget) // This will be the one the player loses
	{
		case GADGET.NONE: TransitionStart(sq_loseSense) break;
		default: TransitionStart(sq_loseSense);
	}
}