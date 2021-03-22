/// @description 
for (var i = 0; i < columns; i++) {
	// the spring logic
    var Displacement = (TargetHeight[i] - Height[i]);
    Speed[i] += (Tension * Displacement) - (Dampening * Speed[i]);
    Height[i] += Speed[i];

	// reset deltas each game step
    leftDelta[i] = 0;
    rightDelta[i] = 0;

	// set corner vars
    ColumnCorners(i);

	
    if (mouse_check_button(mb_left) &&
        point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
       Speed[i] -= 10;
    }	 
}


if (timer > 0) {
	timer--;
}
if (timer <= 0)
{
	Speed[0] -= 35;
	timer = 20;
}
	


// passes to pull on neighbors
for (var j = 0; j < passes; j++) {
    for (var i = 0; i < columns; i++) {
		// left neighbor
        if (i > 0) {
            leftDelta[i] = Spread * (Height[i] - Height[i - 1]);
            Speed[i - 1] += leftDelta[i];
        }
		// right neighbor
        if (i < columns - 1) {
            rightDelta[i] = Spread * (Height[i] - Height[i + 1]);
            Speed[i + 1] += rightDelta[i];
        }
    }

    for (var i = 0; i < columns; i++) {
		// left neighbor
        if (i > 0) {
            Height[i - 1] += leftDelta[i];
        }
		// right neighbor
        if (i < columns - 1) {
            Height[i + 1] += rightDelta[i];
        }
    }
}
