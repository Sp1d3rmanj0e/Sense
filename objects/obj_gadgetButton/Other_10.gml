/// @description Create gadgetGUI object

var _activationObj;
switch(obj_player.curGadget)
{
	case GADGET.DASH:		_activationObj = obj_dash;		break;
	case GADGET.GPS:		_activationObj = obj_gps;		break;
	case GADGET.LURE:		_activationObj = obj_lure;		break;
	case GADGET.TELEPORT:	_activationObj = obj_teleporter; break;
	case GADGET.THERMAL:	_activationObj = obj_heat;		break;
}

if (instance_exists(obj_gadgetGUI)) instance_destroy(obj_gadgetGUI);
instance_create_layer(0, 0, "GUI", obj_gadgetGUI, {activationObj : _activationObj});