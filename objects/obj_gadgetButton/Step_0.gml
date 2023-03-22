/// @description Insert description here
// You can write your code in this editor

if (position_meeting(mouse_x, mouse_y, id) 
&& mouse_check_button_pressed(mb_left))
{
	switch(obj_player.curGadget)
	{
		case GADGET.DASH:
			dash();
			log("dash activated");
			break;
		case GADGET.DECOY:
			decoy();
			log("decoy activated");
			break;
		case GADGET.GPS:
			gps();
			log("GPS activated");
			break;
		case GADGET.TELEPORT: 
			teleport(); 
			log("teleport activated");
			break;
		case GADGET.THERMAL:
			thermal();
			log("thermal activated");
			break;
	}
	
	log("clicked");
}