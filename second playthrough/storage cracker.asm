# reg0 = 1
1

# reg2 = reg0 (reg2 = 1)
reg0_to_reg2

label next

# try value in reg1 (starts at 0)
# but will inrecrement each loop
reg1_to_out

# increment reg1 by 1 (reg2)
# reg3 = reg1 + reg2
add

# reg1 = reg3
reg3_to_reg1

# load address of next
next 

# jump to next
jmp