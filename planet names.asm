ADDii 32 0 R1 # ucase value
label start
ADDri RIN 0 R0 # grab character
JEQri R1 32 ucase # check ucase value
JEQri R0 32 space # if space
ADDri R0 0 ROUT # character out
JEQii 0 0 start

label space
ADDii 32 0 R1
ADDri R0 0 ROUT # character out
JEQii 0 0 start
 
label ucase
SUBrr R0 R1 R0 # perform uppercase
ADDii 0 0 R1 # clear ucase value
ADDri R0 0 ROUT # character out
JEQii 0 0 start
