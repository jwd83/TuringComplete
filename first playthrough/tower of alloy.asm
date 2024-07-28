const _ 0

CALL _ _ load_regs
CALL _ _ move

label move
JNEri R0 0 skip
CALL _ _ place
RET _ _ _
label skip

SUBri R0 1 R0
# save registers in stack
PUSH R0 _ _  
PUSH R1 _ _  
PUSH R2 _ _  
PUSH R3 _ _ 
# swap r2 and r3
ADDri R2 0 R4
ADDri R3 0 R2
ADDri R4 0 R3
 
CALL _ _ move
POP _ _ R3
POP _ _ R2
POP _ _ R1
POP _ _ R0

CALL _ _ place
# swap R1 and R3
ADDri R1 0 R4
ADDri R3 0 R1
ADDri R4 0 R3
CALL _ _ move
RET _ _ _ 

label load_regs
ADDri RIN _ R0
ADDri RIN _ R1
ADDri RIN _ R2
ADDri RIN _ R3
RET _ _ _


label place
ADDri R1 _ ROUT
ADDii 5 _ ROUT
ADDri R2 _ ROUT
ADDii 5 _ ROUT
RET _ _ _