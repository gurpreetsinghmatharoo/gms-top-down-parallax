/// @description
// States
switch (state) {
	case ST.IDLE: case ST.RUN:
		var _dir = point_direction(0, 0, inputX, inputY);
		moveX = inputX * moveSpeed * abs(dcos(_dir));
		moveY = inputY * moveSpeed * abs(dsin(_dir));
		
		if (moveX != 0 || moveY != 0) {
			state = ST.RUN;
		}
		else {
			state = ST.IDLE;
		}
	break;
}

// Collisions
if (place_meeting(x + moveX, y, oCollision)) {
	while (!place_meeting(x + sign(moveX), y, oCollision)) {
		x += sign(moveX);
	}
	
	moveX = 0;
}

if (place_meeting(x, y + moveY, oCollision)) {
	while (!place_meeting(x, y + sign(moveY), oCollision)) {
		y += sign(moveY);
	}
	
	moveY = 0;
}

// Move
x += moveX;
y += moveY;

// Sprite
var _dir = point_direction(0, 0, moveX, moveY);
_dir = round(_dir / 90) mod 4;

if (moveX != 0 || moveY != 0) {
	moveDir = _dir;
}

sprite_index = sprites[state, moveDir];