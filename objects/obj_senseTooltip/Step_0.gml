/// @description Find the sense to use

// 0 = sight & smell
// 1 = Goo or webs
// 2 = Hearing
// 3 = Feeling

/*
 * Check Procedure:
 *
 * Ensure mouse is on on any UI element
 *
 * Sound Icon Pressed - Sound Tooltip
 * else
 * Taste Icon Pressed - Taste Tooltip
 * else
 * If on floor - Sight and Smell Tooltip
 * else
 * If on wall - Feel Tooltip
 */
 
if (distance_to_object(obj_player) > maxRadius)
{
    image_alpha = 0;
}
else
{
    // Become visible
    image_alpha = 1;

    // Get the tile the mouse is on
    var _tileAtMouse = tilemap_get_at_pixel(tilemap, mouse_x, mouse_y);
 
    if (position_meeting(mouse_x, mouse_y, obj_soundIcon)) // If able to hear
    {
        image_index = 2;
    }
    else if (position_meeting(mouse_x, mouse_y, cleanable)) // If mouse is on a pet of an enemy
    {
        image_index = 1;
    }
    else if (_tileAtMouse == 0) // Mouse is on floor
    {
        image_index = 0;
    }
    else // Mouse is on a wall
    {
        image_index = 3;
    }
}
 
// Go to player mouse
x = mouse_x;
y = mouse_y;