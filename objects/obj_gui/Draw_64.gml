/// @description Insert description here
// You can write your code in this editor

// Draw UI Backdrop
draw_sprite(spr_ui_bar, 0, 0, 0);

//draw_sprite(spr_heart_rate, 0, beatX, beatY);

for (var i = 0; i < ds_list_size(beats); i++)
{
	// Draw a hearbeat for every instance in the ds_list
	draw_sprite(spr_heart_rate, 0, ds_list_find_value(beats, i), beatY);
}

// Draw heart rate covers
draw_sprite(spr_heart_rate_caps, 0, 359, 570);