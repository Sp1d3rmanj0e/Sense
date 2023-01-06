/// @description Insert description here
// You can write your code in this editor

if (room != rm_testingHub)
{
	draw_set_color(c_fuchsia);

	draw_text(0,0, "Selected row: " + string(scrlY));

	// Show selected entity name
	draw_text(0,20, "(0) Selected entity: " + string(selEntity) + " : (" 
			  + string(entityCnt) + "/" + string(maxEntities) + ") : " + "Press [T] to reset");

	// Show lights on/off + Hotkey
	draw_text(0,40, "(1) Lights: " + string(lightsOn));

	// Current speed
	draw_text(0,60, "(2) Current enemy speed: " + string(curSpd));

	// Start / Stop simulation status + hotkey
	draw_text(0,80, "(3) Sim running: " + string(simRunning));

	// Show view ring
	draw_text(0,100, "(4) View ring: " + string(viewRing));
	
	// Show view range
	draw_text(0,120, "(5) View range: " + string(viewRange));

	draw_text(0,140, "Go back --> [Q]");

	draw_set_color(c_black);
}