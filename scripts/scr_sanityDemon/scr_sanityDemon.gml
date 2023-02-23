// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sanityDemon()
{

// Slowly increase speed
eSpeed = min(eSpeed + (0.15/room_speed), scr_diffStats(4, 5, 6, 7));

}