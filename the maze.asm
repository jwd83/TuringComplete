label start
1 # move forward
MOV+SR0+DROUT # perform action
4 # use item
MOV+SR0+DROUT # perform action
0 # turn left
MOV+SR0+DROUT # perform action
4 # use item
MOV+SR0+DROUT # perform action
label wall_check
# check if there is a wall
MOV+SRIN+DR3
start
JZ 
2 # turn right
MOV+SR0+DROUT # perform action
4 # use item
MOV+SR0+DROUT # perform action
wall_check 
JMP