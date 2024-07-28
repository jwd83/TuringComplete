ADDii 0 0 ROUT # turn left
ADDii 1 0 ROUT # move forward
ADDii 0 0 ROUT # turn left
ADDii 1 0 ROUT # move forward
ADDii 1 0 ROUT # move forward
ADDii 1 0 ROUT # move forward
ADDii 1 0 ROUT # move forward
ADDii 0 0 ROUT # turn left
ADDii 1 0 ROUT # move forward
ADDii 2 0 ROUT # turn right
ADDii 1 0 ROUT # move forward
label check_fruit
ADDii 3 0 ROUT # enjoy the moment
# check the robots vision
ADDri RIN 0 R0
JEQri R0 92 check_fruit
# fruit was detected....
# check if the fruit exists in RAM
# start at the first memory address
# in r1 and work our way up towards 
# the end at r2
label check_again
JEQrr R1 R2 check_done
# load the fruit from RAM into R3
# and check if it matches the value
# in r0
ADDri R1 0 RAMadr # set RAM address
# ADDri RAM 0 R3 # copy RAM to r3
# JEQrr R0 R3 stop_line # if seen
JEQrr R0 RAM stop_line
ADDri R1 1 R1 # increment r1
JEQii 0 0 check_again
label check_done
ADDri R1 0 RAMadr # set RAM address
# write fruit to the address at R1
ADDri R0 0 RAM
ADDri R2 1 R2 # increment r2
ADDii 0 0 R1 # clear r1
JEQii 0 0 check_fruit
label stop_line
ADDii 2 0 ROUT # turn right
ADDii 4 0 ROUT # use action (stop!)
