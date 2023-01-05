/// @description Retarget Player

// Chase player
goto(path, obj_player.x, obj_player.y, eSpeed, global.grid);

alarm[0] = 0.25 * room_speed;