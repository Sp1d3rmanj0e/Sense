/// @description Insert description here
// You can write your code in this editor

if (position_meeting(mouse_x, mouse_y, id) 
&& (mouse_check_button_pressed(mb_left)) 
|| (keyboard_check_pressed(global.kb_keyGadgetActivate))
|| (gamepad_button_check_pressed(global.connectedPad, gp_shoulderlb)))
{
	audio_play_sound(snd_buttonPressed, 1, 0);
	
	switch(obj_player.curGadget)
	{
		case GADGET.DASH:
			dash();
			log("dash activated");
			break;
		case GADGET.LURE:
			lure();
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
	
	// Only spawn UI if a gadget exists
	if (obj_player.curGadget != GADGET.NONE)
		event_user(0);
}