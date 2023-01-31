// Door vars
openable = false;
// doorOpen = most likely false

// Put a wall under the door if
// the door started out closed
if (!doorOpen) event_user(0);

// Timers
interactDelay = 1;
interactDelayTimer = -1;