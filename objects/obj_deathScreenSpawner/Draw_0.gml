/// @description Insert description here
// You can write your code in this editor

// Spawn jumpscare at the bottom middle of the screen
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// Draw a black background
with(obj_player)
{
	//draw_set_color(c_black);
	//draw_rectangle(_camX, _camY, _camX+_camWidth, _camY+_camHeight, false);
}

// Remove all the GUI
instance_destroy(obj_gui);

// Set player sene to none
obj_player.curSense = SENSE.NONE;

// Get the object of the enemy that killed the player
// to find what jumpscare sprite to use
var _enemy = enemyThatKilledPlayer;
var _jumpscareSprite = noone;

switch(_enemy)
{
	case obj_spider:		_jumpscareSprite = spr_jumpscareSpider; break;
	case obj_mimic:			_jumpscareSprite = spr_jumpscareMimic; break;
	case obj_ghost:			_jumpscareSprite = spr_jumpscareGhost; break;
	case obj_sanityDemon:	_jumpscareSprite = spr_jumpscareDemon; break;
	case obj_eyeball:		_jumpscareSprite = spr_jumpscareEye; break;
	default: _jumpscareSprite = spr_distraction_box_item_active;
}

draw_sprite(_jumpscareSprite, 0, _camX + _camWidth/2, _camY + _camHeight/2);