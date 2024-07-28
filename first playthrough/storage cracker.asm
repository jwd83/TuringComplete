# increment by 16
16
MOV+DR0+DR2
# start with 15
63
MOV+SR0+DR5
MOV+SR0+DROUT
label again
MOV+SRIN+DR3
too_high
JNZ 
MOV+SR5+DR1
ADD
MOV+SR3+DR5
MOV+SR3+DROUT

again
JMP

label too_high
1
MOV+SR0+DR2
MOV+SR5+DR1
label sub_again
SUB
MOV+SR3+DROUT
MOV+SR3+DR1
sub_again
JMP