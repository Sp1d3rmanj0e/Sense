/// @description Insert description here
// You can write your code in this editor

if (position_meeting(mouse_x, mouse_y, id) 
&& mouse_check_button_pressed(mb_left))
{
	switch(obj_player.curGadget)
	{
		case GADGET.ECHO:
			break;
		case GADGET.NIGHTVIS:
			nightvis();
			log("nightvis activated");
			break;
		case GADGET.TASER:
			break;
		case GADGET.TELEPORT: 
			teleport(); 
			log("teleport activated");
			break;
	}
	
	log("clicked");
}