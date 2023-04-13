/// @description Create gadgetGUI object

switch(obj_player.curGadget)
{
	case GADGET.DASH:		activationObj = obj_dash;		break;
	case GADGET.GPS:		activationObj = obj_gps;		break;
	case GADGET.LURE:		activationObj = obj_lure;		break;
	case GADGET.TELEPORT:	activationObj = obj_teleporter; break;
	case GADGET.THERMAL:	activationObj = obj_heat;		break;
}

instance_create_layer(0, 0, "GUI", obj_gadgetGUI, {activationObj : activationObj});