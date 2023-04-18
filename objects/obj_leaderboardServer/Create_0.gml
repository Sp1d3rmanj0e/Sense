/// @description Insert description here
// You can write your code in this editor

global.ip = noone;

load_leaderboard_data(); // Get the local leaderboard data just in case
						 // the server doesn't connect

// Create a socket for the user to connect to the server
global.client = network_create_socket(network_socket_udp);

enum msgType {
	STORE_DATA,
	GET_DATA
}

// Thanks to https://www.reddit.com/r/gamemaker/comments/27yoe1/gms_networking_how_to_get_clients_local_ipv4/
// for the information

// Gets an ip from the client
randomize();
var port = irandom_range(49152,65535);
var host = network_create_server(network_socket_udp, port, 5);

if (host < 0)
{
    show_debug_message("Failed to create a broadcast server");
    game_end();
}
else
{
    var sock = network_create_socket(network_socket_udp);
    var buff = buffer_create(32, buffer_fixed, 1);
    
    buffer_fill(buff, 0, buffer_bool, 0, 32);
    network_send_broadcast(sock, port, buff, buffer_get_size(buff));
    
    network_destroy(sock);
    buffer_delete(buff);
}