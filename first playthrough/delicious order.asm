# read in the bytes to sort
label read_byte
ADDri RIN 0 RAM
ADDri R0 1 R0
JEQri R0 15 load_done
ADDri R0 0 RAMadr
JEQii 0 0 read_byte

label load_done
# sort RAM
ADDii 13 0 R1 # set end point
ADDii 0 0 R0 # set start point
label check_again
# copy the value at current address
ADDri R0 0 RAMadr
ADDri RAM 0 R2

# copy the value at the next address
ADDri R0 1 RAMadr
ADDri RAM 0 R3

# check if the positions need to 
# be swapped
JLErr R2 R3 no_swap
CALL 0 0 swap
label no_swap
# check if we have reached the end
# point and need to# decrement the 
# end point and start over
JNErr R0 R1 no_decrement
ADDii 0 0 R0
SUBri R1 1 R1

# see if we are done entirely...
JEQri R1 255 finish_up

JEQii 0 0 check_again
label no_decrement
# increment our current address and 
# check again
ADDri R0 1 R0
JEQii 0 0 check_again

label swap
# Write R3 into address R0
# and R2 into R0+1. RAMadr
# will be pointing at R0+1 
# when we get here...
ADDri R2 0 RAM
ADDri R0 0 RAMadr
ADDri R3 0 RAM
RET 0 0 0 
label finish_up

# reset the RAM address to 0
ADDii 0 0 R0
label output_next_bit
ADDri R0 0 RAMadr
ADDri RAM 0 ROUT
ADDri R0 1 R0
JEQii 0 0 output_next_bit