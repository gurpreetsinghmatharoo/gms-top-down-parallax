/// @description 
moveX = 0;
moveY = 0;
moveSpeed = 5;
moveDir = 3;

enum ST {
	IDLE,
	RUN
}

state = ST.IDLE;

sprites[ST.IDLE, 0] = sP_idle_0;
sprites[ST.IDLE, 1] = sP_idle_1;
sprites[ST.IDLE, 2] = sP_idle_2;
sprites[ST.IDLE, 3] = sP_idle_3;
sprites[ST.RUN, 0] = sP_run_0;
sprites[ST.RUN, 1] = sP_run_1;
sprites[ST.RUN, 2] = sP_run_2;
sprites[ST.RUN, 3] = sP_run_3;