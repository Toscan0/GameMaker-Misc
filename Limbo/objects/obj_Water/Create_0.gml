/// @description 

bodyX = x;				// top-left x-pos
bodyY = y;				// top-right y-pos
myW = sprite_width;
bodyWidth = myW;		// hor span of body
bodyHeight = sprite_height;		// vert span of body

columns = 15;			// springs
columnWidth = (bodyWidth / columns);

// define columns (springs), indexes in misc arrays
for(var i = 0; i < columns; i++) {
	Height[i] = bodyHeight;
	TargetHeight[i] = bodyHeight;
	Speed[i] = 0;
	
	leftDelta[i] = 0;	// difference between i and (i - 1) spring's height
	rightDelta[i] = 0;	// difference between i and (i + 1) spring's height
}

Dampening = 0.025;		// lower = longer spring oscillation
Tension = 0.025;		// higher = more "stiff", lower = looser and more "springy"
Spread = 0.1;			// higher = waves spread fast & more "jello"-like

passes = 4;				// pulls on neighbors per game step

timer = 20;