/// @description Get name input

if (string_length(keyboard_string) > 15)
{
	keyboard_string = string_copy(keyboard_string, 1, 15);	// Only keep the first 15 characters
}

name = keyboard_string;										// Set the name to the new input