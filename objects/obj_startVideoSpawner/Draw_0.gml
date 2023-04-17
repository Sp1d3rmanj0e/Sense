/// @description draw the video

var _videoData = video_draw(); // Processes video
var _videoStatus = _videoData[0];
if (_videoStatus == 0) // Playing without error
{
	draw_surface(_videoData[1], 0, 0);
}
else event_user(0);