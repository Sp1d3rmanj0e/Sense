/// @description Insert description here
// You can write your code in this editor

// Movement
keyRight = keyboard_check(ord("D"));
keyLeft = keyboard_check(ord("A"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

hsp = (keyRight - keyLeft) * walkSp;
vsp = (keyDown - keyUp) * walkSp;

x += hsp;
y += vsp;