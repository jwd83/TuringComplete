# navigate our robot to his 
# loation we want to shoot from
0
MOV+SR0+DROUT
1
MOV+SR0+DROUT
1
MOV+SR0+DROUT
2
MOV+SR0+DROUT
1
MOV+SR0+DROUT
1
MOV+SR0+DROUT
1
MOV+SR0+DROUT
1
MOV+SR0+DROUT
1
MOV+SR0+DROUT
2
MOV+SR0+DROUT
# load R2 with 1 to subtract
# from R1 each shot fired
1
MOV+SR0+DR2
# load R1 with number of shots 
# to fire before turn operation
label load_counter
4
MOV+SR0+DR1
label wait_for_vision
MOV+SRIN+DR3
shoot_once
JNZ
3
MOV+SR0+DROUT
wait_for_vision
JMP
label shoot_once
# perform shoot action
5
MOV+SR0+DROUT
# subtract r2 (1) from r1 (# shots)
SUB
# store result in r1
MOV+SR3+DR1
# check if result was zero to
# jump to turn logic
turn_and_reload
JZ
# otherwise wait for vision
# again
wait_for_vision
JMP
label turn_and_reload
0
MOV+SR0+DROUT
0
MOV+SR0+DROUT
load_counter
JMP