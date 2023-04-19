// Import dgram
dgram = require('dgram');
fs = require('fs');

// Create a server with udp4 (GMS2 supported)
var server = dgram.createSocket('udp4');

// Activate whenever the server recieves a message
server.on("message", function(unparsed_data, rinfo) {

// Decode the message
console.log("< " + String(unparsed_data));
parsed_data = JSON.parse(unparsed_data);

var command = parsed_data[0];
console.log("msg[0] " + command);

switch(command)
{
    case 0: // Get data from client
        fs.writeFileSync('leaderboardData.txt', unparsed_data); // Overwrite leaderboard data
        console.log("we are in the get data function");
        break;
    case 1: // Send data to client
        leaderboard_data = fs.readFileSync('leaderboardData.txt', 'utf8');
        server.send(leaderboard_data, rinfo.port, rinfo.address);
        console.log(">" + leaderboard_data);
        console.log("We are in the send data function");
        break;
}
});

server.bind(8080);