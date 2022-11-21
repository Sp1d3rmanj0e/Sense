/// @description See the mp_path

if (keyboard_check(vk_f1))
{
	var tile_size = WORLD.TILE_SIZE
	
	draw_set_alpha(0.1);
	draw_set_color(c_white);
	mp_grid_draw(global.grid);
	for (var i = 0; i < room_width; i += tile_size)
	{
		draw_line_width(i, 0, i, room_height, 3); // Vertical Lines
		draw_line_width(0, i, room_width, i, 3); // Horizontal Lines
	}
	draw_set_alpha(1);
	draw_path(global.grid, x, y, true);

}