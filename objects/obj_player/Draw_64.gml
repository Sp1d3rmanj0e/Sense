/// @description blood splatter effect

#region blood splatter

// Only draw blood splatter when the effect timer is still active
if (alarm[3] != -1)
{
	// Draw the blood splatter
	draw_sprite_ext(spr_blood_splatter, playerHealth, 
	0, 0, 1, 1, 0, c_white, alarm[3]/bloodEffectTime);
}

#endregion blood splatter